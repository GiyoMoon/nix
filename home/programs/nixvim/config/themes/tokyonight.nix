{
  programs.nixvim.colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
      light_style = "day";
      transparent = true;
      styles = {
        sidebars = "dark";
        floats = "dark";
      };
      day_brightness = 0.5;
    };
  };
}
