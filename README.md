
# SimpleOS
A minimalist desktop environment for Arch Linux designed to streamline your computing experience.

## Important Notes Before Installation

### ArchISO Compatibility
SimpleOS is not officially compatible with ArchISO. It is **strongly recommended** that you follow the standard Arch installation process as detailed on the [Arch Wiki](https://wiki.archlinux.org/index.php/installation_guide).

### Internet Requirement
SimpleOS does not come pre-packaged with essential software packages. The installer relies on an active internet connection as it fetches packages during the installation process. Ensure you are connected to the internet before proceeding with the installation.

### Virtual Machine Considerations
The SimpleOS installer compiles many packages from source, which can be computationally demanding. If installing within a virtual machine, it is advised to allocate as many CPU cores as possible to ensure a more efficient and quicker installation process.

## Installation Process

### Prerequisites
Before installing SimpleOS, the prerequisite packages required are `sudo` and `yay` (Yet Another Yaourt), an AUR helper. Install `sudo` using the following command as the root user:
\`\`\`bash
pacman -S sudo
\`\`\`
To install `yay`, follow the instructions provided on the [Yay GitHub page](https://github.com/Jguer/yay).

### User Setup
Create a dedicated user for the installation process:
\`\`\`bash
useradd -ms /bin/bash installer
\`\`\`

Provide the installer user with sudo permissions. Depending on your system’s sudo configuration, you may use one of the following commands:
\`\`\`bash
usermod -aG wheel installer  # If your sudoers file uses the 'wheel' group
usermod -aG sudo installer   # If your sudoers file uses the 'sudo' group
\`\`\`

Set a password for the installer user:
\`\`\`bash
passwd installer
\`\`\`

Switch to the installer user account:
\`\`\`bash
su installer
\`\`\`

### Fetching the Repository
Clone the SimpleOS repository:
\`\`\`bash
git clone https://github.com/EilonIssac/SimpleOS.git
\`\`\`

Navigate to the desired software release branch:
\`\`\`bash
cd SimpleOS
git checkout release
git reset  # Optionally reset the repository if required
\`\`\`

### Running the Installer
From within the SimpleOS directory, initiate the installation process:
\`\`\`bash
./install.sh
\`\`\`

### Post-Installation Cleanup
Once the installation is complete, switch back to the root user, remove the 'installer' user and add a new user for regular operations:
\`\`\`bash
su root
userdel installer
useradd -ms /bin/bash yourUser
passwd yourUser  # Don't forget to set a password for the new user
\`\`\`

## Getting Started
After installing SimpleOS, you can begin configuring and customizing your environment to better suit your needs. Consult the SimpleOS documentation for guidance on post-installation steps and tips for maximizing your productivity.
