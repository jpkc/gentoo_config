#!/bin/bash
# Concatenar arquivos PDF
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=tyScheme.pdf cover.pdf index.pdf preface.pdf ch01.pdf

# concatenar imagens direto para PDF
convert *.jpg  2022.09.11_Carta_pokemons_e_natal.pdf
