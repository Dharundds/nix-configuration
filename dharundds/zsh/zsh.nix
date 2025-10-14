{pkgs, config, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # cursor = "cursor . > /dev/null 2>&1 &";
      # psql = "docker exec -it postgres psql";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zoxide" ];
      theme = "robbyrussell";
    };
  };
}