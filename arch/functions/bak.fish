function bak --description "Backup a file with a timestamp suffix"
    if test (count $argv) -eq 0
        echo "Usage: bak <file>"
        return 1
    end
    for file in $argv
        if not test -f $file
            echo "Error: '$file' is not a valid file"
            continue
        end
        set -l timestamp (date "+%Y%m%d_%H%M%S")
        cp -a $file "$file.bak.$timestamp"
        echo "Backed up: $file -> $file.bak.$timestamp"
    end
end
