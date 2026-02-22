_: {

  flake.modules.vim.editor = args: {
    keymaps = [
      {
        mode = "n";
        key = "<leader>pf";
        action.__raw = ''
          function()
            require('fff').find_in_git_root()
          end
        '';
        options = {
          silent = true;
          desc = "find file in project";
        };
      }
      {
        mode = "n";
        key = "<leader>pp";
        action.__raw = ''
          function()
            require'telescope'.extensions.projects.projects()
          end
        '';
        options = {
          silent = true;
          desc = "find file in project";
        };
      }
    ];
  };
}
