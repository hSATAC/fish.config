alias now='date +"%Y%m%d%H%M"'


set __fish_git_prompt_color_branch FF9900
. /usr/local/opt/fish/share/fish/functions/__fish_git_prompt.fish

function reload
    source ~/.config/fish/config.fish
end

function subl
    open -a "Sublime Text.app" $argv
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

set -g -x fish_greeting ''
set -g -x LSCOLORS ExGxfxfxCxdxdxhbadbxbd
set -g fish_color_cwd 0066FF

set tacklebox_path ~/.tackle ~/.tacklebox

set tacklebox_modules virtualfish virtualhooks
set tacklebox_plugins python extract
set tacklebox_theme urdh

. ~/.tacklebox/tacklebox.fish

rvm default
set -gx PATH $PATH /Users/cat/bin
set -gx GOBIN $HOME/bin
set -gx GOPATH $HOME/go

#eval (docker-machine env default)
set -x DOCKER_TLS_VERIFY "1";
set -x DOCKER_HOST "tcp://192.168.99.100:2376";
set -x DOCKER_CERT_PATH "/Users/cat/.docker/machine/machines/default";
set -x DOCKER_MACHINE_NAME "default";

eval (direnv hook fish)
