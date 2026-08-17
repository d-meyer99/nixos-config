let
  isVm = false;
  aliases = (import ./aliases.nix) isVm;
in
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # History
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "pwd"
      "clear"
    ];
    historyFileSize = 100000;
    historySize = 100000;

    # Quality-of-life shopt options
    shellOptions = [
      # cd by typing directory name (no 'cd' prefix)
      "autocd"
      # ** matches all files & dirs recursively
      "globstar"
      # Minor typos in dir names for cd are corrected
      "cdspell"
      # Save multiline commands as single history entries
      "cmdhist"
      # Append to history file, don't overwrite
      "histappend"
      # Check window size after each command
      "checkwinsize"
    ];

    shellAliases = aliases;
    profileExtra = ''
      if [[ -z $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
          dbus-run-session Hyprland
      fi'';
    bashrcExtra = ''
      PS1="\[\e[38;5;80m\]bash:\[\e[38;5;182;1m\]\w\$\[\e[0m\] ";
      if [[ -z $TMUX ]]; then
          tmux-init;
      fi
      export GOTMPDIR=/home/dm/.go/

      # --- BLE.SH FIXES START HERE ---
      # Only apply if ble.sh loaded successfully
      if [[ -n "''${BLE_VERSION-}" ]]; then
        # Ghost text: dim grey foreground, no background
        ble-face -s auto_complete 'fg=242,bg=none'
        
        # Also fix the syntax error background if it's showing as a red block
        ble-face -s syntax_error 'fg=1,bg=none'
        
        # Suppress the startup cache warnings
        ble-face -s region_insert 'fg=253,bg=none'
      fi
      # --- BLE.SH FIXES END HERE ---

      # Up/Down arrow prefix-search (works alongside ble.sh)
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--info=inline"
    ];
    # Make Ctrl+T search files, Alt+C search directories
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
  };

  home.file.".local/bin/".source = ../../../scripts;
  home.file.".local/share/bash-completion/completions/".source = ../../../scripts/completions;
}
