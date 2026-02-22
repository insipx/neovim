_: {
  flake.modules.vim.editor = args: {
    keymaps = [
      {
        mode = "n";
        key = "<leader>bb";
        action.__raw = ''
          function()
            require('telescope.builtin').buffers()
          end
        '';
        options = {
          silent = true;
          desc = "list buffers in current context";
        };
      }

      {
        mode = "n";
        key = "<leader>bB";
        action.__raw = ''
          function()
            require('telescope')
              .extensions.scope.buffers()
          end
        '';
        options = {
          silent = true;
          desc = "list all buffers";
        };
      }
    ];
  };
}
