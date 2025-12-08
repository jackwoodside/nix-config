{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "20267593+jackwoodside@users.noreply.github.com";
        name = "jackwoodside";
      };

      pull.rebase = false;
    };
  };
}
