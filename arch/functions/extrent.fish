function extrent --description "Extract an archive and automatically enter its directory"
    if test (count $argv) -eq 0
        echo "Usage: extrent <archive_file>"
        return 1
    end

    set -l file $argv[1]

    if not test -f $file
        echo "'$file' is not a valid file"
        return 1
    end

    set -l target_dir ""
    if string match -q "*.tar*" $file
        set target_dir (tar -tf $file | head -n 1 | string match -r '^[^/]+')
    else if string match -q "*.zip" $file
        set target_dir (unzip -l $file | awk 'NR>3 && $4 {print $4; exit}' | string match -r '^[^/]+')
    else if string match -q "*.7z" $file
        set target_dir (7z l $file | awk '/----+/{p=1;next} p && $6 {print $6; exit}' | string match -r '^[^/]+')
    end

    extract $file
    if test $status -eq 0; and test -n "$target_dir"; and test -d $target_dir
        cd $target_dir
    end
end
