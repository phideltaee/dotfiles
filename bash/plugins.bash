# dircolors
if [[ "$(tput colors)" == "256" ]]; then
    temp_dircolors=$(mktemp)
    cat ~/.shell/plugins/dircolors-solarized/dircolors.256dark ~/.shell/dircolors.extra > "$temp_dircolors"
    
    # Use gdircolors on macOS (GNU coreutils) or dircolors on Linux
    if command -v gdircolors >/dev/null 2>&1; then
        eval "$(gdircolors -b "$temp_dircolors")"
    elif command -v dircolors >/dev/null 2>&1; then
        eval "$(dircolors -b "$temp_dircolors")"
    fi
    
    rm -f "$temp_dircolors"
fi
