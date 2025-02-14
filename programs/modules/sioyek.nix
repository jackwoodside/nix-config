{ config, ... }:

let
  colours = config.colorScheme.hashedColors;
in
{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "fit_to_page_width" = "f";
      "fit_to_page_height" = "F";
      "next_page" = "<pagedown>";
      "previous_page" = "<pageup>";
      "close_window" = "q";
      "toggle_synctex" = "l";
    };
    config = {
      "background_color" = colours.base00;
      "inverse_search_command" = "nvr --remote \"%1\" +%2";
      "overview_size" = "0.85 0.85";
      "page_separator_color" = colours.base00;
      "page_separator_width" = "4";
      "search_url_g" = "https://www.google.com/search?q=";
      "should_launch_new_window" = "1";
      "should_use_multiple_monitors" = "0";
      "show_document_name_in_statusbar" = "1";
      "status_bar_format" = "Page %{current_page} / %{num_pages}%{document_name}%{chapter_name}%{search_results}%{search_progress}";
      "synctex_highlight_color" = "0.0 0.0 0.0";
      "touchpad_sensitivity" = "0.4";
    };
  };
}
