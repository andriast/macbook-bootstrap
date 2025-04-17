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


---

## 🧹 Cleanup Scripts

If you want to reset your environment before re-running any step, use the provided cleanup scripts:

| Cleanup Script                  | Purpose                                                    |
|--------------------------------|------------------------------------------------------------|
| `01_cleanup_system_basics.sh`  | Remove folders and Xcode CLI tools setup                  |
| `02_cleanup_dev_tools.sh`      | Uninstall Android, iOS, MongoDB, Docker dev tools         |
| `03_cleanup_terminal_setup.sh` | Remove shell customizations and fonts                     |
| `04_cleanup_env_managers.sh`   | Remove nvm, pyenv, asdf and config                        |
| `05_cleanup_gpg_ssh.sh`        | Delete GPG keys and SSH key files                         |
| `06_cleanup_react_lambda.sh`   | Remove React, AWS CLI, Serverless tools                   |
| `cleanup_all.sh`               | Run all the above scripts in one go                       |

```bash
chmod +x cleanup_all.sh
./cleanup_all.sh
```

This is helpful for debugging or rerunning the setup from a clean state.
