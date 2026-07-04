function quote --description "Show a random quote"
    set -l raw (curl -s "https://zenquotes.io/api/random")
    set -l q (echo $raw | string match -r '"q":"[^"]*"' | string replace -r '.*"q":"([^"]*)".*' '$1')
    set -l a (echo $raw | string match -r '"a":"[^"]*"' | string replace -r '.*"a":"([^"]*)".*' '$1')
    echo "$q"
    echo "  — $a"
end
