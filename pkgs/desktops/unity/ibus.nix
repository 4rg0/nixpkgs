{ stdenv, fetchurl, pkgconfig, intltool, glib, gtk2, gtk3, dbus
, gnome, python, pythonDBus, isocodes
}:

stdenv.mkDerivation  rec{
  name = "ibus-${version}";
  version = "1.4.2";

  src = fetchurl {
    url = "http://ibus.googlecode.com/files/${name}.tar.gz";
    sha1 = "a2d11d8bb64761691df918e9e50f0b35c711760d";
  };

  buildInputs = [
    pkgconfig intltool glib gtk2 gtk3 dbus
    gnome.GConf python pythonDBus isocodes
  ];
}
