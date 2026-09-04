_: {
  flake.modules.vim.editor = args: {
    plugins.leetcode = {
      enable = true;
      settings = {
        lang = "rust";
        storage.home = "~/projects/leetcode";
      };
    };
  };
}
