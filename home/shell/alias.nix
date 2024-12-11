{
  pkgs,
  settings,
  ...
}:
{
  home.shellAliases = {
    g = "git_launcher";
    grep = "${pkgs.gnugrep}/bin/grep --color=auto";
    egrep = "${pkgs.gnugrep}/bin/egrep --color=auto";
    fgrep = "${pkgs.gnugrep}/bin/fgrep --color=auto";
    grex = "${pkgs.grex}/bin/grex -c";
    j = settings.apps.explorer;
    jctl = "journalctl -p 3 -xb";
    ls = "${pkgs.lsd}/bin/lsd -aA";
    ll = "${pkgs.lsd}/bin/lsd -alA";
    lt = "${pkgs.lsd}/bin/lsd -aA --tree";
    mv = "mv -i";
    ouch = "${pkgs.ouch}/bin/ouch --accessible";
    rm = "rm -i";
    rmrf = "rm -rf";
    speedtest = "${pkgs.speedtest-go}/bin/speedtest-go";
    sudo = "sudo ";
    sudoe = "sudo -E ";
    ttyper = "${pkgs.ttyper}/bin/ttyper -w 20";
    ttyperes = "${pkgs.ttyper}/bin/ttyper -l spanish -w 20";
    #========== nixos ==========#
    "," = "nix-shell -p";
    gendelete = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +10";
    genlist = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    rebuild = "nix flake update --flake ~/.workfiles && home-manager switch --flake ~/.workfiles && nix profile wipe-history";
    nixdiff = "nix profile diff-closures --profile /nix/var/nix/profiles/system";
  };
}
