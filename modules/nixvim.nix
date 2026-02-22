{
  lib,
  config,
  inputs,
  ...
}:
{
  options.configurations.vim = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options.module = lib.mkOption {
          type = lib.types.deferredModule;
        };
      }
    );
  };

  config.perSystem =
    {
      inputs',
      pkgs,
      system,
      ...
    }:
    {
      # This decl. is just for locally testing neovim with nix build .#neovim
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          inputs.neorg-overlay.overlays.default
        ];
      };

      overlayAttrs =
        let
          # Apply neorg-overlay to get the packages it provides
          neorgPkgs = inputs.neorg-overlay.overlays.default pkgs pkgs;
        in
        neorgPkgs // {
          # Add any additional custom packages here
        };

      packages = lib.flip lib.mapAttrs config.configurations.vim (
        name:
        { module }:
        inputs'.nixvim.legacyPackages.makeNixvimWithModule {
          inherit pkgs module;
        }
      );
    };
}
