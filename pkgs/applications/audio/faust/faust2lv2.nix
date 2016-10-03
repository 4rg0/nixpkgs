{ stdenv, makeWrapper, pkgconfig
, faust
, lv2
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2lv2";

  propagatedBuildInputs = [ lv2 ];

})
