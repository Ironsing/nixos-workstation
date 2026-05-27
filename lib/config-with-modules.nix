{ config, pkgs, ... }:

{
  # Controls just GTK themeing
  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Controls tmux settings, bindings, and themeing
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

  # Controls zsh, FZF styling (!) and aliases
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

  programs.oh-my-posh.enable = true;

  programs.zoxide.enable = true;

  programs.fzf.enable = true;

  programs.ripgrep.enable = true;

  programs.fd.enable = true;

  programs.uv.enable = true;

  programs.ssh.enable = true;

  programs.jq.enable = true;
  home.sessionVariables = {
    JQ_COLORS = "0;90:0;31:0;32:0;36:0;33:1;35:1;37:1;34";
  }; # programs.jq.colors doesn't seem to work, so we have to set the env var directly

  programs.git = {
    enable = true;
    settings = {
      user.name = "Ironsing";
      user.email = "82096630+Ironsing@users.noreply.github.com";

      init.defaultBranch = "main";
      core.editor = "code --wait";

      alias = {
        st = "status";
        co = "checkout";
        cm = "commit";
        lg = "log --oneline --graph --decorate";
      };
    };
  };
}
