{stdenv, fetchurl, yacc, flex, pkgconfig, glib, xz}:

stdenv.mkDerivation rec {

  version = "0.18.1";
  name = "vala-${version}";

  src = fetchurl {
    url = "mirror://gnome/sources/vala/0.18/${name}.tar.xz";
    sha256 = "0cnaplhw1gf6m5xk62h01fhx0yisvjzr7bxc2g7s57rzl262wpkz";
  };

  buildNativeInputs = [ yacc flex pkgconfig xz ];

  buildInputs = [ glib ];

  meta = {
    description = "Compiler for the GObject type system";
    homepage = "http://live.gnome.org/Vala";
    license = "free-copyleft";
    platforms = stdenv.lib.platforms.all;
    maintainers = [ stdenv.lib.maintainers.antono ];
  };
}
