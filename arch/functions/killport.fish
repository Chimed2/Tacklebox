function killport --description "Kill process listening on a given port"
    if test (count $argv) -eq 0
        echo "Usage: killport <port>"
        return 1
    end
    set -l port $argv[1]
    set -l pid (lsof -ti :$port 2>/dev/null)
    if test -z "$pid"
        echo "No process found on port $port"
        return 1
    end
    kill $pid
    echo "Killed process $pid on port $port"
end
