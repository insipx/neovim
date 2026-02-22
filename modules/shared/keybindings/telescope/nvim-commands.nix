_: {
  flake.modules.vim.editor = args: {
    keymaps = [
      {
        mode = "n";
        key = "<leader>ec";
        action.__raw = ''
          function()
            require('telescope.builtin')
              .commands()
          end
        '';
        options = {
          silent = true;
          desc = "List available commands from vim/plugins";
        };
      }
    ];
  };
}
