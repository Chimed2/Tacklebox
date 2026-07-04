function sysinfo --description "Show system information"
    echo "Hostname: "(hostname)
    echo "Kernel:   "(uname -sr)
    echo "Uptime:   "(uptime -p | string replace 'up ' '')
    echo "Shell:    "(basename $SHELL)
    echo "OS:       "(source /etc/os-release 2>/dev/null; echo $PRETTY_NAME)
end
