# Neovim Configuration

My personal configuration. Originally tracked in my [main dotfiles](https://github.com/simonward87/dotfiles), but as I also maintain a separate dotfiles for Raspberry Pi servers, I wanted a single neovim configuration that both repositories could reference as a [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## LSP

When running on the Raspberry Pi, LSP is automatically disabled, and none of the dependencies are installed (this is handled using an `if` check to fetch the core Unix operating system). The Raspberry Pi actually does a fairly good job with LSP on small projects, but I prefer to keep things light-weight when possible in a constrained environment.
