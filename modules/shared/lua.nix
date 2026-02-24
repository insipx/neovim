_: {
  flake.modules = {
    vim.editor = {
      extraConfigLua = builtins.readFile ./lua/extraconfig.lua + builtins.readFile ./lua/conform.lua;

    };
    extraConfigVim = ''
      set exrc
    '';

  };
}
