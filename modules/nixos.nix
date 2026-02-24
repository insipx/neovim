{
  withSystem,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf mkOption;
  # Bind flake-parts config here so NixOS module's `config` doesn't shadow it
  flakeConfig = config;
in
{
  config.flake.modules.nixos.shadow-nvim =
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
        };
    };
  config.flake.nixosModules.default = config.flake.modules.nixos.shadow-nvim;
}
