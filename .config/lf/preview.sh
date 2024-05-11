#!/bin/sh

file="$1"

thumbnail_dir="$XDG_CACHE_HOME/lf"
[ ! -d "$thumbnail_dir" ] && mkdir -p "$thumbnail_dir"

thumbnail_file="$thumbnail_dir/thumbnail.$(\
    stat --printf '%n%i%F%s%W%Y' -- "$(readlink -f "$file")" |\
    sha256sum | awk '{print $1}').jpg"

case "$(printf '%s' "$(readlink -f "$file")" | awk '{print tolower($0)}')" in
    *.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.spx|*.opus|*.mka|*.og[agx]|*.as[fx])
        exiftool "$file"
        ;;

    *.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.tiff|*.gif|*.jfif|*.ico)
        chafa --polite on -s "$4x" "$file"
        ;;

    *.svg)
        [ ! -f "$thumbnail_file" ] && convert -flatten "$file" "$thumbnail_file"
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.xcf)
        [ ! -f "$thumbnail_file" ] && convert -flatten "$file" "$thumbnail_file"
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.m2v|*.mov|*.webm|*.mts|*.m4v|*.qt|*.divx|*.r[am]|*.fl[icv])
        [ ! -f "$thumbnail_file" ] && ffmpegthumbnailer -i "$file" -o "$thumbnail_file" -s 0 -q 5
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.pdf)
        [ ! -f "$thumbnail_file" ] && pdftoppm -jpeg -f 1 -singlefile "$file" > "$thumbnail_file"
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.epub)
        [ ! -f "$thumbnail_file" ] && epub-thumbnailer "$file" "$thumbnail_file" 1024
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.html)
        [ ! -f "$thumbnail_file" ] && wkhtmltoimage --enable-local-file-access --crop-w 640 "$file" "$thumbnail_file"
        chafa --polite on -s "$4x" "$thumbnail_file"
        ;;

    *.doc) catdoc "$file" ;;
    *.docx) docx2txt "$file" ;;
    *.odt|*.ods|*.odp|*.sxw) odt2txt "$file" ;;
    *.tar.gz|*.tgz) tar tzf "$file" ;;
    *.tar.bz2|*.tbz2) tar tjf "$file" ;;
    *.tar.txz|*.txz) xz --list "$file" ;;
    *.tar) tar tf "$file" ;;
    *.zip|*.jar|*.war|*.ear|*.oxt|*.fcstd|*.fcbak) unzip -l "$file" ;;
    *.gz) gzip -l "$file" ;;
    *.7z) 7z l "$file" ;;
    *.rar) unrar l "$file" ;;
    *.iso) iso-info --no-header -l "$file" ;;
    *.o) nm "$file" ;;
    *.[1-8]) man "$file" ;;
    *)
        if file -ibL "$file" | grep -q 'text'; then
            bat -f --paging=never --style=plain "$file"
        elif file -Lb "$file" | grep -q 'text'; then
            bat -f --paging=never --style=plain "$file"
        else
            file -Lb "$file"
        fi
        ;;
esac
