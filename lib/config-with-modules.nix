{ config, pkgs, ... }:

{
    # Relies on adw-gtk3, whitesur-icon-theme, and bibata-cursors
    # Controls just GTK themeing
    gtk = {
        enable = true;

        theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
        };

        iconTheme = {
        name = "WhiteSur-dark";
        package = pkgs.whitesur-icon-theme;
        };

        cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        };

        gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        };
    };


    # Relies on tmuxPlugins
    # Controls tmux settings and themeing
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


    # Relies on zsh-completions, fzf, zoxide, pokemon-colorscripts, eza, lazygit, and lazydocker
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


    programs.fzf.enable = true;


    programs.zoxide.enable = true;


    programs.oh-my-posh.enable = true;
}