{
  enable = true;
  
  settings = {
    options = {
      theme = {
        normal = {
          c = {
            fg = "#bbc2cf";
            bg = "#202328";
          };
        };
        inactive = {
          c = {
            fg = "#bbc2cf";
            bg = "#202328";
          };
        };
      };
      component_separators = "";
      section_separators = "";
    };
    
    sections = {
      lualine_a = [];
      lualine_b = [];
      lualine_y = [];
      lualine_z = [];
      
      lualine_c = [
        # Left edge indicator
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                return "▊"
              end
            '';
          };
          color = { fg = "#51afef"; };
          padding = { left = 0; right = 1; };
        }
        
        # # Mode indicator
        # {
        #   __unkeyed-1 = {
        #     __raw = ''
        #       function()
        #         return ""
        #       end
        #     '';
        #   };
        #   color = {
        #     __raw = ''
        #       function()
        #         local mode_color = {
        #           n = '#ec5f67',        -- Normal
        #           i = '#98be65',        -- Insert
        #           v = '#51afef',        -- Visual
        #           ['\22'] = '#51afef',  -- Visual Block (Ctrl-V)
        #           V = '#51afef',        -- Visual Line
        #           c = '#c678dd',        -- Command
        #           no = '#ec5f67',       -- Operator Pending
        #           s = '#FF8800',        -- Select
        #           S = '#FF8800',        -- Select Line
        #           ['\19'] = '#FF8800',  -- Select Block (Ctrl-S)
        #           ic = '#ECBE7B',       -- Insert completion
        #           R = '#a9a1e1',        -- Replace
        #           Rv = '#a9a1e1',       -- Virtual Replace
        #           cv = '#ec5f67',       -- Ex mode
        #           ce = '#ec5f67',       -- Normal Ex
        #           r = '#008080',        -- Hit-enter prompt
        #           rm = '#008080',       -- More prompt
        #           ['r?'] = '#008080',   -- Confirm query
        #           ['!'] = '#ec5f67',    -- Shell executing
        #           t = '#ec5f67',        -- Terminal
        #         }
        #         return { fg = mode_color[vim.fn.mode()] }
        #       end
        #     '';
        #   };
        #   padding = { right = 1; };
        # }
        
        # Filesize
        {
          __unkeyed-1 = "filesize";
          cond = {
            __raw = ''
              function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
              end
            '';
          };
        }
        
        # Filename
        {
          __unkeyed-1 = "filename";
          cond = {
            __raw = ''
              function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
              end
            '';
          };
          color = { fg = "#c678dd"; gui = "bold"; };
        }
        
        # # Location
        # "location"
        
        # # Progress
        # {
        #   __unkeyed-1 = "progress";
        #   color = { fg = "#bbc2cf"; gui = "bold"; };
        # }
        
        # # Diagnostics
        # {
        #   __unkeyed-1 = "diagnostics";
        #   sources = [ "nvim_diagnostic" ];
        #   symbols = {
        #     error = " ";
        #     warn = " ";
        #     info = " ";
        #   };
        #   diagnostics_color = {
        #     error = { fg = "#ec5f67"; };
        #     warn = { fg = "#ECBE7B"; };
        #     info = { fg = "#008080"; };
        #   };
        # }
        
        # Center separator
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                return '%='
              end
            '';
          };
        }
      ];
      
      lualine_x = [
        # LSP server name
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end
            '';
          };
          icon = " LSP:";
          color = { fg = "#ffffff"; gui = "bold"; };
        }
        # Encoding
        {
          __unkeyed-1 = "encoding";
          fmt = {
            __raw = "string.upper";
          };
          cond = {
            __raw = ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          };
          color = { fg = "#98be65"; gui = "bold"; };
        }
        
        # File format
        {
          __unkeyed-1 = "fileformat";
          fmt = {
            __raw = "string.upper";
          };
          icons_enabled = false;
          color = { fg = "#98be65"; gui = "bold"; };
        }
        
        # # Git branch
        # {
        #   __unkeyed-1 = "branch";
        #   icon = "";
        #   color = { fg = "#a9a1e1"; gui = "bold"; };
        # }
        
        # # Diff
        # {
        #   __unkeyed-1 = "diff";
        #   symbols = {
        #     added = " ";
        #     modified = "󰝤 ";
        #     removed = " ";
        #   };
        #   diff_color = {
        #     added = { fg = "#98be65"; };
        #     modified = { fg = "#FF8800"; };
        #     removed = { fg = "#ec5f67"; };
        #   };
        #   cond = {
        #     __raw = ''
        #       function()
        #         return vim.fn.winwidth(0) > 80
        #       end
        #     '';
        #   };
        # }
        
        # Right edge indicator
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                return '▊'
              end
            '';
          };
          color = { fg = "#51afef"; };
          padding = { left = 1; };
        }
      ];
    };
    
    inactive_sections = {
      lualine_a = [];
      lualine_b = [];
      lualine_y = [];
      lualine_z = [];
      lualine_c = [];
      lualine_x = [];
    };
  };
}
