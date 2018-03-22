# nvimrc

My NeoVim configuration.

## Requirements

- Neovim (obviously)
- Python module prerequisites (`apt install python-dev python-pip python3-dev python3-pip`)
- Neovim python modules
  - `pip2 install --upgrade neovim`
  - `pip3 install --upgrade neovim`
- exuberant-ctags
- cmake
- Mono
- Node.js and npm
  - `typescript` package (`npm install -g typescript`)
- Go
- OmniSharp-roslyn mono http (installed in `/opt/omnisharp-roslyn`)
  - Might require a symlink hack: `sudo ln -s /usr/lib/x86_64-linux-gnu/libuv.so.1.0.0 /usr/lib/x86_64-linux-gnu/libuv.so && sudo ldconfig`
