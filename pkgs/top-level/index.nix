{
  adapters = import ../stdenv/adapters.nix;
  builders = import ../build-support/trivial-builders.nix;
  stdenv = import ./stdenv.nix;
  all = import ./all-packages.nix;
  aliases = import ./aliases.nix;
}
