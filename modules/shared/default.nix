{ inputs, ... }:
{
  flake.modules.vim.editor =
    { pkgs, config, ... }:
    let
      inherit (pkgs.stdenv) system;
    in
    {
      # Main NixVim configuration that works across all platforms
      keymaps = [
        {
          key = "<Space>";
          action = "<Nop>";
          options.silent = true;
        }
      ];
      package = inputs.neovim-nightly.packages.${system}.default;

      dependencies = {
        tree-sitter.enable = true;
        direnv.enable = true;
      };

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
              markdown = [ "deno fmt" ];
              json = [ "deno fmt" ];
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
            json = [ "deno lint" ];
          };
        };

        direnv.enable = true;

        rustaceanvim = {
          enable = true;
          settings.server = {
            load_vscode_settings = true;
            standalone = false;
            default_settings = {
              rust-analyzer = {
                cargo = {
                  allTargets = true;
                  buildScripts.enable = true;
                  features = "all";
                };
                excludeGlobs = [ "**/bindings/wasm/**" ];
                checkOnSave = true;
                check = {
                  command = "clippy";
                  features = "all";
                };
                procMacro = {
                  enable = true;
                  attributes.enable = true;
                  ignored = {
                    "async-trait" = [ "async_trait" ];
                    "napi-derive" = [ "napi" ];
                    "async-recursion" = [ "async_recursion" ];
                    "ctor" = [ "ctor" ];
                    "tokio" = [ "test" ];
                  };
                };
                diagnostics.disabled = [
                  "unlinked-file"
                  "unresolved-macro-call"
                  "unresolved-proc-macro"
                  "proc-macro-disabled"
                  "proc-macro-expansion-error"
                ];
              };
            };
          };
          settings.tools = {
            enable_clippy = true;
            enable_nextest = false;
            executor = "toggleterm";
            test_executor = "toggleterm";
            reload_workspace_from_cargo_toml = true;
          };
        };

        vim-matchup = {
          enable = true;
          settings.matchparen_defered = 1;
        };

        crates = {
          enable = true;
          settings.completion.crates.enabled = true;
        };

        bufferline = {
          enable = true;
          settings.options = {
            mode = "buffers";
            numbers = "ordinal";
            indicator.style = "underline";
            diagnostics = "nvim_lsp";
          };
        };

        alpha = {
          enable = true;
          theme = "startify";
        };

        lualine.enable = true;
        spectre.enable = true;
        oil.enable = true;

        neogit = {
          enable = true;
          settings.integrations = {
            diffview = true;
            telescope = true;
          };
        };

        gitsigns.enable = true;
        gitblame.enable = true;
        diffview.enable = true;
        octo.enable = true;

        fff = {
          enable = true;
          package = inputs.nvim-fff.packages.${system}.fff-nvim;
          settings = {
            prompt = "> ";
            layout = {
              width = 1.0;
              height = 0.35;
              prompt_position = "top";
              preview_position = "right";
              preview_size = 0.4;
            };
          };
        };

        telescope = {
          enable = true;
          settings.defaults.__raw = ''
            require("telescope.themes").get_ivy({
              layout_config = {
                height = 0.2,
              }
            })
          '';
          extensions = {
            ui-select.enable = true;
            fzy-native.enable = true;
            media-files.enable = true;
            project.enable = true;
          };
        };

        neorg = {
          enable = true;
          settings.load = {
            "core.defaults".__empty = null;
            "core.concealer".config.icon_preset = "diamond";
            "core.dirman".config.workspaces = {
              work = "~/.notes/work";
              home = "~/.notes/home";
              xmtp = "~/.notes/xmtp";
            };
            "core.keybinds".config = {
              default_keybindings = true;
              neorg_leader = "<Space>";
            };
            "core.export".__empty = null;
            "core.export.markdown".config.extensions = "all";
          };
        };

        treesitter = {
          enable = true;
          grammarPackages = config.plugins.treesitter.package.allGrammars;
          nixGrammars = true;
          settings = {
            auto_install = true;
            highlight.enable = true;
            indent.enable = true;
            ensure_installed = [
              "rust"
              "javascript"
              "typescript"
              "sql"
              "c"
              "go"
              "protobuf"
              "nix"
              "toml"
            ];
          };
        };

        treesitter-textobjects.enable = true;
        treesitter-context = {
          enable = true;
          settings.max_lines = 2;
        };
        treesitter-refactor.enable = false;

        indent-blankline = {
          enable = false;
          settings = {
            scope = {
              enabled = true;
              show_start = true;
            };
            exclude.filetypes = [ "alpha" ];
          };
        };

        better-escape = {
          enable = true;
          settings.mappings.i.j.j = false;
        };

        glow.enable = true;
        precognition.enable = true;

        cursorline.enable = true;
        hop = {
          enable = true;
          settings.keys = "etovxqpdygfblzhckisuran";
        };

        toggleterm = {
          enable = true;
          settings = {
            shade_terminals = false;
            auto_scroll = true;
            autochdir = true;
            shade_filetypes = [ "none" ];
            shade_terminal = false;
            start_in_insert = true;
          };
          luaConfig.post = ''
            local Terminal = require('toggleterm.terminal').Terminal
            local float_general = Terminal:new({
              hidden = true,
              name = "general",
              auto_scroll = true,
              direction = "float",
              dir = git_dir
            })
            local htop = Terminal:new({
              cmd = "htop",
              hidden = true,
              name = "htop",
              auto_scroll = false,
              direction = "float",
              dir = git_dir
            })
            function _toggle_float_general()
              float_general:toggle()
            end
            function _toggle_htop()
              htop:toggle()
            end
          '';
        };

        scope.enable = true;
        project-nvim = {
          enable = true;
          settings = {
            scope_chdir = "tab";
            lsp.enabled = false;
            exclude_dirs = [ "~/.cargo/*" ];
          };
        };
      };
    };
}
