{ pkgs }:
pkgs.writeShellScriptBin "Waybar" ''
	if (( $1 == 0 )); then
		killall waybar
		${pkgs.waybar}/bin/waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
	elif (( $1 == 1 )); then
		killall waybar
	else
		${pkgs.libnotify}/bin/notify-send "Waybar may be initialized (0) or removed (1)"
	fi
''
