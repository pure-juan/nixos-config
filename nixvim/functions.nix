{}:
let
  mkKeymap = mode: key: action: desc: {
    inherit mode key action;
    options = {
      inherit desc;
      silent = true;
      noremap = true;
    };
  };
in {
  inherit mkKeymap;
}


