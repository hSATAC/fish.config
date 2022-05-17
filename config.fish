set fisher_home ~/fisherman
set fisher_config ~/.config/fisherman
alias now='date +"%Y%m%d%H%M"'
alias vim=nvim
alias such=git
alias very=git
alias wow='git status'
alias marked='open -a Marked'
alias k=kubectl
alias mk=minikube

# foobar2000
alias fn='http POST http://192.168.1.51:8880/api/player/next > /dev/null'
alias fp='http POST http://192.168.1.51:8880/api/player/pause/toggle > /dev/null'


#set __fish_git_prompt_color_branch FF9900
#. ~/.config/fish/functions/__fish_git_prompt.fish

function reload
    source ~/.config/fish/config.fish
end

function subl
    open -a "Sublime Text 2.app" $argv
end

function ll
    ls -lhG $argv
end

function la
    ls -lahG $argv
end

function lsd
    ls -d */
end

function ,,
    cd (git rev-parse --show-toplevel)
end

function pr
    if count $argv > /dev/null
        set base $argv[1];
    else
        set base "master"
    end
    set branch (git rev-parse --abbrev-ref HEAD)
    hub pull-request -b kkbox:"$base" -h kkbox:$branch;
end

function send_to_kindle
    echo mobi | mutt -s mobi -a "$argv[1]" -- hsatac@kindle.cn
end

set -g -x fish_greeting ''
set -g -x LSCOLORS ExGxfxfxCxdxdxhbadbxbd
set -g fish_color_cwd 0066FF

set -g theme_display_virtualenv no
set -g theme_display_nvm no

rvm default
set -gx PATH /home/cat/bin $PATH
#set -gx PATH $PATH /opt/homebrew/bin
#set -gx PATH $PATH $HOME/Library/Python/3.8/bin
set -gx GOBIN $HOME/bin
set -gx GOPATH $HOME/go
fish_add_path /opt/homebrew/bin


# For git gpg sign
set -x GPG_TTY (tty)

# kubeconfig
set -gx KUBECONFIG $HOME/.kube/aia-txg-config
set -gx KUBECONFIG $HOME/.kube/aia-tpe-config
set -gx KUBECONFIG $HOME/.kube/config:$KUBECONFIG

set -gx BYOBU_PREFIX /usr/local

# direnv
eval (direnv hook fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cat/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/cat/Downloads/google-cloud-sdk/path.fish.inc'; end
