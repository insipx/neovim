_: {
  flake.modules = {
    vim.editor = {
      extraConfigLua = ''
        -- vim.opt.listchars:append "eol:↴"
        vim.opt.listchars:append "space:⋅"
        if vim.g.neovide then
          vim.o.guifont = "Berkeley Mono:h16"
        end
      ''
      + builtins.readFile ./lua/conform.lua;

    };
    extraConfigVim = ''
      set exrc
    '';

  };
}
