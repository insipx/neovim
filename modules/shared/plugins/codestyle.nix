_: {
  flake.modules.vim.editor = args: {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 350;
          };
          formatters_by_ft = {
            toml = [ "taplo" ];
            lua = [ "stylua" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            nix = [ "nixfmt" ];
            yaml = [ "prettier" ];
            html = [ "htmlbeautifier" ];
            markdown = [
              "deno_fmt"
            ];
            json = [
              "deno_fmt"
            ];
            "*" = [ "codespell" ];
          };
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          nix = [
            "nix"
            "statix"
          ];
          env = [ "dotenv_linter" ];
          git = [ "gitlint" ];
          json = [ "eslint_d" ];
          js = [ "eslint_d" ];
          fish = [ "fish" ];
        };
      };
    };
  };
}
