_: {
  flake.modules.vim.editor = args: {
    plugins = {
      goyo.enable = true;
      render-markdown.enable = true;
    };
  };
}
