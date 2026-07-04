function clip --description "Copy stdin or argument to clipboard"
    if test (count $argv) -ge 1
        echo -n $argv | xclip -selection clipboard
    else
        xclip -selection clipboard
    end
end
