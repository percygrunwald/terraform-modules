#cloud-config
cloud_final_modules:
- [scripts-user, always]

# set the locale
locale: en_US.UTF-8

# timezone: set the timezone for the instance
timezone: "America/Los_Angeles"

# This can be used to put your public key into .ssh/authorized_keys in default account’s home directory ("ubuntu" by default).
#
#ssh_authorized_keys:
# - ssh-rsa XXXXXXXXXXXX== someuser

# Log all cloud-init process output (info & errors) to a logfile
output: {all: ">> /var/log/cloud-init-output.log"}
