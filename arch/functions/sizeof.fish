function sizeof --description "Show human-readable size of files or directories"
    if test (count $argv) -eq 0
        echo "Usage: sizeof <file|directory>"
        return 1
    end
    du -sh $argv
end
