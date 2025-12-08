{ ... }:

{
  programs.git = {
    enable = true;
    user = {
      email = "20267593+jackwoodside@users.noreply.github.com";
      name = "jackwoodside";
    };
    settings = {
      pull.rebase = false;
    };
  };
}
