_: {
  flake.modules = {
    vim.editor = {
      colorschemes.catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          integrations = {
            treesitter = true;
            notify = true;
          };
        };
      };
    };
  };
}
