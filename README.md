# dotfiles

Use GNU stow to install these. If the file you are restoring exists, this will fail, so remove that file. Use stow <package-name> to restore the file.
  
Credit to Brandon Invergo: http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

Custom steps after installing:
1) install fisher for fish extensions
2) fisher install PatrickF1/fzf.fish
4) install fd (needed for FZF ctrl-T)
5) bind -M insert \ct _fzf_search_directory
6) download java lsp and configure java-lsp.sh found in neovim config
7) for lombok support, add
 -javaagent:/home/jemag/.config/nvim/dependencies/lombok.jar \
  -Xbootclasspath/a:/home/jemag/.config/nvim/dependencies/lombok.jar \
to the sh file for java LSP
