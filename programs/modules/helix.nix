{ lib, pkgs, ... }:

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
      language-server = {
        typescript-language-server = {
          command = "${lib.getExe pkgs.nodePackages.typescript-language-server}";
        };
        nil = {
          command = "${lib.getExe pkgs.nil}";
        };
      };
      language = [
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "${lib.getExe pkgs.nodePackages.prettier}";
          };
        }
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${lib.getExe pkgs.nixfmt-rfc-style}";
          };
        }
      ];
    };
  };
}
