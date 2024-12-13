# dotfiles
All configuration dotfiles for phideltaee. Custom setup for 
  "bash"
  "git"
  "zsh"
  "vim"


# Usage:

  1. Clone this repository using the following to recursively clone all submodules 
    
    `git clone --recurse-submodules -j8 git://github.com/phideltaee/dotfiles.git` 

  2. Add run permissions to the install file: 
  
    `chmod +x ~/git/dotfiles/install.sh` 
  
  3. Install coreutils (using homebrew)
  
    `brew install coreutils`

  4. Add the dircolors to the file
  
    `echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc`


  4. Run the install file (Warning, this will replace all your current configurations! Back up as necessary) `$>> ./install.sh`
