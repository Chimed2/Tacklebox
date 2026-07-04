function note --description "Quickly append a timestamped note to ~/notes.txt"
    if test (count $argv) -eq 0
        echo "Usage: note <text>"
        return 1
    end
    set -l timestamp (date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $argv" >>$HOME/notes.txt
end
