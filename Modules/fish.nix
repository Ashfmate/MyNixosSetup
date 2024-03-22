{ config, lib, pkgs, ... }:
{
  programs.kitty.shellIntegration.enableFishIntegration = true;
  programs.nix-index.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    plugins = with pkgs; [
      {
        name = "sponge";
        src = fetchFromGitHub {
   	  owner = "meaningful-ooo";
   	  repo = "sponge";
   	  rev = "1.1.0";
   	  sha256 = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
  	};
      }
      {
        name = "colored-man-pages";
	src = fetchFromGitHub {
          owner = "patrickf1";
          repo = "colored_man_pages.fish";
          rev = "f885c2507128b70d6c41b043070a8f399988bc7a";
          sha256 = "0ifqdbaw09hd1ai0ykhxl8735fcsm0x2fwfzsk7my2z52ds60bwa";
        };
      }
      {
      	name = "done";
	src = fetchFromGitHub {
	  owner = "franciscolourenco";
	  repo = "done";
	  rev = "1.17.1";
	  hash = "sha256-aYKTkx5v7tB6k/UBcS0NOgA6SiRrjzn1lUTH/Xp5DFM=";
	};
      }
      {
	name = "humantime-fish";
	src = fetchFromGitHub {
    	  owner = "jorgebucaran";
    	  repo = "humantime.fish";
    	  rev = "53b2adb4c6aff0da569c931a3cc006efcd0e7219";
    	  sha256 = "sha256-792rPsf2WDIYcP8gn6TbHh9RZvskfOAL/oKfpilaLh0=";
  	};
      }
    ];
  };
}
