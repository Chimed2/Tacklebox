function myip --description "Show public IP address"
    curl -s https://ifconfig.me 2>/dev/null
end
