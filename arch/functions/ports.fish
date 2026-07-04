function ports --description "Show listening ports and their processes"
    lsof -iTCP -sTCP:LISTEN -P -n 2>/dev/null
end
