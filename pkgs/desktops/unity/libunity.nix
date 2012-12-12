{ stdenv, fetchurl, pkgconfig, intltool, gnome, glib, gobjectIntrospection
, vala, python, libgee, dee, libdbusmenu, gtk3
}:

stdenv.mkDerivation rec {
  name = "libunity-${version}";
  version = "6.12.0";

  src = fetchurl {
    url = "http://launchpad.net/libunity/6.0/${version}"
        + "/+download/${name}.tar.gz";
    sha256 = "1nadapl3390x98q1wv2yarh60hzi7ck0d1s8zz9xsiq3zz6msbjd";
  };

  VALAC = with stdenv.lib; let
    pkgs = [ gobjectIntrospection libgee dee libdbusmenu ];
    argify = p: "--girdir=${p}/share/gir-1.0 --vapidir=${p}/share/vala/vapi";
    args = map argify pkgs;
  in "${vala}/bin/valac ${concatStringsSep " " args}";

  buildInputs = [
    pkgconfig intltool gnome.gnome_common glib gobjectIntrospection vala python
    libdbusmenu gtk3
  ];

  propagatedBuildInputs = [ dee libgee ];
}
