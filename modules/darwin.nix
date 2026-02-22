{
  withSystem,
  lib,
  self,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;
in
{
  config.flake.darwinModules.shadow-nvim =
    { pkgs, config, ... }:
    {
      options.programs.shadow-nvim = {
        enable = mkEnableOption "Enable Shadow Neovim";
      };

      config = {
        environment.systemPackages = mkIf config.programs.shadow-nvim.enable [
          (withSystem pkgs.stdenv.hostPlatform.system ({ config, ... }: config.packages.shadow-nvim))
        ];
      };

    };
  config.flake.darwinModules.default = self.homeManagerModules.shadow-nvim;
}
