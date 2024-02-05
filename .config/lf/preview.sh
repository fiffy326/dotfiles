#!/bin/sh

cache_dir="$XDG_CACHE_HOME/lf"

file_path="$1"

file_extension="$(\
    # Dereference symlinks
    printf '%s\n' "$(readlink -f "$file_path")" |\

    # Make lowercase
    awk '{print tolower($0)}' |\

    # Extract the file's extension from its path (if it has one).
    awk -F '.' '{print $NF}'
)"

case "$file_extension" in
    md)
        glow "$file_path"
        ;;

    png|jpg|jpeg|webp|gif)
        chafa --polite on --size="$2x$3" "$file_path"
        ;;

    rar)
        unrar l "$file_path"
        ;;

    zip)
        unzip -l "$file_path"
        ;;

    mp4|mp3|mkv|wav|flac)
        mediainfo "$file_path"
        ;;

    *)
        bat --paging=never --style=numbers --terminal-width "$(($2-5))" -f "$file_path"
        ;;
esac

exit 0
