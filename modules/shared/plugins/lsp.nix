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
        harper_ls = {
          enable = true;
        };
      };
    };
    plugins = {
      lsp.enable = true;
      lsp.servers.harper_ls.enable = true;
      lsp-format.enable = true;
      fidget = {
        enable = true;
        settings.notification.override_vim_notify = true;
      };
      tiny-inline-diagnostic.enable = true;
      lspsaga.enable = true;
    };
  };
}
