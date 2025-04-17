#!/bin/bash
echo "⚠️ Running full system cleanup..."

bash 01_cleanup_system_basics.sh
bash 02_cleanup_dev_tools.sh
bash 03_cleanup_terminal_setup.sh
bash 04_cleanup_env_managers.sh
bash 05_cleanup_gpg_ssh.sh
bash 06_cleanup_react_lambda.sh

echo "✅ System cleanup complete."
