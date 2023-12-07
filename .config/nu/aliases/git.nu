def git_current_branch [] {
    (gstat).branch
}

def git_main_branch [] {
    git remote show origin
        | lines
        | str trim
        | find --regex 'HEAD .*?[：: ].+'
        | first
        | str replace 'HEAD .*?[：: ](.+)' '$1'
}

export alias ga = git add
export alias gaa = git add --all

export alias gb = git branch

export alias gc = git commit --verbose
export alias gc! = git commit --verbose --amend

export alias gl = git log

export alias gp = git push
export alias gpl = git pull

export alias gst = git status
