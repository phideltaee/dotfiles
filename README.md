# dotfiles

Cross-platform shell configuration for macOS and Linux.

## Quick Setup

1. **Clone and install:**
   ```bash
   git clone --recurse-submodules -j8 git://github.com/phideltaee/dotfiles.git
   cd dotfiles
   chmod +x install.sh
   ./install.sh
   ```

2. **Install dependencies:**
   
   **macOS:**
   ```bash
   brew install coreutils
   ```
   
   **Linux:**
   ```bash
   sudo apt-get install coreutils  # Ubuntu/Debian
   # or
   sudo yum install coreutils      # CentOS/RHEL
   ```

3. **Restart terminal or run:**
   ```bash
   source ~/.zshrc
   ```

## What's Included

- **Shells:** Zsh and Bash configurations
- **Editor:** Vim with plugins and Solarized theme
- **Features:** Cross-platform support, syntax highlighting, vim-style navigation
- **Auto-detection:** Conda paths, coreutils paths, platform-specific settings

## Customization

Add your personal settings to these files (not tracked in git):
- `~/.shell_local_before` / `~/.shell_local_after`
- `~/.zshrc_local_before` / `~/.zshrc_local_after`
- `~/.bashrc_local_before` / `~/.bashrc_local_after`
- `~/.shell_private`

## Update

```bash
dfu  # Pulls updates and reinstalls
```
