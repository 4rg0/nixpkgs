{ stdenv, fetchurl, pkgconfig, at_spi2_core, dbus, glib, atk }:

stdenv.mkDerivation rec {
  name = "at-spi2-atk-${version}";
  version = "2.7.2";

  buildInputs = [ pkgconfig at_spi2_core dbus glib atk ];

  src = fetchurl {
    url = "mirror://gnome/sources/at-spi2-atk/2.7/${name}.tar.xz";
    sha256 = "dbce8f6828ec4be619d7c6db797385063ee2f7365dfe57d08eea013d61bf1a73";
  };
}
