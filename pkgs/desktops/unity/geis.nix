{ stdenv, fetchurl, pkgconfig, python, dbus, grail, x11, libxcb, libXi
, xorgserver
}:

stdenv.mkDerivation rec {
  name = "geis-${version}";
  version = "2.2.14";

  src = fetchurl {
    url = "http://launchpad.net/geis/trunk/${version}/+download/${name}.tar.xz";
    sha256 = "1xrn267cr4d9q0akd02wvpjv1cjvyxzp1f2fi3191m3ph556m5f6";
  };

  buildInputs = [ pkgconfig python dbus grail x11 libxcb libXi xorgserver ];

  preConfigure = ''
    sed -i -e 's/ -Werror//g' configure
  '';
}
