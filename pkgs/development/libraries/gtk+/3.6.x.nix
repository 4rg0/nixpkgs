{ stdenv, fetchurl, pkgconfig, glib, atk, at_spi2_atk, pango, cairo, perl
, xlibs, gdk_pixbuf, xz
, xineramaSupport ? true
, cupsSupport ? true, cups ? null
, enableIntrospection ? false, gobjectIntrospection ? null
}:

assert xineramaSupport -> xlibs.libXinerama != null;
assert cupsSupport -> cups != null;
assert enableIntrospection -> gobjectIntrospection != null;

let
  pixbufGir = gdk_pixbuf.override {
    inherit enableIntrospection;
  };
  pangoGir = pango.override {
    inherit enableIntrospection;
  };
  atkGir = atk.override {
    inherit enableIntrospection;
  };
in stdenv.mkDerivation rec {
  name = "gtk+-3.6.2";

  src = fetchurl {
    url = "mirror://gnome/sources/gtk+/3.6/${name}.tar.xz";
    sha256 = "0g2izqjvwxkhhjrna5iqby9qi67ix1w0aa8ng3rsqf33azhz5k5a";
  };

  enableParallelBuilding = true;

  buildNativeInputs = [ perl pkgconfig ];

  propagatedBuildInputs =
    [ xlibs.xlibs glib pangoGir pixbufGir atkGir at_spi2_atk cairo
      xlibs.libXrandr xlibs.libXrender xlibs.libXcomposite xlibs.libXi
    ]
    ++ stdenv.lib.optional xineramaSupport xlibs.libXinerama
    ++ stdenv.lib.optionals cupsSupport [ cups ]
    ++ stdenv.lib.optional enableIntrospection gobjectIntrospection;

  postInstall = "rm -rf $out/share/gtk-doc";

  meta = {
    description = "A multi-platform toolkit for creating graphical user interfaces";

    longDescription = ''
      GTK+ is a highly usable, feature rich toolkit for creating
      graphical user interfaces which boasts cross platform
      compatibility and an easy to use API.  GTK+ it is written in C,
      but has bindings to many other popular programming languages
      such as C++, Python and C# among others.  GTK+ is licensed
      under the GNU LGPL 2.1 allowing development of both free and
      proprietary software with GTK+ without any license fees or
      royalties.
    '';

    homepage = http://www.gtk.org/;

    license = "LGPLv2+";

    maintainers = with stdenv.lib.maintainers; [urkud raskin];
    platforms = stdenv.lib.platforms.linux;
  };
}
