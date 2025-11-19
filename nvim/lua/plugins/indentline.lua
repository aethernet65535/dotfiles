return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",  
  opts = {
    indent = {
      char = "│",       
      tab_char = "→",   
      highlight = "Comment",  
    },
    scope = {
      enabled = true,
      show_start = false,  
      show_end = false,    
      highlight = { 
        "Function", 
        "Label",
        "Type"      
      },
    },
    exclude = {           
      filetypes = {
        "help",
        "dashboard",
        "lazy",
        "mason"
      }
    }
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    vim.cmd([[hi IndentBlanklineContextStart gui=underline]])
  end
}

