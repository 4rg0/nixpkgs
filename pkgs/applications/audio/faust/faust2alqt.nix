{ stdenv, makeWrapper, pkgconfig
, faust
, alsaLib
, qt4
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2alqt";

  propagatedBuildInputs = [
    alsaLib
    qt4
  ];

})
