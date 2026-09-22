_: {
  flake.modules.vim.editor = { pkgs, ... }: {
    lsp = {
      servers = {
        nixd = {
          enable = true;
          activate = true;
          config.filetypes = [ "nix" ];
          config.formatting.command = [ "nixfmt" ];
        };
        gopls = {
          enable = true;
          config.filetypes = [ "go" ];
          activate = true;
        };
        taplo = {
          enable = true;
          activate = true;
          config.filetypes = [ "toml" ];
        };
        just = {
          enable = true;
          activate = true;
        };
        clojure_lsp = {
          enable = true;
          activate = true;
        };
        # ltex = {
        #   enable = true;
        #   activate = true;
        #   config.filetypes = [ "md" ];
        #   package = pkgs.ltex-ls-plus;
        # };
      };
    };
    plugins = {
      lsp.enable = true;
      lsp-format.enable = true;
      lsp.servers.ltex_plus = {
        enable = true;
        package = pkgs.ltex-ls-plus;
        settings = {
          ltex = {
            language = "en-US";
            languageToolHttpServerUri = "https://api.languagetoolplus.com";
            languageToolOrg = {
              username = "andrew.plaza15@gmail.com";
              apiKey.__raw = ''require("shadow.secrets").read("~/.config/neovim-secrets/languagetool")'';
            };
          };
        };
      };
      fidget = {
        enable = true;
        settings.notification.override_vim_notify = true;
      };
      tiny-inline-diagnostic.enable = true;
      lspsaga.enable = true;
    };
  };
}
