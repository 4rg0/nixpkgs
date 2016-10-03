{ stdenv
, faust
, xdg_utils
}@deps:

# This just runs faust2svg, then attempts to open a browser using
# 'xdg-open'.

stdenv.mkDerivation (faust.wrap deps {

  baseName = "faust2firefox";

  runtimeInputs = [ xdg_utils ];

})
