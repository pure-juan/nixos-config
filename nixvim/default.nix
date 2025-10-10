{ ... }:
let
  functions = import ./functions.nix {};
  keymaps = import ./keymaps.nix {};
in
functions // keymaps
