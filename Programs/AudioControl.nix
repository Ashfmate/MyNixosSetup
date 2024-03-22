{ pkgs }:

pkgs.writeShellScriptBin "AudioControl" ''
	if (( $1 == 0 )); then
		${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	elif (( $1 == 1 )); then
		${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
	elif (( $1 == 2 )); then
		${pkgs.wireplumber}/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-
	else
		${pkgs.libnotify}/bin/notify-send "The options are to toggle mute (0) or to raise the volume (1) or to lower it (2)"
	fi
''
