{ pkgs }:

pkgs.writeShellScriptBin "example" ''
	echo "$1" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
