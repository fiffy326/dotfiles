# shellcheck shell=sh

[ -n "${__PATH_SH__+x}" ] && return 0
__PATH_SH__=1

path_unload() {
  unset -f \
    path_unload \
    path_list \
    path_contains \
    path_append \
    path_append_recursive \
    path_prepend \
    path_prepend_recursive \
    path_remove \
    path_update
  unset __PATH_SH__
  return 0
}

path_list() {
  printf '%s\n' "${PATH:-}" | tr ':' '\n'
  return 0
}

path_contains() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
  }

  # Check the PATH for each of the given directories.
  for _dir in "$@"; do
    case ":${PATH:-}:" in
      *":${_dir}:"*)
        # The PATH contains this directory, so continue checking the rest.
        continue
        ;;
      *)
        { # Load any previously held values.
          { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
        }

        # The PATH does not contain this directory.
        return 1
        ;;
    esac
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
  }

  # The PATH contains all of the given directories.
  return 0
}

path_append() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
  }

  # Append each given directory to the PATH.
  for _dir in "$@"; do
    [ -n "${_dir}" ] && {
      # The PATH already includes this directory, so skip it.
      path_contains "${_dir}" && continue

      # The PATH does not include this directory, so append it.
      PATH="${PATH:+${PATH}:}${_dir}"
    }
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
  }

  # The given directories have been appended to the PATH.
  return 0
}

path_append_recursive() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
    [ -n "${_subdir+x}" ] && __subdir="${_subdir}" && unset _subdir
  }

  # Append each given directory and its subdirectories to the PATH.
  for _dir in "$@"; do
    while IFS= read -r _subdir; do
      path_append "${_subdir}"
    done << EOF
$(find -L "${_dir}" -type d -exec realpath {} \; 2> /dev/null | sort -u || :)
EOF
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
    { [ -n "${__subdir+x}" ] && _subdir="${__subdir}" && unset __subdir; } || unset _subdir
  }

  # The given directories have been recursively appended to the PATH.
  return 0
}

path_prepend() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
  }

  # Prepend each given directory to the PATH.
  for _dir in "$@"; do
    [ -n "${_dir}" ] && {
      # The PATH already includes this directory, so skip it.
      path_contains "${_dir}" && continue

      # The PATH does not include this directory, so prepend it.
      PATH="${_dir}${PATH:+:${PATH}}"
    }
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
  }

  # The given directories have been appended to the PATH.
  return 0
}

path_prepend_recursive() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
    [ -n "${_subdir+x}" ] && __subdir="${_subdir}" && unset _subdir
  }

  # Prepend each given directory and its subdirectories to the PATH.
  for _dir in "$@"; do
    while IFS= read -r _subdir; do
      path_prepend "${_subdir}"
    done << EOF
$(find -L "${_dir}" -type d -exec realpath {} \; 2> /dev/null | sort -u || :)
EOF
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
    { [ -n "${__subdir+x}" ] && _subdir="${__subdir}" && unset __subdir; } || unset _subdir
  }

  # The given directories have been recursively prepended to the PATH.
  return 0
}

path_remove() {
  { # Save any currently held values.
    [ -n "${_dir+x}" ] && __dir="${_dir}" && unset _dir
  }

  # Remove the given directories from the $PATH if they are included.
  for _dir in "$@"; do
    if path_contains "${_dir}"; then
      # The $PATH includes this directory, so remove it.
      PATH=$(path_list | grep -Fvx "${_dir}" | paste -sd: -)
    fi
  done

  { # Load any previously held values.
    { [ -n "${__dir+x}" ] && _dir="${__dir}" && unset __dir; } || unset _dir
  }

  # The given directories were removed from the PATH.
  return 0
}

path_update() {
  export PATH
  systemctl --user import-environment PATH
  path_unload
  return 0
}
