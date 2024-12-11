{ settings, ... }:
{
  programs.yazi.settings = {
    manager = {
      sort_by = "natural";
      show_hidden = true;
      show_symlink = false;
    };

    plugin = {
      prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };

    opener = {
      open = [
        {
          run = ''xdg-open "$1"'';
          orphan = true;
          desc = "Open";
          for = "linux";
        }
      ];
      edit = [
        {
          run = ''${settings.apps.editor} "$@"'';
          desc = "${settings.apps.editor}";
          block = true;
          for = "linux";
        }
      ];
      reveal = [
        {
          run = ''${settings.apps.explorer_gui} "$@"'';
          desc = "${settings.apps.explorer_gui}";
          orphan = true;
          for = "linux";
        }
      ];
      pdf = [
        {
          run = ''${settings.apps.pdf} "$@"'';
          desc = "${settings.apps.pdf}";
          orphan = true;
          for = "linux";
        }
      ];
      compress = [
        {
          run = ''ouch compress "$@" "$1".zip'';
          desc = "ouch";
          for = "linux";
        }
      ];
      extract = [
        {
          run = ''ouch decompress "$@" -y'';
          desc = "ouch";
          for = "linux";
        }
        {
          run = ''file-roller "$@"'';
          desc = "file-roller";
          for = "linux";
        }
      ];
      image = [
        {
          run = ''${settings.apps.image} "$@"'';
          desc = "${settings.apps.image}";
          orphan = true;
          for = "linux";
        }
      ];
      player = [
        {
          run = ''${settings.apps.player} --player-operation-mode=pseudo-gui "$@"'';
          desc = "${settings.apps.player}";
          orphan = true;
          for = "linux";
        }
      ];
      nextcloud = [
        {
          run = ''nextcloud "$1"'';
          desc = "nextcloud";
          for = "linux";
        }
      ];
      reaper = [
        {
          run = ''${settings.apps.daw} "$1"'';
          desc = "${settings.apps.daw}";
          orphan = true;
          for = "linux";
        }
      ];
    };

    open = {
      rules = [
        {
          name = "*.nextcloud";
          use = [
            "nextcloud"
            "reveal"
            "compress"
          ];
        }
        {
          name = "*.rpp";
          use = [
            "reaper"
            "reveal"
            "compress"
          ];
        }

        {
          name = "*/";
          use = [
            "reveal"
            "compress"
          ];
        }

        {
          mime = "text/*";
          use = [
            "edit"
            "reveal"
            "compress"
          ];
        }
        {
          mime = "image/*";
          use = [
            "image"
            "reveal"
            "compress"
          ];
        }
        {
          mime = "video/*";
          use = [
            "player"
            "reveal"
            "compress"
          ];
        }
        {
          mime = "audio/*";
          use = [
            "player"
            "reveal"
            "compress"
          ];
        }
        {
          mime = "inode/x-empty";
          use = [
            "edit"
            "reveal"
            "compress"
          ];
        }

        {
          mime = "application/pdf";
          use = [
            "pdf"
            "reveal"
            "compress"
          ];
        }

        {
          mime = "application/{tar,bzip*,7z-compressed,xz,rar,zip,gzip}";
          use = [
            "extract"
            "reveal"
          ];
        }

        {
          mime = "*";
          use = [
            "edit"
            "open"
            "reveal"
            "compress"
          ];
        }
      ];
    };
  };
}
