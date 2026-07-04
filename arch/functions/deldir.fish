function deldir --description "Delete a directory with confirmation"
    if test (count $argv) -eq 0
        echo "Usage: deldir <directory>"
        return 1
    end
    for dir in $argv
        if not test -d $dir
            echo "Error: '$dir' is not a valid directory"
            continue
        end
        read -l -P "Remove directory '$dir' and all its contents? [y/N] " confirm
        if string match -q "y" "$confirm"
            rm -rf $dir
            echo "Removed: $dir"
        else
            echo "Skipped: $dir"
        end
    end
end
