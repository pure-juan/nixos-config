{
  enable = true;
  
  settings = {
    options = {
      theme = "auto";
      globalstatus = true;
      disabled_filetypes = {
        statusline = [ "dashboard" "alpha" "ministarter" ];
      };
      component_separators = { left = ""; right = ""; };
      section_separators = { left = ""; right = ""; };
    };
    
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" ];
      
      lualine_c = [
        # 현재 작업 디렉토리
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                local root = vim.fn.getcwd()
                return vim.fn.fnamemodify(root, ":t")
              end
            '';
          };
          icon = "󱉭";
        }
        
        # Diagnostics
        {
          __unkeyed-1 = "diagnostics";
          symbols = {
            error = " ";
            warn = " ";
            info = " ";
            hint = " ";
          };
        }
        
        # Filetype icon
        {
          __unkeyed-1 = "filetype";
          icon_only = true;
          separator = "";
          padding = { left = 1; right = 0; };
        }
        
        # Filename
        {
          __unkeyed-1 = "filename";
          path = 1;
          symbols = {
            modified = " ●";
            readonly = " ";
            unnamed = "";
          };
        }
      ];
      
      lualine_x = [
        # Git diff (gitsigns 필요)
        {
          __unkeyed-1 = "diff";
          symbols = {
            added = " ";
            modified = " ";
            removed = " ";
          };
          source = {
            __raw = ''
              function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end
            '';
          };
        }
        
        # LSP 서버 이름
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                  return ""
                end
                local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return "  " .. client.name
                  end
                end
                return ""
              end
            '';
          };
        }
      ];
      
      lualine_y = [
        {
          __unkeyed-1 = "progress";
          separator = " ";
          padding = { left = 1; right = 0; };
        }
        {
          __unkeyed-1 = "location";
          padding = { left = 0; right = 1; };
        }
      ];
      
      lualine_z = [
        # 시계
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                return " " .. os.date("%R")
              end
            '';
          };
        }
      ];
    };
    
    extensions = [ "neo-tree" "fzf" ];
  };
}
