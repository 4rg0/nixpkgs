{ stdenv, fetchurl, pkgconfig, intltool, gtk3 }:

stdenv.mkDerivation rec {
  name = "libindicator-${version}";
  version = "12.10.1";

  src = fetchurl {
    url = "http://launchpad.net/libindicator/12.10/${version}"
        + "/+download/${name}.tar.gz";
    sha256 = "0zs4z7l9b57jldwz0ban77f3c2zq43ambd0dssf5qg9i216f9lmj";
  };

  buildInputs = [ pkgconfig intltool gtk3 ];
}
