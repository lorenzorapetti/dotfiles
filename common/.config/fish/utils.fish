function zn
    set path (zoxide query --interactive)

    if test -n "$path"
        cd $path
        nvim
    else
        echo "No path found."
    end
end
