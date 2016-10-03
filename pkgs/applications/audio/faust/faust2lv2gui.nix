{ stdenv, makeWrapper, pkgconfig
, boost
, faust
, lv2
, qt4
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2lv2";

  propagatedBuildInputs = [ boost lv2 qt4 ];

})
