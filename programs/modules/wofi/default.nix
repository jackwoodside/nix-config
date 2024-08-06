{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      columns = 2;
      hide_scroll = true;
      matching = "fuzzy";
      sort_order = "alphabetical";
    };
    style = builtins.readFile ./default.css;
  };
}
