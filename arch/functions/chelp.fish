function chelp --description "List all custom fish functions with descriptions"
    echo "Custom fish commands - run 'chelp' to see this page again"
    echo ""
    for f in $HOME/.config/fish/functions/*.fish
        set -l name (string replace -r '.*/(.*)\.fish' '$1' $f)
        set desc ""
        set -l line (grep '^function.*--description' $f)
        if test -n "$line"
            set desc (string match -r '"[^"]*"' $line)
            if test -z "$desc"
                set desc (string match -r "'[^']*'" $line)
            end
            set desc (string trim -c "\"'" -- $desc)
        end
        if test -n "$desc"
            printf "%-15s %s\n" "$name" "$desc"
        else
            printf "%-15s %s\n" "$name" "(no description)"
        end
    end
end
