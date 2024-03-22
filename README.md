# My Dotfiles
This repo is used to store my dotfiles. This includes but is not limited to my emacs config, neovim config and kitty config. 

Do not clone this repo and expect it to work. I have set it up in sections using the script described below. I do this because when I actually use my dotfiles I basically never want the same system as before, so I will copy the config files I need as I go along ricing my system. 
Feel free to use the script on your own system I have included some comments to make it easier to understand and see where you can make changes, even with very little knowledge of bash.

That being said I hope these dotfiles help a bit. 

---

## Dotfiles Management Script

This Bash script is designed to manage your dotfiles efficiently, ensuring that they are safely backed up and organized within your GitHub repository. Below is an overview of how the script works and the different groups of dotfiles it handles.

### How It Works

1. **Setting Up Variables:**
   - The script first sets up variables for the dotfiles directory (\`$DOTFILES_DIR\`) and the backup directory (\`$BACKUP_DIR\`). These directories will be used to store your dotfiles and any backups created during the script's execution, respectively.

2. **Creating Directories:**
   - If the dotfiles directory does not exist, the script creates it using \`mkdir -p "$DOTFILES_DIR"\`.
   - Similarly, it creates a backup directory using \`mkdir -p "$BACKUP_DIR"\`.

3. **Copying Files:**
   - The \`copy_files\` function is defined to handle the copying of individual files. It takes two parameters: the source file and the destination directory.
   - If a file already exists in the destination directory, it is backed up to the backup directory before being replaced.
   - Files are then copied from their original locations to the dotfiles directory.

4. **Main Function:**
   - The \`main\` function is where the dotfiles to be managed are defined.
   - The Dotfiles are organized into groups, each represented by a directory within the dotfiles directory.
   - For each file defined in the \`files\` array, the script checks if the file exists and is not the dotfiles directory itself.
   - If the file exists, it is copied to the corresponding directory within the dotfiles directory.

5. **Calling the Main Function:**
   - Finally, the script calls the \`main\` function to execute the dotfiles management process.

### Groups of Dotfiles

- **Zsh:**
  - \`.zprofile\`
  - \`.zshrc\`
- **Media:**
  - \`wallOne.jpg\` <- wallpaper
- **Configuration Files:**
  - \`alacritty/\`
  - \`kitty/kitty.conf\`
- **Editor Configuration:**
  - \`emacs/\` <- fully functioning gnu emacs config
  - \`nvim/\` <- fully functioning nvim config, my daily driver
- **Rice (Customization):**
  - \`qtile/arcobattery.py\`
  - \`qtile/config.py\`
  - \`qtile/rofi/custom_launcher.sh\`
  - \`qtile/rofi/sands.jpg\`
  - \`qtile/rofi/sands.rasi\`
  - \`qtile/scripts/\` <- some cool scripts here, the dotfiles script is here and can be called with an alias i have set in my zshrc
  - \`qtile/sxhkd\`
  - \`wal/\`
  - \`zathura/\`

These groups represent different categories of dotfiles managed by the script, ensuring a well-organized and easily maintainable setup.

