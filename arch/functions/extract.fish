function extract --description "Extracts most common archive formats"
    if test (count $argv) -eq 0
        echo "Usage: extract <archive_file>"
        return 1
    end

    if test -f $argv[1]
        set -l file $argv[1]
        set -l ext (string match -r '\.[^.]+$' $file)

        if string match -q "*.tar.*" $file
            set ext ".tar"
        end

        switch $ext
            case '.zip'
                unzip $file
            case '.7z'
                7z x $file
            case '.tar' '.tgz' '.tar.gz' '.tar.bz2' '.tar.xz'
                tar -xvf $file
            case '.rar'
                unrar x $file
            case '.gz'
                gunzip $file
            case '.bz2'
                bunzip2 $file
            case '.xz'
                unxz $file
            case '*'
                echo "'$file' cannot be extracted via extract"
                return 1
        end
    else
        echo "'$argv[1]' is not a valid file"
        return 1
    end
end
