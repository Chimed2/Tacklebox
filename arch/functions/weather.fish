function weather --description "Show weather forecast for a city (default: current location)"
    if test (count $argv) -eq 0
        curl -s "wttr.in?m" | head -n -3
    else
        curl -s "wttr.in/$argv[1]?m" | head -n -3
    end
end
