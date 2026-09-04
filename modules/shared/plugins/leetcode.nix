_: {
  flake.modules.vim.editor = args: {
    plugins.leetcode = {
      enable = true;
      lang = "rust";
      storage.home = "~/projects/leetcode";
    };
  };
}
