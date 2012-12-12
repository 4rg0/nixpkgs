{ stdenv, fetchurl, pkgconfig, intltool, glib, gnome, gnome_doc_utils
, gtk2, gtk3, atk, json_glib, gobjectIntrospection
}:

let
  gtk3gir = gtk3.override { enableIntrospection = true; };
in stdenv.mkDerivation rec {
  name = "libdbusmenu-${version}";
  version = "12.10.2";

  src = fetchurl {
    url = "http://launchpad.net/dbusmenu/12.10/${version}/+download/${name}.tar.gz";
    sha256 = "1j84klglil1227f6vvhcrc0vcph9ib70q8z95snl5cqqp6hd8slx";
  };

  buildInputs = [
    pkgconfig intltool glib gnome.gtkdoc gnome_doc_utils
    gtk2 gtk3gir atk json_glib gobjectIntrospection
  ];
}
