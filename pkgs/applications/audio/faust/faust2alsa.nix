{ stdenv, makeWrapper, pkgconfig
, faust
, alsaLib
, atk
, cairo
, fontconfig
, freetype
, gdk_pixbuf
, glib
, gtk2
, pango
}@deps:

stdenv.mkDerivation (faust.wrapWithBuildEnv deps {

  baseName = "faust2alsa";

  propagatedBuildInputs = [
    alsaLib
    atk
    cairo
    fontconfig
    freetype
    gdk_pixbuf
    glib
    gtk2
    pango
  ];

})
