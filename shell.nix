{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    neovim
    vim
    go_1_22
    cowsay
    lolcat
    php
    nodejs_21
    rustup
    git-credential-manager
  ];
  shellHook = with pkgs; ''
    echo "BOIS, WE DID IT" | ${cowsay}/bin/cowsay | ${lolcat}/bin/lolcat
  '';
}
