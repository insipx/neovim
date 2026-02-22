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
        nodePackages.prettier
        nixfmt
        rubyPackages.htmlbeautifier

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

      extraPlugins = [ ];

      extraPython3Packages =
        ps: with ps; [
          pynvim
          unidecode
          black
          isort
        ];
    };
}
