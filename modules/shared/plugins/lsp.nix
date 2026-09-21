_: {
  flake.modules.vim.editor = args: {
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
        ltex = {
          enable = true;
          activate = true;
          config.filetypes = [ "md" ];
        };
      };
    };
    plugins = {
      lsp.enable = true;
      lsp-format.enable = true;
      ltex-extra.enable = true;
      fidget = {
        enable = true;
        settings.notification.override_vim_notify = true;
      };
      tiny-inline-diagnostic.enable = true;
      lspsaga.enable = true;
    };
  };
}
