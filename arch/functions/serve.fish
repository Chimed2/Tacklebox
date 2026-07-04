function serve --description "Start a Python HTTP server on given port (default 8000)"
    set -l port 8000
    if test (count $argv) -ge 1
        set port $argv[1]
    end
    python3 -m http.server $port
end
