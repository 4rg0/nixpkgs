{ stdenv, makeWrapper, pkgconfig
, faust
, jack2Full
, opencv
, qt4
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2jaqt";

  scripts = [
    "faust2jaqt"
    "faust2jackserver"
  ];

  propagatedBuildInputs = [
    jack2Full
    opencv
    qt4
  ];

})
