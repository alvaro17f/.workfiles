{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    cargo
    clippy
    rustfmt
    cargo-generate
    cargo-cache
    cargo-machete
    cargo-watch
    go
    gopls
    golangci-lint
    air
    templ
    bun
    typescript
    tailwindcss
    gcc
    python3
    odin
    ols
    zig
    zls
  ];
}
