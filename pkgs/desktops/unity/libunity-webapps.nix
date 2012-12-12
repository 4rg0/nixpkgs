{ stdenv, fetchurl, pkgconfig, intltool, glib, gobjectIntrospection
, gdk_pixbuf, libwnck3, json_glib, libsoup, packagekit, polkit, telepathy_glib
, libnotify, libunity, indicatorMessages, geoclue, libdbusmenu, gtk2
}:

stdenv.mkDerivation rec {
  name = "libunity-webapps-${version}";
  version = "2.4.3";

  src = fetchurl {
    url = "http://launchpad.net/libunity-webapps/2.4/${version}"
        + "/+download/unity_webapps-2.4.3.tar.gz";
    sha256 = "1jr0ci7azp6x4p7gnq5pfvpnrawdr3bdidahl52qvglf49127i5y";
  };

  prePatch = ''
    sed -i -e 's/notify_notification_new[^)]*/&, NULL/' \
      src/context-daemon/unity-webapps-notification-context.c
  '';

  buildInputs = [
    intltool pkgconfig glib gobjectIntrospection gdk_pixbuf libwnck3 json_glib
    libsoup packagekit polkit telepathy_glib libnotify libunity
    indicatorMessages geoclue libdbusmenu gtk2
  ];
}
