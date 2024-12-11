{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        color = {
          "1" = "blue";
          "2" = "red";
        };
        type = "small";
        preserveAspectRatio = true;
        printRemaining = false;
      };
      display = {
        separator = " -> ";
        color = {
          keys = "black";
          output = "blue";
          "1" = "blue";
          "2" = "red";
          "3" = "green";
        };
      };
      modules = [
        {
          type = "title";
          color = {
            user = "blue";
            at = "black";
            host = "red";
          };
        }
        {
          type = "os";
          key = "os";
          format = "{3}";
        }
        {
          type = "kernel";
          key = "kernel";
        }
        {
          type = "shell";
          key = "shell";
        }
        {
          type = "terminal";
          key = "term";
        }
        {
          type = "cpu";
          key = "cpu";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "gpu";
          format = "{2}";
        }
        "break"
        {
          type = "colors";
          block.range = [
            0
            7
          ];
        }
        "break"
      ];
    };
  };
}
