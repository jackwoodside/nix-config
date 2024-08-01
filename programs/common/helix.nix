{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        color-modes = true;
        cursorline = true;
        line-number = "relative";
        mouse = false;
        true-color = true;
        undercurl = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          render = true;
          skip-levels = 1;
        };
      };

      keys = {
        normal = {
          esc = [
            "keep_primary_selection"
            "collapse_selection"
          ];
        };
      };
    };

    languages = {
      language-server.nil = {
        command = "${pkgs.nil}/bin/nil";
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
        }
      ];
    };
  };
}
