{ ... }:
let
  functions = import ./functions.nix {};
  inherit (functions) mkKeymap;

  n = [
    # Window navigation
    (mkKeymap "n" "<c-h>" ":lua require('smart-splits').move_cursor_left()<cr>" "Move cursor left")
    (mkKeymap "n" "<c-j>" ":lua require('smart-splits').move_cursor_down()<cr>" "Move cursor down")
    (mkKeymap "n" "<c-k>" ":lua require('smart-splits').move_cursor_up()<cr>" "Move cursor up")
    (mkKeymap "n" "<c-l>" ":lua require('smart-splits').move_cursor_right()<cr>" "Move cursor right")

    # File operations
    (mkKeymap "n" "<c-s>" "<cmd>w ++p<cr>" "Save")

    # Buffer navigation
    (mkKeymap "n" "<S-h>" "<cmd>bprevious<cr>" "Previous buffer")
    (mkKeymap "n" "<S-l>" "<cmd>bnext<cr>" "Next buffer")
    (mkKeymap "n" "<leader>bb" "<cmd>e #<cr>" "Switch to other buffer")
    (mkKeymap "n" "<leader>bd" "<cmd>bdelete<cr>" "Delete buffer")

    # File and search
    (mkKeymap "n" "<leader><space>" "<cmd>lua Snacks.picker.files()<cr>" "Find files")
    (mkKeymap "n" "<leader>sg" "<cmd>lua Snacks.picker.grep()<cr>" "Grep in project")
    (mkKeymap "n" "<leader>ff" "<cmd>lua Snacks.picker.files()<cr>" "Find files in root")

    # LSP
    (mkKeymap "n" "gd" "<cmd>lua vim.lsp.buf.definition()<cr>" "Go to definition")
    (mkKeymap "n" "gr" "<cmd>lua vim.lsp.buf.references()<cr>" "Show references")
    (mkKeymap "n" "K" "<cmd>lua vim.lsp.buf.hover()<cr>" "Show hover info")
    (mkKeymap "n" "<leader>ca" "<cmd>lua vim.lsp.buf.code_action()<cr>" "Code actions")
    (mkKeymap "n" "<leader>cr" "<cmd>lua vim.lsp.buf.rename()<cr>" "Rename symbol")

    # Diagnostics
    (mkKeymap "n" "]d" "<cmd>lua vim.diagnostic.goto_next()<cr>" "Next diagnostic")
    (mkKeymap "n" "[d" "<cmd>lua vim.diagnostic.goto_prev()<cr>" "Previous diagnostic")
    (mkKeymap "n" "<leader>xx" "<cmd>lua Snacks.picker.diagnostics()<cr>" "Show diagnostics")
  ];
in {
  keymaps = n;
}
