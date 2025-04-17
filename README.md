# 💻 MacBook Dev Setup Scripts

This repository provides a modular, plug-and-play setup for configuring a **brand new MacBook Pro** into a full-stack mobile development powerhouse.

Perfect for:
- Native mobile developers (iOS + Android)
- React Native
- Full-stack JS/Python
- VP R&Ds who want reliable, consistent environments 😎

---

## 📦 What's Included

| Script | Description |
|--------|-------------|
| `01_system_basics.sh` | Xcode CLI tools, Rosetta, Homebrew, basic folder structure |
| `02_dev_tools.sh`     | Android SDK, Xcode tools, React Native, MongoDB, Docker |
| `03_terminal_setup.sh`| iTerm2, Oh My Zsh, Powerlevel10k, custom aliases |
| `04_env_managers.sh`  | `nvm`, `pyenv`, `asdf` – manage all your runtimes |
| `05_gpg_ssh_setup.sh` | Generate GPG and SSH keys for GitHub/Bitbucket |
| `upload_ssh_keys.sh`  | Securely uploads SSH keys via GitHub + Bitbucket API |
| `run_all.sh`          | Run all setup scripts sequentially in one go |

---

## 🚀 How to Use

```bash
git clone https://github.com/YOUR_USERNAME/macbook-setup.git ~/macbook-setup
cd ~/macbook-setup

chmod +x *.sh

# Run everything, or individual parts as needed
./run_all.sh
```

---

## 🛠 Requirements

- macOS Sonoma or newer
- Internet connection
- iTerm2 (installed via script)
- GitHub/Bitbucket tokens for SSH key upload (optional)

---

## 📌 Customization

You can safely modify:
- `~/.aliases` – shell shortcuts
- `~/.p10k.zsh` – Powerlevel10k theme
- Add VS Code extensions, language plugins, etc.

---

## 🧠 Pro Tip

Run each script one by one if you prefer control:
```bash
./01_system_basics.sh
./02_dev_tools.sh
# ...
```

---

## 🔐 Secure SSH Upload (Optional)

Run after key generation:

```bash
./upload_ssh_keys.sh
```

This will prompt you for your GitHub and Bitbucket credentials securely.

---

## 🗂 Dotfiles Included

You’ll find a `dotfiles/` folder with:

- `.gitconfig` – Git defaults with signing support
- `.editorconfig` – formatting consistency
- `vscode/settings.json` – recommended VS Code setup
- `xcode/README.md` – placeholder for team Xcode configuration

To sync VS Code settings:

```bash
cp dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
```

---

## 🤘 Contribute

Found a bug or want to add your tools? PRs are welcome!


| `06_react_and_lambda.sh` | Sets up React.js tooling and AWS Lambda local dev environment |
