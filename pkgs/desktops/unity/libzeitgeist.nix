{ stdenv, fetchurl, pkgconfig, glib }:

stdenv.mkDerivation rec {
  name = "libzeitgeist-${version}";
  version = "0.3.18";

  src = fetchurl {
    url = "http://launchpad.net/libzeitgeist/0.3/${version}"
        + "/+download/${name}.tar.gz";
    sha256 = "0wqgz3yw0czpgxy9gyjx7mzwa8xisps5xrp3p0c0aq38gbcjihc2";
  };

  buildInputs = [ pkgconfig glib ];
}
