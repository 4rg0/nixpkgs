{ stdenv
, faust, makeWrapper, pkgconfig
, gtk2
, jack2Full
, opencv
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2jack";

  scripts = [
    "faust2jack"
    "faust2jackinternal"
    "faust2jackconsole"
  ];

  propagatedBuildInputs = [
    gtk2
    jack2Full
    opencv
  ];

})
