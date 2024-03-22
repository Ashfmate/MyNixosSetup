{ pkgs }:
pkgs.writeShellScriptBin "TerminalEmulator" ''
${pkgs.kitty}/bin/kitty --hold sh -c "cd ~/Projects/Flakes && nix develop --command ${pkgs.zsh}/bin/zsh"
''
