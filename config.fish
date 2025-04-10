if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting

end

function fish_prompt --description 'Prompt ausgeben'
    # Needs to be first in the prompt
    set -l last_status $status

    # Set colors
    set -l normal (set_color $fish_color_normal)
    set -l user_color (set_color cyan)
    set -l host_color (set_color green)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l error_color (set_color $fish_color_error)
    set -l line_color (set_color brblack)

    set -l line $line_color (string repeat -n $COLUMNS ─) $normal
    set -l user $user_color $USER $normal
    set -l host $host_color (prompt_hostname) $normal

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0
    set -l cwd $cwd_color (prompt_pwd) $normal

    set -l vcs $vcs_color (fish_vcs_prompt) $normal

    # Color the prompt differently when we're root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # add exit status on error
    set -l exit_status ""
    if test $last_status -ne 0
        set exit_status $error_color "[" $last_status "]" $normal
    end

    set -l prompt_line (string join '' $user ' at ' $host ' in ' $cwd $vcs ' ' $exit_status)
    set -l prompt_len (string length $prompt_line)

    echo -s $line
    echo -s $prompt_line
    echo -n -s $suffix ' '
end

# Aliases
alias upup "sudo apt update && sudo apt upgrade -y"
alias dops "docker ps --format \"table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Image}}\""
alias lls "ls -l"
alias pdf xdg-open
alias vim nvim
alias dog "dig +noall +answer"

set PATH $PATH /home/christian/.local/bin
set PATH $PATH /home/christian/.rvm/bin

# Binds
fish_default_key_bindings
bind \ef forward-bigword

# Environment
export EDITOR="/usr/bin/nvim"
if test -f ~/.config/fish/environment.fish
    source ~/.config/fish/environment.fish
end
