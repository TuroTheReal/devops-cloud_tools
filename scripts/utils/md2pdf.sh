#!/usr/bin/env bash
#
# md2pdf.sh — Markdown to PDF, no external dependency beyond Chrome.
#
# Why: contractual templates live as Markdown in this repo, but a client
# receives a PDF. Pandoc would need a LaTeX toolchain; Chrome is already
# installed and prints to PDF natively.
#
# What it does:
#   1. strips the blocks meant for the author, not the client:
#      the leading blockquote and every <details> section
#   2. converts the remaining Markdown to standalone HTML
#   3. prints that HTML to PDF with headless Chrome
#
# Usage:
#   ./md2pdf.sh templates/freelance/fr/cgv.md
#   ./md2pdf.sh templates/freelance/fr/cgv.md ~/Documents/CGV-v1.0.pdf
#
set -euo pipefail

SRC="${1:?usage: md2pdf.sh <fichier.md> [sortie.pdf]}"
OUT="${2:-${SRC%.md}.pdf}"

CHROME="${CHROME_BIN:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[ -x "$CHROME" ] || { echo "Chrome introuvable : $CHROME" >&2; echo "Definir CHROME_BIN si installe ailleurs." >&2; exit 1; }
[ -f "$SRC" ]    || { echo "Fichier introuvable : $SRC" >&2; exit 1; }

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
 body { font: 10.5pt/1.55 -apple-system, "Helvetica Neue", Arial, sans-serif; color: #1a1a1a; }
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

"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$OUT" "file://$HTML" >/dev/null 2>&1

[ -f "$OUT" ] || { echo "Echec de la generation" >&2; exit 1; }
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
