function rvm -d 'Ruby enVironment Manager'
  # run RVM and capture the resulting environment
  set -l env_file (mktemp -t rvm.fish.XXXXXXXXXX)

  bash -c '[ -e ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm || \
           source /usr/local/rvm/scripts/rvm; rvm "$@"; status=$?; \
           env > "$0"; exit $status' $env_file $argv

  # clear GEM_* variables
  and begin; eval ( printenv | cut -f 1 -d '=' | grep GEM_ | sed -e 's|^\(.*\)|set -ge \1; |' ); end

  # grep the rvm_* *PATH RUBY_* GEM_* variables from the captured environment
  # exclude lines with _clr and _debug
  # apply rvm_* *PATH RUBY_* GEM_* variables from the captured environment
  and eval ( \
    grep '^rvm\|^[^=]*PATH\|^RUBY_\|^GEM_' $env_file | \
    grep -v _clr | grep -v _debug | \
    sed '/^PATH/y/:/ /; s/^/set -xg /; s/=/ /; s/$/ ;/; s/(//; s/)//' \
  )

  # clean up
  rm -f $env_file
end
