{ stdenv, fetchurl, pkgconfig, intltool, gnome, glib, sqlite, python
, systemd, polkit
}:

stdenv.mkDerivation rec {
  name = "PackageKit-${version}";
  version = "0.8.6";

  src = fetchurl {
    url = "http://www.packagekit.org/releases/${name}.tar.xz";
    sha256 = "0y52di6y4j9wxsjpnarmgv84a8ap7bzzg8aplfblp0f5j5ykxzik";
  };

  configureFlags = [
    "--with-systemdsystemunitdir=$(out)/etc/systemd/system"
    "--with-systemdutildir=$(out)/lib/systemd/system-sleep"
  ];

  buildInputs = [
    pkgconfig intltool gnome.gtkdoc glib sqlite python systemd
    polkit
  ];
}
