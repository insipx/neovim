_: {
  flake.modules.vim.editor = args: {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd = {
            enable = true;
            filetypes = [ "nix" ];
            settings.formatting.command = [ "nixfmt" ];
          };
          gopls = {
            enable = true;
            filetypes = [ "go" ];
          };
          taplo = {
            enable = true;
            filetypes = [ "toml" ];
          };
          just = {
            enable = true;
          };
        };
      };
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
