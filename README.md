# dotfiles

> New and improved

1. Install dependencies and configs
  ```sh
  # Clone repository to home directory
  git clone git@github.com:disusered/dotfiles-micro.git ~/.dotfiles

  # Run bootstrap script
  ~/.dotfiles/scripts/bootstrap.sh
  ```

2. Add public SSH key to GitHub[^1]
  ```sh
  cat ~/.ssh/id_ed25519.pub
  ```

3. Configure Keybase and save the key in GitHub[^2]
  ```sh
  # List keys
  gpg --list-secret-keys --keyid-format LONG
  
  # Export key
  gpg --armor --export <My_PGP_Key>
  ```

4. Add GPG key to `~/.gitconfig`[^3]
  ```sh
  # List keys
  gpg --list-secret-keys --keyid-format LONG
  
  # First entry after sec, can be confirmed in the Keybase app
  ```

## TODO

- Download Git Delta themes and configure in `.gitconfig`
- Neovim LSP
- Darwin python in `neovim.sh`
- Neovim dependencies in `neovim.sh`
- Use patched font in Linux terminal
- Configure LSPs
- Rofi/Greenclip
- kitty paste in `linux.conf`
- https://github.com/ryanoasis/nerd-fonts#option-3-install-script
- i3/sway
- dunst/mako
- darwin everything
- vimtext neovim checkhealth
- perl/ruby neovim checkhealth

## Sources

[^1]: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[^2]: https://www.garrickadenbuie.com/blog/signed-verified-git-commits-keybase-rstudio/
[^3]: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
