{
  withSystem,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf mkOption;
  flakeConfig = config;
in
{
  config.flake.lib.template =
    {
      pkgs,
      config,
      ...
    }:
    let
      cfg = config.programs.shadow-nvim;
    in
    {
      options.programs.shadow-nvim = {
        enable = mkEnableOption "Enable Shadow Neovim";
        font = mkOption {
          type = lib.types.str;
          default = "monospace";
          description = "set a font";
        };
        font-size = mkOption {
          type = lib.types.int;
          default = 12;
          description = "set font size";
        };
      };

      config =
        let
          shadow-nvim = withSystem pkgs.stdenv.hostPlatform.system (
            { inputs', pkgs, ... }:
            (inputs'.nixvim.legacyPackages.makeNixvimWithModule {
              inherit pkgs;
              module = {
                imports = [ flakeConfig.configurations.vim.shadow-nvim.module ];
                opts.guifont = "${cfg.font}:h${toString cfg.font-size}";
              };
            })
          );
        in
        {
          environment.systemPackages = mkIf cfg.enable [ shadow-nvim ];
          environment.variables.EDITOR = "${shadow-nvim}/bin/nvim";
        };
    };
}
