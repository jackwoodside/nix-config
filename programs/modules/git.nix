{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "20267593+jackwoodside@users.noreply.github.com";
    userName = "jackwoodside";
    extraConfig = {
      pull.rebase = false;
    };
  };
}
