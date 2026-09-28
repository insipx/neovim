_: {
  flake.modules.vim.editor = args: {
    plugins.leetcode = {
      enable = true;
      settings = {
        lang = "rust";
        storage.home.__raw = ''
          (function()
            local path = vim.fn.expand("~/projects/leetcode")
            -- LeetCode's mkdir does not create missing parent directories.
            vim.fn.mkdir(path, "p")
            return path
          end)()
        '';
      };
    };
  };
}
