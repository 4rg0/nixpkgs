{ stdenv, fetchurl, cmake, pkgconfig, gettext, compiz, nux, bamf, dee, glib
, libdbusmenu, x11, gnome, libindicator, atk, at_spi2_atk, dbus_glib, gtk2, gtk3
, libsigcxx, json_glib, libnotify, libzeitgeist, libunity, libunityMisc
, libXdamage, libXdmcp, libXau, libxml2, libxslt, libpthreadstubs, glibmm
, libdrm, mesa, boost
}:

stdenv.mkDerivation rec {
  name = "unity-${version}";
  version = "6.12.0";

  src = fetchurl {
    url = "http://launchpad.net/unity/6.0/${version}/+download/${name}.tar.gz";
    sha256 = "1h8qch4339pyyiikv0f0jzfhysmknfcazy26pbf1lya5ih62yhag";
  };

  prePatch = ''
    find . -name "CMakeLists.txt" -exec sed -i 's/-Werror  *//g' '{}' +
    sed -e '/notify_notification_new(/,/nullptr)/s/nullptr/&, nullptr/' \
        -e 's/\(notify_notification_set_\)image\(_from_pixbuf\)/\1icon\2/' \
        -e 's/\(notify_notification_set_hint\) *(.*/\/* XXX: & *\//' \
        -i launcher/DeviceNotificationDisplayImp.cpp
  '';

  patches = [ ./disable-pointerbarrier.patch ];

  enableParallelBuilding = true;

  cmakeFlags = [
    "-DGSETTINGS_LOCALINSTALL=1"
    "-DCMAKE_MODULE_PATH=${compiz}/share/cmake-2.8"
  ];

  buildInputs = [
    cmake pkgconfig gettext compiz nux bamf dee glib libdbusmenu x11
    gnome.startupnotification libindicator atk at_spi2_atk dbus_glib gtk2 gtk3
    libsigcxx json_glib libnotify libzeitgeist libunity libunityMisc libXdamage
    libXdmcp libXau libxml2 libxslt libpthreadstubs glibmm libdrm mesa boost
  ];
}
