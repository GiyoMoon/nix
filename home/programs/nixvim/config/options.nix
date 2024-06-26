{
  programs.nixvim.opts = {
    breakindent = true;
    clipboard = "unnamedplus";
    cursorline = true;
    hlsearch = true;
    inccommand = "split";
    list = true;
    listchars = "tab:⇥ ,trail:·,nbsp:␣,space:·";
    mouse = "a";
    number = true;
    relativenumber = false;
    scrolloff = 15;
    showmode = false;
    signcolumn = "yes";
    smartcase = true;
    splitbelow = true;
    splitright = true;
    timeoutlen = 300;
    undofile = true;
    updatetime = 250;
    termguicolors = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
  };
}
