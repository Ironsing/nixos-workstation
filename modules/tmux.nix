{ pkgs, ... }: 

{
  # Relies on tmuxPlugins
  # Controls tmux settings, themeing

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    mouse = true;
    prefix = "C-z";
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "emacs";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
    extraConfig = builtins.readFile ../dotfiles/.tmux.conf;
  };
}
