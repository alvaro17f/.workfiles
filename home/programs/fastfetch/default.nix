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
        separator = "  ";
        color = {
          keys = "yellow";
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
          key = "󱄅";
          format = "{3}";
        }
        {
          type = "kernel";
          key = "󰌽";
        }
        {
          type = "shell";
          key = "";
        }
        {
          type = "wm";
          key = "";
        }
        {
          type = "terminal";
          key = "";
        }
        {
          type = "cpu";
          key = "";
          format = "{1}";
        }
        {
          type = "gpu";
          key = "󰊗";
          format = "{2}";
        }
        {
          type = "packages";
          key = "";
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
