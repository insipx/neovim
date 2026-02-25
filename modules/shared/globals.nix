_: {
  flake.modules.vim.editor = args: {
    withNodeJs = true;
    withRuby = true;
    diagnostic.settings = {
      severity_sort = true;
      virtual_lines = false;
      virtual_text = false;
    };

    globals = {
      mapleader = " ";
      maplocalleader = ",";
      loaded_netrw = 1;
      loaded_matchparen = 1;
      loaded_netrwPlugin = 1;
      loaded_python_provider = 0;
      nocompatible = true;
      loaded_man = false;
      loaded_gzip = false;
      loaded_zipPlugin = false;
      loaded_tarPlugin = false;
      loaded-2html_plugin = false;
      loaded_remote_plugins = false;
    };
    opts = {
      relativenumber = true;
      number = true;
      hidden = true;
      hlsearch = true;
      backspace = [
        "indent"
        "eol"
        "start"
      ];
      laststatus = 3;
      encoding = "utf-8";
      showtabline = 1;
      showmatch = true;
      list = true;
      signcolumn = "yes";
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
    };
  };
}
