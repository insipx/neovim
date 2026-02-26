{
  config,
  ...
}:
{
  config.flake.modules.nixos.shadow-nvim = config.flake.lib.template;
  config.flake.nixosModules.default = config.flake.modules.nixos.shadow-nvim;

  config.flake.darwinModules.shadow-nvim = config.flake.lib.template;
  config.flake.darwinModules.default = config.flake.modules.nixos.shadow-nvim;

  config.flake.homeModules.shadow-nvim = config.flake.lib.template;
  config.flake.homeModules.default = config.flake.modules.nixos.shadow-nvim;

}
