{ user, ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      format = "[](#313244)$username[](bg:#45475a fg:#313244)$directory[](fg:#45475a bg:#585b70)$git_branch$git_status[](fg:#585b70 bg:#89dceb)$golang$nodejs$rust$zig[](fg:#89dceb bg:#89b4fa)$time[ ](fg:#89b4fa)";

      command_timeout = 5000;
      # add_newline = false;

      username = {
        show_always = true;
        style_user = "bold fg:#cdd6f4 bg:#313244";
        style_root = "bold fg:#f38ba8 bg:#313244";
        format = ''[${user} ]($style)'';
      };

      directory = {
        style = "bold fg:#cdd6f4 bg:#45475a";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "";
        style = "bold fg:#cdd6f4 bg:#585b70";
        format = ''[ $symbol $branch ]($style)'';
      };

      git_status = {
        style = "bold fg:#cdd6f4 bg:#585b70";
        format = ''[$all_status$ahead_behind ]($style)'';
      };

      golang = {
        symbol = "󰟓 ";
        style = "bold fg:#1e1e2e bg:#89dceb";
        format = ''[ $symbol ($version) ]($style)'';
      };

      nodejs = {
        symbol = "󰎙 ";
        style = "bold fg:#1e1e2e bg:#89dceb";
        format = ''[ $symbol ($version) ]($style)'';
      };

      rust = {
        symbol = " ";
        style = "bold fg:#1e1e2e bg:#89dceb";
        format = ''[ $symbol ($version) ]($style)'';
      };

      zig = {
        symbol = " ";
        style = "bold fg:#1e1e2e bg:#89dceb";
        format = ''[ $symbol ($version) ]($style)'';
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bold fg:#1e1e2e bg:#89b4fa";
        format = ''[ 󰔚 $time ]($style)'';
      };

    };

  };
}
