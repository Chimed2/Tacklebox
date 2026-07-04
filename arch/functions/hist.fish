function hist --description "Search command history"
    if test (count $argv) -eq 0
        history
    else
        history | grep -i $argv[1]
    end
end
