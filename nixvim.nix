{ inputs, ... }:
let 
  nixvimConfig = import ./nixvim {};
in {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    colorschemes.tokyonight = {
      enable = true;
    };
    clipboard.providers.wl-copy.enable = true;
    waylandSupport = true;
    plugins = {
      comment = {
        enable = true;
	settings = {
          toggler.line = "<leader>/";
	  opleader.line = "<leader>/";
	};
      };
      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          jsonls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ts_ls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
        };
      };
      blink-cmp.enable = true;
      gitsigns.enable = true;
      goto-preview.enable = true;
      lazy.enable = true;
      lualine = import ./lualine.nix;
      smart-splits.enable = true;
      snacks = {
        enable = true;
        settings = {
          bigfile.enable = true;
          dashboard = {
            enabled = true;
          };
          explorer.enable = true;
          indent.enable = true;
          input.enable = true;
          picker.enable = true;
          notifier = {
            enable = true;
            timeout = 3000;
          };
          quickfile = {
            enable = false;
          };
          scope.enable = true;
          scroll.enable = true;
          statuscolumn = {
            enable = false;
          };
          terminal.enable = true;
          words = {
            enable = true;
            debounce = 100;
          };
        };
      };
      treesitter = {
        enable = true;
        settings = {
          auto_install = true;
          indent_enable = true;
          incremental_selection.enable = true;
        };
      };
      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 3;
        };
      };
      which-key = {
        enable = true;
        settings = {
          delay = 200;
          expand = 1;
          notify = false;
          preset = "modern";
          replace = {
            desc = [
              [
                "<space>"
                "SPACE"
              ]
              [
                "<leader>"
                "SPACE"
              ]
              [
                "<[cC][rR]>"
                "RETURN"
              ]
              [
                "<[tT][aA][bB]>"
                "TAB"
              ]
              [
                "<[bB][sS]>"
                "BACKSPACE"
              ]
            ];
          };
          spec = [
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffers";
              icon = "󰓩 ";
            }
            {
              __unkeyed = "<leader>c";
              group = "Codesnap";
              icon = "󰄄 ";
              mode = "v";
            }
            {
              __unkeyed-1 = "<leader>bs";
              group = "Sort";
              icon = "󰒺 ";
            }
            {
              __unkeyed-1 = [
                {
                  __unkeyed-1 = "<leader>f";
                  group = "Normal Visual Group";
                }
                {
                  __unkeyed-1 = "<leader>f<tab>";
                  group = "Normal Visual Group in Group";
                }
              ];
              mode = [
                "n"
                "v"
              ];
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "windows";
              proxy = "<C-w>";
            }
            {
              __unkeyed-1 = "<leader>cS";
              __unkeyed-2 = "<cmd>CodeSnapSave<CR>";
              desc = "Save";
              mode = "v";
            }
            {
              __unkeyed-1 = "<leader>db";
              __unkeyed-2 = {
                __raw = ''
                  function()
                    require("dap").toggle_breakpoint()
                  end
                '';
              };
              desc = "Breakpoint toggle";
              mode = "n";
              silent = true;
            }
          ];
          win = {
            border = "single";
          };
        };
      };
    };
    globals.mapleader = " ";
    keymaps = [
      {
        key = "<leader>e";
        mode = [ "n" ];
        action = "<cmd>lua Snacks.explorer()<CR>";
        options = {
          desc = "Open explorer";
          silent = true;
          noremap = true;
        };
      }
      {
        key = "<leader>/";
        mode = [ "n" ];
        action = "<cmd>lua Snacks.terminal()<CR>";
        options = {
          desc = "Open terminal";
          silent = true;
          noremap = true;
        };
      }
    ] ++ nixvimConfig.keymaps;
  };
}
