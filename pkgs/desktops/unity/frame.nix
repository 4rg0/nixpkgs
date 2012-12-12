{ stdenv, fetchurl, pkgconfig, x11, xorgserver, libXi }:

stdenv.mkDerivation rec {
  name = "frame-${version}";
  version = "2.4.4";

  src = fetchurl {
    url = "http://launchpad.net/frame/trunk/${version}"
        + "/+download/${name}.tar.xz";
    sha256 = "1pbnl9l84ca17641lrwzidkkl7ysffl26mbp1r245y0kf4kdxqi3";
  };

  buildInputs = [ pkgconfig x11 xorgserver libXi ];
}
