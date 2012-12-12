{ stdenv, fetchurl, python, pkgconfig, glib, gobjectIntrospection, icu }:

stdenv.mkDerivation rec {
  name = "dee-${version}";
  version = "1.0.14";

  src = fetchurl {
    url = "http://launchpad.net/dee/1.0/${version}/+download/${name}.tar.gz";
    sha256 = "0302lfndmplvv5crf70myhxh5vsisjs1czdqx2xnrvylnxz1hwqi";
  };

  buildInputs = [ python pkgconfig glib gobjectIntrospection icu ];
}
