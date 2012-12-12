{ stdenv, fetchurl, pkgconfig, glib, gtk3 }:

stdenv.mkDerivation rec {
  name = "libunity-misc-${version}";
  version = "4.0.4";

  src = fetchurl {
    url = "https://launchpad.net/libunity-misc/trunk/"
        + "${version}/+download/${name}.tar.gz";
    sha256 = "1jd08ksxb9wq08kc8y10z6hik1zbnxc9bqkz7p8i7rfrsaqprsld";
  };

  buildInputs = [ pkgconfig glib gtk3 ];
}
