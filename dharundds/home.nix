{ lib,config, pkgs, ... }:

{
  imports = [
    # git
    ./git/git.nix

    # zsh
    ./zsh/zsh.nix

    # zoxide
    ./zoxide/z.nix

    # Starship
    ./starship/starship.nix

    # gnome
    ./gnome/gnome.nix

    # kitty
    ./kitty/kitty.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dharundds";
  home.homeDirectory = "/home/dharundds";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    gnome.dconf-editor
  ];

  programs.htop.enable = true;
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

  };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
