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
  options.programs.shadow-nvim = {
    enable = mkEnableOption "Enable Shadow Nvim";
    guifont = mkOption {
      type = lib.types.str;
      default = null;
      description = "set a font";
    };
  };

  config.flake.homeModules.shadow-nvim =
    { pkgs, ... }:
    {
      options.programs.shadow-nvim = {
        enable = mkEnableOption "Enable Shadow Neovim";
      };

      config = {
        environment.systemPackages = mkIf config.programs.shadow-nvim.enable [
          (withSystem pkgs.stdenv.hostPlatform.system ({ config, ... }: config.packages.shadow-nvim))
        ];
        config.flake.modules.vim.editor.opts.guifont = config.programs.shadow-nvim.guifont;
      };

    };
  config.flake.homeModules.default = self.homeModules.shadow-nvim;

}
