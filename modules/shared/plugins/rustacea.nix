_: {
  flake.modules.vim.editor = _: {
    plugins.rustaceanvim = {
      enable = true;
      settings.server = {
        load_vscode_settings = true;
        standalone = false;
        # default_settings = {
        #   # rust-analyzer = {
        #   #   cargo = {
        #   #     allTargets = true;
        #   #     buildScripts.enable = true;
        #   #   };
        #   #   checkOnSave = false;
        #   #   #  check = {
        #   #   #    command = "clippy";
        #   #   #    features = "all";
        #   #   #  };
        #   #   procMacro = {
        #   #     enable = true;
        #   #     attributes.enable = true;
        #   #     ignored = {
        #   #       "async-trait" = [ "async_trait" ];
        #   #       "napi-derive" = [ "napi" ];
        #   #       "async-recursion" = [ "async_recursion" ];
        #   #       "ctor" = [ "ctor" ];
        #   #       "tokio" = [ "test" ];
        #   #     };
        #   #   };
        #   #   diagnostics.disabled = [
        #   #     "unlinked-file"
        #   #     "unresolved-macro-call"
        #   #     "unresolved-proc-macro"
        #   #     "proc-macro-disabled"
        #   #     "proc-macro-expansion-error"
        #   #   ];
        #   # };
        # };
      };
      settings.tools = {
        enable_clippy = true;
        enable_nextest = false;
        executor = "toggleterm";
        test_executor = "toggleterm";
        reload_workspace_from_cargo_toml = true;
      };
    };
  };
}
