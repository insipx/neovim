{ ... }:
{
  flake.modules.vim.editor =
    { pkgs, ... }:
    {
      extraPackages = with pkgs; [
        gcc
        ripgrep
        lua51Packages.luarocks
        lua51Packages.lua
        lua51Packages.cjson
        git

        # Formatters
        taplo
        stylua
        deno
        nixfmt
        rubyPackages.htmlbeautifier
        prettier

        # Linters
        dotenv-linter
        gitlint
        html-tidy
        statix
        deadnix
        markdownlint-cli
        shellcheck
        golangci-lint

        # Other
        htop
        vscode-extensions.vadimcn.vscode-lldb
        viu # for FFF Picker
      ];

      extraPlugins = [
        pkgs.vimPlugins.claudecode-nvim
      ];

      extraPython3Packages =
        ps: with ps; [
          pynvim
          unidecode
          black
          isort
        ];
    };
}
