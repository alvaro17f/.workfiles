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
        merge = {
          confictstyle = "diff3";
        };
        interactive = {
          difffilter = "delta --color-only --features=interactive";
        };
      };
      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          navigate = true;
        };
      };
    };
  };
}
