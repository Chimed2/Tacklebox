function execnlog --description "Run a command, show output, and save to a log file"
    if test (count $argv) -eq 0
        echo "Error: Please provide a command to run."
        echo "Usage: execnlog <command> [args...]"
        return 1
    end

    mkdir -p ./logs
    set -l cmd_name (basename $argv[1])
    set -l timestamp (date "+%Y%m%d_%H%M%S")
    set -l log_file "./logs/$cmd_name-$timestamp.log"

    echo "Logging output to: $log_file"
    echo "--- Started: (date) ---" >$log_file

    $argv 2>&1 | tee -a $log_file
end
