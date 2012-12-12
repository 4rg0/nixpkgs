{ stdenv, fetchurl, pkgconfig, glib, vala, gobjectIntrospection }:

stdenv.mkDerivation rec {
  name = "libgee-${version}";
  version = "0.6.7";

  src = fetchurl {
    url = "mirror://gnome/sources/libgee/0.6/${name}.tar.xz";
    sha256 = "0v8h2ha1pc55kvqy68hbav69ckidqhjw7yp59ck6mfzvhlbvy4mm";
  };

  prePatch = ''
    sed -i -r \
      -e "s|(INTROSPECTION_TYPELIBDIR=).*|\1\"$out/lib/girepository-1.0\"|" \
      -e "s|(INTROSPECTION_GIRDIR=).*|\1\"$out/share/gir-1.0\"|" \
      configure
  '';

  buildInputs = [ pkgconfig glib vala gobjectIntrospection ];

  meta = {
    description = "GObject collection library";
  };
}
