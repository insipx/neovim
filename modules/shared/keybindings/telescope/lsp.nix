_: {
  flake.modules.vim.editor = args: {
    keymaps = [
      {
        mode = "n";
        key = "<leader>lr";
        action.__raw = ''
          function()
            require('telescope.builtin').lsp_references()
          end
        '';
        options = {
          silent = true;
          desc = "list references";
        };
      }
    ];
  };
}
