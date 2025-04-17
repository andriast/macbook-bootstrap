# 💻 MacBook Dev Setup Scripts

Modular, plug-and-play scripts to configure a macOS environment for native, React, and serverless dev work.

## Scripts

| Script                  | Description                                                       |
|-------------------------|-------------------------------------------------------------------|
| 01_system_basics.sh     | Xcode CLI tools, Homebrew, Rosetta, folders                       |
| 02_dev_tools.sh         | Android Studio, iOS SDKs, MongoDB, Docker                         |
| 03_terminal_setup.sh    | iTerm2, Oh My Zsh, Powerlevel10k, aliases                         |
| 04_env_managers.sh      | Installs NVM, Pyenv, ASDF                                         |
| 05_gpg_ssh_setup.sh     | SSH key + GPG signing setup                                       |
| 06_react_and_lambda.sh  | React dev tools, AWS CLI, SAM CLI, Serverless                    |
| upload_ssh_keys.sh      | Upload SSH key to GitHub or Bitbucket                             |
| run_all.sh              | Run everything in sequence                                        |

## Usage

```bash
chmod +x *.sh
./run_all.sh
```

You’ll find VS Code and Xcode settings under `/dotfiles`.

Customize and PR welcome 🤘
