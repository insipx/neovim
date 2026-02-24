{
  withSystem,
  lib,
  self,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf mkOption;
in
{
  config.flake.darwinModules.shadow-nvim =
    { pkgs, ... }:
    {
      options = {
        programs.shadow-nvim = {
          enable = mkEnableOption "Enable Shadow Neovim";
          guifont = mkOption {
            type = lib.types.str;
            default = null;
            description = "set a font";
          };
        };
      };

      config = {
        environment.systemPackages = mkIf config.programs.shadow-nvim.enable [
          (withSystem pkgs.stdenv.hostPlatform.system ({ config, ... }: config.packages.shadow-nvim))
        ];
        config.flake.modules.vim.editor.opts.guifont = config.programs.shadow-nvim.guifont;
      };

    };
  config.flake.darwinModules.default = self.homeManagerModules.shadow-nvim;
}
