_: {
  flake.modules = {
    vim.editor = {
      files."lua/shadow/secrets.lua".extraConfigLua = builtins.readFile ./lua/secrets.lua;
      extraConfigLua = builtins.readFile ./lua/extraconfig.lua + builtins.readFile ./lua/conform.lua;

    };
    extraConfigVim = ''
      set exrc
    '';

  };
}
