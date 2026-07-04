function ff --description "Find files by name under current directory"
    if test (count $argv) -eq 0
        echo "Usage: ff <pattern>"
        return 1
    end
    find . -iname "*$argv[1]*" -type f 2>/dev/null
end
