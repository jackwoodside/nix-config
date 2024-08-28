{
  config,
  lib,
  pkgs,
  ...
}:

let
  colours = config.colorScheme.hashedColors;
in
{
  programs.fzf =
    let
      fd = "${lib.getExe pkgs.fd}";
      tree = "${lib.getExe pkgs.tree}";
    in
    {
      enable = true;
      colors = {
        "bg" = colours.base00;
        "bg+" = colours.base02;
        "fg" = colours.base05;
        "fg+" = colours.base05;
        "hl" = colours.base08;
        "hl+" = colours.base08;
        "header" = colours.base08;
        "pointer" = colours.base06;
        "marker" = colours.base06;
        "spinner" = colours.base06;
        "prompt" = colours.base0E;
        "info" = colours.base0E;
      };
      changeDirWidgetCommand = "${fd} --type d";
      changeDirWidgetOptions = [ "--preview '${tree} -C {} | head -200'" ];
      fileWidgetCommand = "${fd} --type f";
      fileWidgetOptions = [ "--preview 'head {}'" ];
      historyWidgetOptions = [
        "--sort"
        "--exact"
      ];
    };
}
