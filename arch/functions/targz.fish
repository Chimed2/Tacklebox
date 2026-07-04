function targz --description "Create a tar.gz archive from files or directories"
    if test (count $argv) -lt 2
        echo "Usage: targz <output_name> <file> [file...]"
        return 1
    end
    set -l name $argv[1]
    if not string match -q "*.tar.gz" $name
        set name "$name.tar.gz"
    end
    tar -czf $name $argv[2..-1]
end
