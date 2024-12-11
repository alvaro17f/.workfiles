{
  pkgs,
  user,
  path,
  settings,
  ...
}:
{
  programs.yazi.keymap = {
    manager.prepend_keymap = [
      {
        on = [ "<Esc>" ];
        run = [
          "escape --select"
          "unyank"
        ];
        desc = "Exit visual mode, clear selected, or cancel search";
      }
      {
        on = [ "<C-[>" ];
        run = [
          "escape --select"
          "unyank"
        ];
        desc = "Exit visual mode, clear selected, or cancel search";
      }
      {
        on = [ "q" ];
        run = [ "quit --no-cwd-file" ];
        desc = "exit the process";
      }
      {
        on = [ "w" ];
        run = [ "quit" ];
        desc = "change directory on exit";
      }
      {
        on = [ "l" ];
        run = [ "plugin smart-enter" ];
        desc = "Enter the child directory, or open the file";
      }

      {
        on = [ "K" ];
        run = [ "seek -5" ];
        desc = "peek up 5 units in the preview";
      }
      {
        on = [ "J" ];
        run = [ "seek 5" ];
        desc = "peek down 5 units in the preview";
      }

      {
        on = [ "<Space>" ];
        run = [
          "toggle"
          "arrow 1"
        ];
        desc = "toggle the current selection state";
      }
      {
        on = [ "V" ];
        run = [ "toggle_all --state=toggle" ];
        desc = "select all files";
      }

      {
        on = [
          "y"
          "y"
        ];
        run = [
          "yank"
          "escape --visual --select"
        ];
        desc = "copy the selected files";
      }
      {
        on = [
          "y"
          "p"
        ];
        run = [ "copy path" ];
        desc = "copy the absolute path";
      }
      {
        on = [
          "y"
          "d"
        ];
        run = [ "copy dirname" ];
        desc = "copy the path of the parent directory";
      }
      {
        on = [
          "y"
          "f"
        ];
        run = [ "copy filename" ];
        desc = "copy the name of the file";
      }
      {
        on = [
          "y"
          "n"
        ];
        run = [ "copy name_without_ext" ];
        desc = "copy the name of the file without the extension";
      }
      {
        on = [
          "d"
          "d"
        ];
        run = [
          "remove"
          "escape --visual --select"
        ];
        desc = "move the files to the trash";
      }

      {
        on = [ "f" ];
        run = [ "find --smart" ];
      }

      {
        on = [
          ","
          ","
        ];
        run = [ "sort natural --dir-first" ];
        desc = "sort naturally";
      }
      {
        on = [
          ","
          "a"
        ];
        run = [ "sort alphabetical --dir-first" ];
        desc = "sort alphabetically";
      }
      {
        on = [
          ","
          "t"
        ];
        run = [ "sort modified --reverse --dir-first" ];
        desc = "sort by modified time";
      }
      {
        on = [
          ","
          "s"
        ];
        run = [ "sort size --reverse --dir-first" ];
        desc = "sort by size";
      }

      {
        on = [ "<C-t>" ];
        run = [ "tab_create --current" ];
        desc = "create a new tab using the current path";
      }
      {
        on = [ "<C-w>" ];
        run = [ "close" ];
        desc = "close the current tab; or quit if it is last tab";
      }

      {
        on = [ "<BackTab>" ];
        run = [ "tab_switch -1 --relative" ];
        desc = "switch to the previous tab";
      }
      {
        on = [ "<Tab>" ];
        run = [ "tab_switch 1 --relative" ];
        desc = "switch to the next tab";
      }
      {
        on = [ "[" ];
        run = [ "tab_switch -1 --relative" ];
        desc = "switch to the previous tab";
      }
      {
        on = [ "]" ];
        run = [ "tab_switch 1 --relative" ];
        desc = "switch to the next tab";
      }

      {
        on = [ "{" ];
        run = [ "tab_swap -1" ];
        desc = "swap the current tab with the previous tab";
      }
      {
        on = [ "}" ];
        run = [ "tab_swap 1" ];
        desc = "swap the current tab with the next tab";
      }

      {
        on = [ "\\" ];
        run = [ "tasks_show" ];
        desc = "show the tasks manager";
      }

      {
        on = [ "?" ];
        run = [ "help" ];
        desc = "open help";
      }

      #################
      # GOTO
      #################
      {
        on = [
          "g"
          "h"
        ];
        run = [ "cd ${path.home}" ];
        desc = "home";
      }
      {
        on = [
          "g"
          "d"
        ];
        run = [ "cd ${path.download}" ];
        desc = "downloads";
      }
      {
        on = [
          "g"
          "x"
        ];
        run = [ "cd ${path.documents}" ];
        desc = "documents";
      }
      {
        on = [
          "g"
          ";"
        ];
        run = [ "cd ${path.desktop}" ];
        desc = "desktop";
      }
      {
        on = [
          "g"
          "p"
        ];
        run = [ "cd ${path.pictures}" ];
        desc = "pictures";
      }
      {
        on = [
          "g"
          "m"
        ];
        run = [ "cd ${path.home}/Media" ];
        desc = "media";
      }

      {
        on = [
          "g"
          "b"
        ];
        run = [ "cd ${path.home}/bin" ];
        desc = "bin";
      }
      {
        on = [
          "g"
          "c"
        ];
        run = [ "cd ${path.config}" ];
        desc = "config";
      }
      {
        on = [
          "g"
          "l"
        ];
        run = [ "cd ${path.local}" ];
        desc = "local";
      }
      {
        on = [
          "g"
          "w"
        ];
        run = [ "cd ${path.workspace}" ];
        desc = "workspace";
      }
      {
        on = [
          "g"
          "."
        ];
        run = [ "cd ${path.dotfiles}" ];
        desc = "dotfiles";
      }

      {
        on = [
          "g"
          "/"
        ];
        run = [ "cd /" ];
        desc = "/";
      }
      {
        on = [
          "g"
          "o"
        ];
        run = [ "cd /opt" ];
        desc = "opt";
      }
      {
        on = [
          "g"
          "e"
        ];
        run = [ "cd /etc" ];
        desc = "etc";
      }
      {
        on = [
          "g"
          "r"
        ];
        run = [ "cd /root" ];
        desc = "root";
      }
      {
        on = [
          "g"
          "u"
        ];
        run = [ "cd /usr" ];
        desc = "usr";
      }
      {
        on = [
          "g"
          "v"
        ];
        run = [ "cd /var" ];
        desc = "var";
      }
      {
        on = [
          "g"
          "\\"
        ];
        run = [ "cd /run/media/${user}" ];
        desc = "external devices";
      }

      #################
      # CUSTOM
      #################
      {
        on = [
          "d"
          "r"
        ];
        run = [ ''shell '${pkgs.ripdrag}/bin/ripdrag "$@"' --block'' ];
        desc = "drag";
      }
      {
        on = [
          "d"
          "t"
        ];
        run = [ ''shell '${pkgs.ripdrag}/bin/ripdrag -t -k .' --block'' ];
        desc = "drag target";
      }
      {
        on = [
          "t"
          "t"
        ];
        run = [ "shell 'trash_restore' --block" ];
        desc = "trash restore";
      }
      {
        on = [
          "t"
          "c"
        ];
        run = [ "shell 'trash_clear' --block" ];
        desc = "trash empty";
      }
      {
        on = [ "=" ];
        run = [ "plugin chmod" ];
        desc = "chmod";
      }
      {
        on = [ "e" ];
        run = [ "shell '${settings.apps.editor} $@' --block" ];
        desc = "${settings.apps.editor}";
      }
      {
        on = [ "c" ];
        run = [ "shell '${settings.apps.code} .'" ];
        desc = "${settings.apps.code}";
      }

      #################
      # SUDO
      #################
      {
        on = [
          "s"
          "u"
        ];
        run = [ "shell 'sudo -E yazi' --block" ];
        desc = "sudo yazi";
      }
      {
        on = [
          "s"
          "d"
        ];
        run = [ ''shell 'sudo rm -rf "$@"' --block'' ];
        desc = "sudo delete";
      }

    ];

    tasks.prepend_keymap = [
      {
        on = [ "\\" ];
        run = [ "close" ];
        desc = "hide the task manager";
      }

      {
        on = [ "d" ];
        run = [ "cancel" ];
        desc = "cancel the task";
      }

      {
        on = [ "?" ];
        run = [ "help" ];
        desc = "open help";
      }
    ];

    select.prepend_keymap = [
      {
        on = [ "?" ];
        run = [ "help" ];
        desc = "open help";
      }
    ];

    input.prepend_keymap = [
      {
        on = [ "?" ];
        run = [ "help" ];
        desc = "open help";
      }
    ];

    completion.prepend_keymap = [
      {
        on = [ "<Esc>" ];
        run = [ "close" ];
        desc = "cancel completion";
      }

      {
        on = [ "<C-k>" ];
        run = [ "arrow -1" ];
        desc = "move cursor up";
      }
      {
        on = [ "<C-j>" ];
        run = [ "arrow 1" ];
        desc = "move cursor down";
      }

      {
        on = [ "?" ];
        run = [ "help" ];
        desc = "open help";
      }
    ];

  };
}
