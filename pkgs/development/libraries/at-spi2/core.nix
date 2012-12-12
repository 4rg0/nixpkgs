{ stdenv, fetchurl, pkgconfig, intltool, dbus, glib
, x11, libXtst, libXi
}:

stdenv.mkDerivation rec {
  name = "at-spi2-core-${version}";
  version = "2.7.2";

  propagatedBuildInputs = [ pkgconfig intltool dbus glib x11 libXtst libXi ];

  src = fetchurl {
    url = "mirror://gnome/sources/at-spi2-core/2.7/${name}.tar.xz";
    sha256 = "da87a2a475014552f15ae5435c993ca54d47e5e68826165f643577dde99be355";
  };
}
