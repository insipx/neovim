_: {
  flake.modules.vim.editor = args: {
    keymaps = [
      {
        mode = "n";
        key = "<leader>ql";
        action.__raw = ''
          function()
            require('telescope.builtin').quickfix()
          end
        '';
        options = {
          silent = true;
          desc = "list items in the quickfix list";
        };
      }

      {
        mode = "n";
        key = "<leader>qh";
        action.__raw = ''
          function()
            require('telescope.builtin').quickfixhistory()
          end
        '';
        options = {
          silent = true;
          desc = "search through quick fix history";
        };
      }
    ];
  };
}
