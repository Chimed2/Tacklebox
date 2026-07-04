complete -c modperm -n __fish_is_first_arg -f
complete -c modperm -n __fish_is_first_arg -a exec -d "Make file executable"
complete -c modperm -n __fish_is_first_arg -a private -d "Restrict access to owner only"
complete -c modperm -n __fish_is_first_arg -a readonly -d "Make file read-only"
complete -c modperm -n __fish_is_first_arg -a reset -d "Reset to standard 644 permissions"
