{ stdenv, fetchurl, pkgconfig, libtool, glib, libsigcxx, gdk_pixbuf, cairo
, mesa, glew, x11, libXext, libXxf86vm, libXinerama, libXcomposite
, libXdamage, pango, pciutils, ibus, boost, geis
}:

stdenv.mkDerivation rec {
  name = "nux-${version}";
  version = "3.10.0";

  src = fetchurl {
    url = "http://launchpad.net/nux/3.0/3.10/+download/${name}.tar.gz";
    sha256 = "1h06hv74fv0a7fwcr91ca8f16qq70igyxgwbcs0xmbn94vzbjjnn";
  };

  buildInputs = [
    libtool pkgconfig glib libsigcxx gdk_pixbuf cairo mesa x11 libXext
    libXinerama libXcomposite libXdamage pango pciutils ibus boost
  ];

  propagatedBuildInputs = [ geis glew libXxf86vm ];

  enableParallelBuilding = true;
}
