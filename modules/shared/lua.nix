_: {
  flake.modules = {
    vim.editor = {
      extraConfigLua = ''
        -- vim.opt.listchars:append "eol:↴"
        vim.opt.listchars:append "space:⋅"
      ''
      + builtins.readFile ./lua/conform.lua;

    };
    extraConfigVim = ''
      set exrc
    '';

  };
}
