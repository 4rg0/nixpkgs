{ stdenv, fetchurl, pkgconfig, intltool, gtk3, libindicator }:

stdenv.mkDerivation rec {
  name = "indicator-messages-${version}";
  version = "12.10.5";

  src = fetchurl {
    url = "http://launchpad.net/indicator-messages/12.10/${version}"
        + "/+download/${name}.tar.gz";
    sha256 = "0bq4bbacjlpixf5h229y2998b703qb6cv11mrv0wzs4rydz77zkx";
  };

  configureFlags = [ "--enable-localinstall" ];

  buildInputs = [ pkgconfig intltool gtk3 libindicator ];
}
