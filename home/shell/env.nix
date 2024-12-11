{
  lib,
  pkgs,
  user,
  path,
  settings,
  ...
}:
{
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    # POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    NIX_SHELL_PRESERVE_PROMPT = 1;
    #NIXOS_OZONE_WL = "1"; # electron wayland

    EDITOR = settings.apps.editor;
    EXPLORER = settings.apps.explorer;
    TERMINAL = settings.apps.terminal;
    TERM = "xterm-256color";
    COLORTERM = "truecolor";
    GIT_EDITOR = settings.apps.editor;
    USER = user;
    HOME = "${path.home}";
    CONFIG = "${path.home}/.config";
    LOCAL = "${path.home}/.local";
    TEMP = "/tmp";
    NPM_CONFIG_USERCONFIG = "${path.config}/npm/npmrc";
    NI_CONFIG_FILE = "${path.config}/ni/.nirc";
    GNUPGHOME = "${path.local}/share/gnupg";
    GTK2_RC_FILES = lib.mkForce "${path.config}/gtk-2.0/gtkrc";
    RIPGREP_CONFIG_PATH = lib.mkForce "${path.config}/ripgrep/ripgreprc";
    XKB_DEFAULT_LAYOUT = settings.keyboard.layout;
    XKB_DEFAULT_VARIANT = settings.keyboard.variant;
    XKB_DEFAULT_OPTIONS = settings.keyboard.options;
    MOZ_ENABLE_WAYLAND = "1";
    KITTY_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    XDG_SESSION_TYPE = "wayland";
    XDG_CONFIG_HOME = "${path.home}/.config";
    XDG_CACHE_HOME = "${path.home}/.cache";
    XDG_DATA_HOME = "${path.home}/.local/share";
    LESSHISTFILE = "-";
    PAGER = settings.apps.pager;
    MANPAGER = settings.apps.pager;
    MANROFFOPT = "-c";

    #======= langs =======#
    GOPATH = lib.mkForce "${path.local}/go";
    CARGO_HOME = lib.mkForce "${path.local}/cargo";
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };

  home.sessionPath = [
    "/bin"
    "${path.home}/bin"
    "${path.home}/.local/bin"
    "${path.home}/.local/share/nvim/mason/bin"
    "\$GOROOT/bin"
    "\$GOPATH/bin"
    "\$CARGO_HOME/bin"
  ];
}
