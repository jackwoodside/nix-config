{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      columns = 2;
      hide_scroll = true;
      insenitive = true;
      matching = "fuzzy";
      no_actions = true;
      prompt = "";
      show = "drun";
      sort_order = "alphabetical";
    };
    style = builtins.readFile ./wofi.css;
  };
}
