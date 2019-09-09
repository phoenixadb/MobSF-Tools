# MobSF-Tools
Tools around [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) security mobile testing solution

## MobSF on Mac deployment made easy
The MobSF role for Mac simplifies the installation of [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF).
It also transforms it into a service launched started automatically at user session's start. [Apple's developer documentation](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)

### Prerequisites
First install [Ansible]([MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF)) with [Homebrew](https://brew.sh/index_fr). In a terminal type :
`brew install ansible`

### How to install
- Clone the projet [MobSF-Tools](https://github.com/phoenixadb/MobSF-Tools)
- Open a terminal and go inside the **MobSF-Tools/ansible** directory.
- Then type :
`ansible-playbook -K mac-mobsf.yml`
