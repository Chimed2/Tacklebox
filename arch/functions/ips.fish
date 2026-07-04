function ips --description "Show all local IP addresses"
    if command -q ip
        ip -br addr show | awk '{print $1, $3}'
    else
        ifconfig 2>/dev/null | grep -E '^[a-z]|inet ' | awk '{if ($1 ~ /^[a-z]/) dev=$1; else print dev, $2}'
    end
end
