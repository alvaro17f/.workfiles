{
  pkgs,
  settings,
  ...
}:
let
  catppuccin = {
    theme = {
      activeBorderColor = [
        "#89b4fa"
        "bold"
      ];
      inactiveBorderColor = [ "#a6adc8" ];
      optionsTextColor = [ "#89b4fa" ];
      selectedLineBgColor = [ "#313244" ];
      selectedRangeBgColor = [ "#313244" ];
      cherryPickedCommitBgColor = [ "#45475a" ];
      cherryPickedCommitFgColor = [ "#89b4fa" ];
      unstagedChangesColor = [ "#f38ba8" ];
      defaultFgColor = [ "#cdd6f4" ];
      searchingActiveBorderColor = [ "#f9e2af" ];
    };
    authorColors = {
      "*" = "#b4befe";
    };
  };
in
{
  imports = [
    ./scripts/aicommit.nix
  ];

  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      disableStartupPopups = true;
      notARepository = "quit";
      promptToReturnFromSubprocess = false;
      gui = {
        nerdFontsVersion = "3";
        theme = catppuccin.theme;
        authorColors = catppuccin.authorColors;
        showFileTree = false;
      };
      os = {
        editPreset = if settings.apps.editor == "nvim" then "nvim-remote" else settings.apps.editor;
      };
      customCommands = [
        {
          key = "<c-a>";
          description = "Pick LLM commit";
          loadingText = "waiting for LLM to generate commit messages...";
          command = "aicommit";
          context = "files";
          subprocess = true;
        }
      ];
    };
  };
}
