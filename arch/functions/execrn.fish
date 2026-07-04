function execrn --description "Run a command in the background detached"
    if test (count $argv) -eq 0
        echo "Error: Please provide a command to run."
        echo "Usage: execrn <command> [args...]"
        return 1
    end

    nohup $argv >/dev/null 2>&1 &
    disown
    echo "Running in background: $argv[1]"
end
