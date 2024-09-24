#!/bin/zsh

compress() {
    tar cvzf $1.tar.gz $1
}

ftmuxp() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get the IDs
    ID="$(ls $XDG_CONFIG_HOME/tmuxp | sed -e 's/\.yml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="Create New Session"

    ID="${create_new_session}\n$ID"
    ID="$(echo $ID | fzf | cut -d: -f1)"

    if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "$ID" ]]; then
        # Rename the current urxvt tab to session name
        printf '\033]777;tabbedx;set_tab_name;%s\007' "$ID"
        tmuxp load "$ID"
    fi
}

scratchpad() {
    "$DOTFILES/zsh/scratchpad.sh"
}


t() {
	if tmux has-session -t default 2>/dev/null; then
		tmux attach-session -d -t default
	else
		tmux new-session -d -s default
		# tmux new-window 'nvim ~/'
		# tmux new-window 'top'
		tmux attach-session -t default:1
	fi
}

function vt() {
  IFS=$'\n' items=($(\ls "$HOME"/.config/nvims/))
  items+=('default')
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  else
    config="nvims/$config"
  fi
  NVIM_APPNAME=$config nvim . $@
}

function vtL() {
  IFS=$'\n' items=($(\ls "$HOME"/.config/nvims/))
  items+=('default')
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  else
    config="nvims/$config"
  fi
  NVIM_APPNAME=$config nvimL . $@
}

function vg() {
  IFS=$'\n' items=($(\ls "$HOME"/.config/nvims/))
  items+=('default')
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  else
    config="nvims/$config"
  fi
  NVIM_APPNAME=$config nvim-qt --fullscreen . $@
}

function vgL() {
  IFS=$'\n' items=($(\ls "$HOME"/.config/nvims/))
  items+=('default')
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  else
    config="nvims/$config"
  fi
  NVIM_APPNAME=$config nvim-qt --fullscreen --nvim nvimL . $@
}

function vd() {
  IFS=$'\n' items=($(\ls "$HOME"/.config/nvims/))
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  fi
 config="nvims/$config"
 rm -rf "$HOME"/.config/"$config"
 echo "rm -rf $HOME"/.config/"$config"
 rm -rf "$HOME"/.config/local/share/"$config"
 echo "rm -rf $HOME"/.config/local/share/"$config"
 rm -rf "$HOME"/.local/share/"$config"
 echo "rm -rf $HOME"/.local/share/"$config"
 rm -rf "$HOME"/.local/state/"$config"
 echo "rm -rf $HOME"/.local/state/"$config"
 rm -rf "$HOME"/.cache/"$config"
 echo "rm -rf $HOME"/.cache/"$config"
}
