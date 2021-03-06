#! /bin/bash

if [ ! "$(which sassc 2> /dev/null)" ]; then
   echo sassc needs to be installed to generate the css.
   exit 1
fi

SASSC_OPT="-M -t expanded"

_COLOR_VARIANTS=('' '-dark')
if [ ! -z "${COLOR_VARIANTS:-}" ]; then
  IFS=', ' read -r -a _COLOR_VARIANTS <<< "${COLOR_VARIANTS:-}"
fi

for color in "${_COLOR_VARIANTS[@]}"; do
  sassc $SASSC_OPT src/gtk-3.0/gtk${color}.{scss,css}
  echo "==> Generating the gtk${color}.css..."
done
