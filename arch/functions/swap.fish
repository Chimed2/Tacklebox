function swap --description "Swap two filenames"
    if test (count $argv) -ne 2
        echo "Usage: swap <file1> <file2>"
        return 1
    end
    set -l tmp (mktemp -p (dirname $argv[1]))
    mv $argv[1] $tmp
    mv $argv[2] $argv[1]
    mv $tmp $argv[2]
end
