#!/usr/bin/env bash
#
# md2pdf.sh: Markdown to PDF, no external dependency beyond a Chromium browser.
#
# Why: contractual templates live as Markdown in this repo, but a client
# receives a PDF. Pandoc would need a LaTeX toolchain; a Chromium browser
# prints to PDF natively. Works on macOS and Linux with Chrome, Chromium,
# Edge, Brave or Playwright's Chromium; CHROME_BIN forces one.
#
# What it does:
#   1. strips the blocks meant for the author, not the client:
#      the leading blockquote and every <details> section
#   2. converts the remaining Markdown to standalone HTML
#   3. prints that HTML to PDF with headless Chrome
#
# REGLE : travailler sur une COPIE, jamais sur le modele du depot.
#   cp templates/freelance/fr/devis.md ~/Documents/clients/x/devis-2026-001.md
#   puis remplir les [crochets] de la copie, puis generer.
#
# Conventions de ces modeles, dont depend le nettoyage :
#   - une ligne commencant par '>' est une consigne d auteur, jamais du
#     contenu contractuel : elle est retiree. Ne pas citer avec '>'.
#   - un bloc <details> est une annexe interne : il est retire.
#
# Usage:
#   ./md2pdf.sh templates/freelance/fr/cgv.md
#   ./md2pdf.sh templates/freelance/fr/cgv.md ~/Documents/CGV-v1.0.pdf
#
set -euo pipefail

SRC="${1:?usage: md2pdf.sh <fichier.md> [sortie.pdf]}"
OUT="${2:-${SRC%.md}.pdf}"

[ -f "$SRC" ] || { echo "Fichier introuvable : $SRC" >&2; exit 1; }

# Trouve un navigateur de la famille Chromium (le seul moteur qui imprime en
# PDF depuis la ligne de commande ; Firefox et Safari ne le font pas).
# Ordre : CHROME_BIN, puis le PATH (Linux), puis les applications macOS,
# puis le Chromium telecharge par Playwright.
trouver_navigateur() {
  if [ -n "${CHROME_BIN:-}" ]; then
    [ -x "$CHROME_BIN" ] || { echo "CHROME_BIN n'est pas executable : $CHROME_BIN" >&2; return 1; }
    printf '%s\n' "$CHROME_BIN"; return 0
  fi
  local nom chemin
  for nom in google-chrome google-chrome-stable chromium chromium-browser chrome \
             microsoft-edge microsoft-edge-stable brave-browser; do
    if chemin="$(command -v "$nom" 2>/dev/null)"; then printf '%s\n' "$chemin"; return 0; fi
  done
  for chemin in \
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    "/Applications/Chromium.app/Contents/MacOS/Chromium" \
    "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" \
    "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"; do
    if [ -x "$chemin" ]; then printf '%s\n' "$chemin"; return 0; fi
  done
  local cache
  for cache in "$HOME/.cache/ms-playwright" "$HOME/Library/Caches/ms-playwright"; do
    [ -d "$cache" ] || continue
    chemin="$(find "$cache" -type f \( -name chrome -o -name chrome-headless-shell -o -name Chromium \) \
              -perm -u+x 2>/dev/null | sort | tail -n 1)"
    if [ -n "$chemin" ]; then printf '%s\n' "$chemin"; return 0; fi
  done
  return 1
}

CHROME="$(trouver_navigateur)" || {
  echo "Aucun navigateur Chromium trouve (Chrome, Chromium, Edge, Brave)." >&2
  echo "En installer un (Linux : 'npx playwright install chromium' ou le paquet chromium)," >&2
  echo "ou definir CHROME_BIN vers son executable." >&2
  exit 1
}

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
HTML="$TMP/doc.html"

python3 - "$SRC" "$HTML" <<'ENDOFPY'
# -*- coding: utf-8 -*-
import io, re, sys, html as H

src, dst = sys.argv[1], sys.argv[2]
t = io.open(src, encoding='utf-8').read()

# Ce qui ne part pas au client : les citations d'aide et les blocs <details>.
# Toutes les lignes '>' partent, ou qu'elles soient : dans ces modeles la
# citation ne sert qu'aux notes d'auteur, jamais au contenu contractuel.
t = re.sub(r'^>.*\n?', '', t, flags=re.M)
t = re.sub(r'<details>.*?</details>\s*', '', t, flags=re.S)
t = re.sub(r'\n{3,}', '\n\n', t).strip()

def inline(x):
    x = H.escape(x, quote=False)
    x = re.sub(r'`([^`]+)`', r'<code>\1</code>', x)
    x = re.sub(r'\*\*([^*]+)\*\*', r'<strong>\1</strong>', x)
    x = re.sub(r'(?<!\*)\*([^*]+)\*(?!\*)', r'<em>\1</em>', x)
    x = re.sub(r'(?<![\w_])_([^_\n]+)_(?![\w_])', r'<em>\1</em>', x)
    x = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', x)
    return x

out, lignes, i = [], t.split('\n'), 0
while i < len(lignes):
    l = lignes[i]
    if re.match(r'^\s*$', l):
        i += 1; continue
    if l.startswith('---'):
        out.append('<hr>'); i += 1; continue
    m = re.match(r'^(#{1,6})\s+(.*)$', l)
    if m:
        n = len(m.group(1))
        out.append('<h%d>%s</h%d>' % (n, inline(m.group(2)), n)); i += 1; continue
    if l.lstrip().startswith('|'):                       # tableau
        bloc = []
        while i < len(lignes) and lignes[i].lstrip().startswith('|'):
            bloc.append(lignes[i]); i += 1
        cells = lambda r: [c.strip() for c in r.strip().strip('|').split('|')]
        corps = [r for r in bloc[1:] if not re.match(r'^\s*\|[\s:|-]+\|\s*$', r)]
        out.append('<table><thead><tr>' + ''.join('<th>%s</th>' % inline(c) for c in cells(bloc[0])) + '</tr></thead><tbody>')
        for r in corps:
            out.append('<tr>' + ''.join('<td>%s</td>' % inline(c) for c in cells(r)) + '</tr>')
        out.append('</tbody></table>'); continue
    if re.match(r'^\s*[-*]\s+', l):                      # liste a puces
        out.append('<ul>')
        while i < len(lignes) and re.match(r'^\s*[-*]\s+', lignes[i]):
            out.append('<li>%s</li>' % inline(re.sub(r'^\s*[-*]\s+', '', lignes[i]))); i += 1
        out.append('</ul>'); continue
    if re.match(r'^\s*\d+\.\s+', l):                     # liste numerotee
        out.append('<ol>')
        while i < len(lignes) and re.match(r'^\s*\d+\.\s+', lignes[i]):
            out.append('<li>%s</li>' % inline(re.sub(r'^\s*\d+\.\s+', '', lignes[i]))); i += 1
        out.append('</ol>'); continue
    par = []                                             # paragraphe
    while i < len(lignes) and lignes[i].strip() and not re.match(r'^(#{1,6}\s|---|\s*[-*]\s|\s*\d+\.\s|\s*\|)', lignes[i]):
        par.append(lignes[i].strip()); i += 1
    out.append('<p>%s</p>' % inline(' '.join(par)))

titre = re.search(r'^#\s+(.*)$', t, re.M)
titre = titre.group(1) if titre else 'Document'

io.open(dst, 'w', encoding='utf-8').write("""<!doctype html><html lang="fr"><head><meta charset="utf-8"><title>%s</title>
<style>
 @page { size: A4; margin: 20mm 18mm 22mm; }
 body { font: 10.5pt/1.55 -apple-system, "Helvetica Neue", Arial, "Liberation Sans", "DejaVu Sans", sans-serif; color: #1a1a1a; }
 h1 { font-size: 20pt; margin: 0 0 4pt; }
 h2 { font-size: 12pt; margin: 18pt 0 5pt; padding-bottom: 3pt; border-bottom: 1px solid #d8d8d8; break-after: avoid; }
 h3 { font-size: 10.5pt; margin: 12pt 0 3pt; break-after: avoid; }
 p, li { orphans: 3; widows: 3; }
 ul, ol { margin: 5pt 0 5pt 16pt; padding: 0; }
 li { margin-bottom: 2pt; }
 hr { border: 0; border-top: 1px solid #d8d8d8; margin: 14pt 0; }
 table { border-collapse: collapse; width: 100%%; margin: 8pt 0; font-size: 9.5pt; break-inside: avoid; }
 th, td { border: 1px solid #ccc; padding: 4pt 6pt; text-align: left; vertical-align: top; }
 th { background: #f2f2f2; }
 code { font-family: "SF Mono", Menlo, monospace; font-size: 9pt; background: #f2f2f2; padding: 1pt 3pt; border-radius: 2px; }
 a { color: #1a1a1a; text-decoration: underline; }
 strong { font-weight: 600; }
</style></head><body>
%s
</body></html>""" % (H.escape(titre), '\n'.join(out)))
ENDOFPY

# Le PDF est d'abord ecrit dans le dossier temporaire : un echec ne touche pas
# un PDF existant du meme nom, et un ancien PDF ne masque pas un echec.
PDF_TMP="$TMP/doc.pdf"

imprimer() {
  # Sous-shell termine par ':' : si le navigateur plante, c'est le sous-shell
  # qui ecrit le message de plantage, dans sa sortie redirigee.
  ( "$CHROME" --headless --disable-gpu --no-pdf-header-footer "$@" \
      --print-to-pdf="$PDF_TMP" "file://$HTML"; : ) >/dev/null 2>&1 || true
}

imprimer
if [ ! -s "$PDF_TMP" ]; then
  # Sur un serveur ou dans un conteneur, la sandbox de Chromium ne demarre
  # souvent pas (espaces de noms utilisateur restreints). Le document imprime
  # est notre propre fichier local, pas une page web : on peut s'en passer.
  echo "Sandbox du navigateur indisponible, nouvel essai sans sandbox." >&2
  imprimer --no-sandbox
fi

[ -s "$PDF_TMP" ] || { echo "Echec de la generation avec $CHROME" >&2; exit 1; }
TAILLE=$(wc -c < "$PDF_TMP" | tr -d " ")
[ "$TAILLE" -gt 8000 ] || { echo "PDF suspect, $TAILLE octets : conversion probablement vide" >&2; exit 1; }
mv "$PDF_TMP" "$OUT"
echo "$OUT  ($(du -h "$OUT" | cut -f1))"

# Garde-fou : un devis parti chez un client avec [nom] dedans, ca ne se
# rattrape pas. On compte ce qui reste apres avoir retire les blocs d auteur,
# donc seulement ce que le client verrait vraiment.
RESTE="$(python3 - "$SRC" <<'ENDOFCHECK'
import io, re, sys
t = io.open(sys.argv[1], encoding='utf-8').read()
t = re.sub(r'^>.*\n?', '', t, flags=re.M)
t = re.sub(r'<details>.*?</details>\s*', '', t, flags=re.S)
trous = [m.group(1) for m in re.finditer(r'\[([^\]\[\n]{1,60})\]', t)
         if not m.group(1).startswith(('http', ' ', 'x]'))]
print('\n'.join(trous))
ENDOFCHECK
)"
if [ -n "$RESTE" ]; then
  N="$(printf '%s\n' "$RESTE" | grep -c .)"
  echo
  echo "ATTENTION : $N champ(s) non rempli(s), visibles par le client :" >&2
  printf '%s\n' "$RESTE" | sort -u | sed 's/^/  [/; s/$/]/' >&2
fi
