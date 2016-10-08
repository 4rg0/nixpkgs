{ stdenv, fetchFromGitHub, perl, buildLinux, ... } @ args:

import ./generic.nix (args // rec {
  version = "4.8.0-git-2016-10-06";

  modDirVersion = "4.8.0";

  src = fetchFromGitHub {
    owner = "tobetter";
    repo = "linux";
    rev = "76f3f58496c09bc2cccb91a2dfd911f42019d886";
    sha256 = "00kwqjrp4jj1858z8x0fd1nnmmx0ixnyqrh3ss320gc8xa1ljczz";
  };

  features.iwlwifi = true;

  extraMeta.hydraPlatforms = [];
})
