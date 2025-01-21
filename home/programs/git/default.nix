{ settings, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = settings.name;
      userEmail = settings.git.email;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        credential = {
          helper = "store";
        };
        push = {
          autoSetupRemote = true;
        };
        diff = {
          tool = "nvimdiff";
        };
      };
      difftastic = {
        enable = true;
        display = "side-by-side";
        color = "always";
      };
    };
  };
}
