function modperm --description "Change file permissions using easy keywords"
    set -l usage "Usage: modperm [exec | private | readonly | reset] <filename>"

    if test (count $argv) -lt 2
        echo "Error: Missing arguments."
        echo $usage
        return 1
    end

    set -l action $argv[1]
    set -l files $argv[2..-1]

    for file in $files
        if not test -f $file
            echo "Error: '$file' is not a valid file."
            continue
        end

        switch $action
            case exec
                chmod +x $file
                echo "Made executable: $file (+x)"

            case private
                chmod 600 $file
                echo "Made private: $file (rw-------)"

            case readonly
                chmod 444 $file
                echo "Made read-only: $file (r--r--r--)"

            case reset
                chmod 644 $file
                echo "Reset to standard permissions: $file (rw-r--r--)"

            case '*'
                echo "Error: Unknown action '$action'."
                echo $usage
                return 1
        end
    end
end
