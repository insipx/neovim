{
  withSystem,
  lib,
  config,
  ...
}:
let

  inherit (lib) mkEnableOption mkIf;
in
{
  options.programs.shadow-nvim = {
    enable = mkEnableOption "Enable Shadow Neovim";
  };

  config.flake.modules.nixos.shadow-nvim =
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
  config.flake.modules.nixos.default = config.flake.modules.nixos.shadow-nvim.module;

}
