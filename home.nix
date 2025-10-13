{ config, inputs, lib, services, pkgs, ... }:

{
  imports = [
    ./nixvim.nix
  ];
  home.username = "zzio";
  home.homeDirectory = "/home/zzio";

  home.packages = with pkgs; [
    fastfetch
    ranger
    inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
    tailscale
    # gnome
    gnomeExtensions.pano
    gnomeExtensions.tailscale-qs

    ripgrep
    fzf
    fd
    zip
    unzip
    lshw
    eza
    pkg-config
    yt-dlp
    
    btop
    lazygit

    gcc
    go
    nodejs_22
    pnpm
    rustc
    cargo
    rust-analyzer
    python314
    tree-sitter
    claude-code
  ];

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "ibus" "hangul" ])
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    shellAliases = {
      ls = "eza";
      reload = "sudo nixos-rebuild switch";
    };

    initContent = "${pkgs.fastfetch}/bin/fastfetch";

    oh-my-zsh = {
      enable = true;
    };
  };

  xdg.configFile."ghostty".source = config.lib.file.mkOutOfStoreSymlink ./ghostty;


  home.stateVersion = "25.05";
}
