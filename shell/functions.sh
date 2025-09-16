path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

there() {
    cd "$(readlink "${there}")"
}

# Platform detection functions
is_macos() {
    [[ "$OSTYPE" == "darwin"* ]]
}

is_linux() {
    [[ "$OSTYPE" == "linux-gnu"* ]]
}

is_apple_silicon() {
    is_macos && [[ $(uname -m) == "arm64" ]]
}

is_intel_mac() {
    is_macos && [[ $(uname -m) == "x86_64" ]]
}

# Get the appropriate coreutils path for the platform
get_coreutils_path() {
    if is_apple_silicon; then
        echo "/opt/homebrew/opt/coreutils/libexec/gnubin"
    elif is_intel_mac; then
        echo "/usr/local/opt/coreutils/libexec/gnubin"
    else
        echo ""  # Linux uses system coreutils
    fi
}

# Get the appropriate conda path for the platform
get_conda_path() {
    if is_macos; then
        # Common macOS conda paths
        if [[ -d "$HOME/anaconda3" ]]; then
            echo "$HOME/anaconda3"
        elif [[ -d "$HOME/miniconda3" ]]; then
            echo "$HOME/miniconda3"
        elif [[ -d "/opt/anaconda3" ]]; then
            echo "/opt/anaconda3"
        elif [[ -d "/opt/miniconda3" ]]; then
            echo "/opt/miniconda3"
        fi
    else
        # Linux conda paths
        if [[ -d "$HOME/anaconda3" ]]; then
            echo "$HOME/anaconda3"
        elif [[ -d "$HOME/miniconda3" ]]; then
            echo "$HOME/miniconda3"
        fi
    fi
}
