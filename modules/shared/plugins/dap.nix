_: {
  flake.modules.vim.editor = args: {

    plugins.dap.enable = true;
    plugins.dap-rr = {
      enable = true;
      settings.mappings = {
        continue = "<leader>rc";
        step_over = "<leader>rs";
        step_out = "<leader>rS";
        step_into = "<leader>ri";
        reverse_continue = "<leader>Rc";
        reverse_step_over = "<leader>Rs";
        reverse_step_out = "<leader>RS";
        reverse_step_into = "<leader>Ri";
        step_over_i = "<leader>ris";
        step_out_i = "<leader>riS";
        step_into_i = "<leader>rii";
        reverse_step_over_i = "<leader>Ris";
        reverse_step_out_i = "<leader>RiS";
        reverse_step_into_i = "<leader>Rii";
      };
    };
    plugins.dap-ui.enable = true;
  };
}
