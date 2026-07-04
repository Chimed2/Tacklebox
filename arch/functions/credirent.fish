function credirent --description "Create a directory and immediately enter it"
    if test (count $argv) -eq 0
        echo "Error: Please provide a directory path."
        echo "Usage: credirent <dirname>"
        return 1
    end

    if mkdir -p $argv
        cd $argv[-1]
    else
        echo "Error: Failed to create directory."
        return 1
    end
end
