function up --description "Go up N directories"
    if test (count $argv) -eq 0
        cd ..
        return
    end
    set -l n $argv[1]
    if not string match -qr '^[0-9]+$' "$n"
        echo "Usage: up [N]"
        return 1
    end
    set -l path ""
    for i in (seq $n)
        set path "$path../"
    end
    cd $path
end
