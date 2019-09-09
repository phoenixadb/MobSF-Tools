# MobSF-Tools
Tools around [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) security mobile testing solution

## MobSF on Mac deployment made easy
The [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) [Ansible](https://www.ansible.com/) role for Mac simplifies the installation of [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF).
It also transforms it into a service started automatically at user session's start. [Apple's developer documentation](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)

### Prerequisites
First install [Ansible](https://www.ansible.com/) with [Homebrew](https://brew.sh/index_fr). In a terminal type :
`brew install ansible`

### How to install
- Clone the projet [MobSF-Tools](https://github.com/phoenixadb/MobSF-Tools)
- Open a terminal and go inside the **MobSF-Tools/ansible** directory.
- Then type:
`ansible-playbook -K mac-mobsf.yml`

## Continuous Integration script
[MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) provides API for CI.
**upload_mobsf.sh** is a simple script using this API to help you to integrate [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF).
Exemple:
`upload_mobsf.sh 'https://mymobsf:8000' '7374e14eb76d40672961d93ed3769a2e71b6f852f8d6f483159bce6c9f83f6e7' ./myapp.apk true './'`
For security reason, you can ask to [MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) to remove the scan once you have downloaded the report.