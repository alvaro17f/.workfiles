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
    };

    open = {
      rules = [
        {
          name = "*/";
          use = [
            "compress"
          ];
        }

        {
          mime = "text/*";
          use = [
            "edit"
            "compress"
          ];
        }
        {
          mime = "image/*";
          use = [
            "compress"
          ];
        }
        {
          mime = "video/*";
          use = [
            "compress"
          ];
        }
        {
          mime = "audio/*";
          use = [
            "compress"
          ];
        }
        {
          mime = "inode/x-empty";
          use = [
            "edit"
            "compress"
          ];
        }

        {
          mime = "application/pdf";
          use = [
            "compress"
          ];
        }

        {
          mime = "application/{tar,bzip*,7z-compressed,xz,rar,zip,gzip}";
          use = [
            "extract"
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
