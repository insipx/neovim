{ config, ... }:
{
  configurations.vim.shadow-nvim.module = {
    imports = with config.flake.modules.vim; [
      editor
    ];
  };
}
