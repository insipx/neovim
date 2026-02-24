{ withSystem, pkgs, ... }:
{

  flake.herculesCI = _: {
    onPush.default.outputs = withSystem pkgs.stdenv.hostPlatform.system (
      { self', ... }:
      {
        inherit (self'.packages) nixvim;
      }
    );
  };
}
