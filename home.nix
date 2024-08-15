{ lib,config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dharundds";
  home.homeDirectory = "/home/dharundds";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = lib.concatStrings [
        "[](#d65d0e)"
        "$os"
        "$username"
        "[](bg:#d79921 fg:#d65d0e)"
        "$directory"
        "[](fg:#d79921 bg:#689d6a)"
        "$git_branch"
        "$git_status"
        "[](fg:#689d6a bg:#458588)"
        "$golang"
        "$python"
        "$nodejs"
        "$rust"
        "[](fg:#458588 bg:#665c54)"
        "$docker_context"
        "[](fg:#665c54 bg:#3c3836)"
        "$time"
        "[ ](fg:#3c3836)"
      ];

      # Disable the blank line at the start of the prompt
      add_newline = false;

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      username = {
        show_always = true;
        style_user = "bg:#d65d0e fg:#fbf1c7";
        style_root = "bg:#d65d0e fg:#fbf1c7";
        format = "[ $user ]($style)";
        disabled = false;
      };
      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      os =
        {
          style = "bg:#d65d0e fg:#fbf1c7";
          disabled = false; # Disabled by default
        };
      directory = {
        style = "fg:#fbf1c7 bg:#d79921";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      # Here is how you can shorten some long paths by text replacement
      # similar to mapped_locations in Oh My Posh:
      # [directory.substitutions]
      # "Documents" = "󰈙 "
      #   "Downloads" = " "
      # "Music" = " "
      # "Pictures" = " "
      # Keep in mind that the order matters. For example:
      # "Important Documents" = " 󰈙 "
      # will not be replaced, because "Documents" was already substituted before.
      # So either put "Important Documents" before "Documents" or use the substituted version:
      # "Important 󰈙 " = " 󰈙 "
      docker_context = {
        symbol = " ";
        style = "bg:#06969A";
        format = "[ $symbol $context ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#689d6a";
        format = "[[ $symbol $branch ](fg:#fbf1c7 bg:#689d6a)]($style)";
      };
      git_status = {
        style = "bg:#689d6a";
        format = "[[($all_status$ahead_behind )](fg:#fbf1c7 bg:#689d6a)]($style)";
      };
      golang =
        {
          symbol = " ";
          style = "bg:#458588";
          format = "[[ $symbol( $version) ](fg:c#fbf1c7 bg:#458588)]($style)";
        };
      nodejs = {
        symbol = "";
        style = "bg:#458588";
        format = "[[ $symbol( $version) ](fg:c#fbf1c7 bg:#458588)]($style)";
      };
      rust =
        {
         symbol = "";
         style = "bg:#458588";
         format = "[[ $symbol( $version) ](fg:c#fbf1c7 bg:#458588)]($style)";
        };
      python = {
       symbol = "";
       style = "bg:#458588";
       format = "[[ $symbol( $version) ](fg:c#fbf1c7 bg:#458588)]($style)";
      };
      time = {
       disabled = false;
       time_format = "%R";
       style = "bg:#3c3836";
       format = "[[  $time ](fg:c#fbf1c7 bg:#3c3836)]($style)";
      };
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

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zoxide" ];
      theme = "robbyrussell";
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dharundds/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
