{ pkgs, ... }:

{
  # Relies on zsh-completions, fzf, zoxide, pokemon-colorscripts, eza, lazygit, and lazydocker
  # Controls zsh, FZF styling (!), zoxide injection, and aliases
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
      share = true;
    };

    oh-my-zsh = {
      enable = false; # we don't want imperative config in a declarative system
    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions; # This is allegedly a community package that provides a larger set of completions
      }
    ];

    initContent = builtins.readFile ../dotfiles/.zshrc;
  };
}