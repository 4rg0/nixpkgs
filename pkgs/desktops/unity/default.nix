{ callPackage, pkgs }:

rec {
  bamf = callPackage ./bamf.nix { };
  dee = callPackage ./dee.nix { };
  frame = callPackage ./frame.nix { };
  geis = callPackage ./geis.nix { };
  grail = callPackage ./grail.nix { };
  ibus = callPackage ./ibus.nix { };
  indicatorMessages = callPackage ./indicator-messages.nix { };
  libdbusmenu = callPackage ./libdbusmenu.nix { };
  libgee = callPackage ./libgee.nix { };
  libindicator = callPackage ./libindicator.nix { };
  libunity = callPackage ./libunity.nix { };
  libunityMisc = callPackage ./libunity-misc.nix { };
  libunityWebapps = callPackage ./libunity-webapps.nix { };
  libzeitgeist = callPackage ./libzeitgeist.nix { };
  nux = callPackage ./nux.nix { };
  packagekit = callPackage ./packagekit.nix { };
  unity = callPackage ./unity.nix { };
}
