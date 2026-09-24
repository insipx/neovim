_: {
  flake.modules.vim.editor = args: {
    plugins = {
      render-markdown.enable = true;
      zen-mode = {
        enable = true;
      };
      twilight = {
        enable = true;
      };
      # diagram = {
      #   enable = true;
      # };
    };
  };
}
