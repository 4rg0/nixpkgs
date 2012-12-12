{ stdenv, fetchurl, pkgconfig, frame, x11, libXi }:

stdenv.mkDerivation rec {
  name = "grail-${version}";
  version = "3.0.9";

  src = fetchurl {
    url = "http://launchpad.net/grail/trunk/${version}"
        + "/+download/${name}.tar.bz2";
    sha256 = "0gri8vcknxg0rj2jmsxipim2dd9zfs53q552k7i9dyn9sjwxip6p";
  };

  buildInputs = [ pkgconfig x11 libXi ];
  propagatedBuildInputs = [ frame ];
}
