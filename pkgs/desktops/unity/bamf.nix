{ stdenv, fetchurl, gnome, pkgconfig, gtk2, gtk3, gobjectIntrospection
, dbus_glib, libwnck3, libgtop, libunityWebapps, vala
}:

stdenv.mkDerivation rec {
  name = "bamf-${version}";
  version = "0.3.4";

  src = fetchurl {
    url = "http://launchpad.net/bamf/0.3/${version}/+download/${name}.tar.gz";
    sha256 = "0a4l91vqyqzzkgcahbaqg1hbh2fd53za3i187q1944i1g32kx9r5";
  };

  VALA_API_GEN = with stdenv.lib; let
    pkgs = [ gobjectIntrospection ];
    argify = p: "--girdir=${p}/share/gir-1.0 --vapidir=${p}/share/vala/vapi";
    args = map argify pkgs;
  in "${vala}/bin/vapigen ${concatStringsSep " " args}";

  buildInputs = [
    pkgconfig gnome.gtkdoc gtk2 gtk3 gobjectIntrospection dbus_glib libgtop
    libunityWebapps vala
  ];

  propagatedBuildInputs = [
    libwnck3
  ];
}
