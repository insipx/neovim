_: {
  flake.modules.vim.editor = args: {
    plugins.mini = {
      enable = true;
      modules = {
        pairs = { };
        bracketed = { };
        bufremove = { };
        surround = { };
        clue = {
          triggers = [
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "x";
              keys = "<Leader>";
            }
            {
              mode = "v";
              keys = "<Leader>";
            }
          ];
          clues = [
            "miniclue.gen_clues.builtin_completion()"
            "miniclue.gen_clues.g()"
            "miniclue.gen_clues.marks()"
            "miniclue.gen_clues.registers()"
            "miniclue.gen_clues.windows()"
            "miniclue.gen_clues.z()"
          ];
          window.delay = 500;
        };
        trailspace = { };
        basics = { };
        align = { };
        indentscope = { };
        hipatterns = {
          highlighters = {
            fixme = {
              pattern = "FIXME";
              group = "MiniHipatternsFixme";
            };
            hack = {
              pattern = "HACK";
              group = "MiniHipatternsHack";
            };
            todo = {
              pattern = "TODO";
              group = "MiniHipatternsTodo";
            };
            note = {
              pattern = "NOTE";
              group = "MiniHipatternsNote";
            };
          };
        };
        map = { };
        misc = { };
        icons = { };
      };
      mockDevIcons = true;
    };

  };
}
