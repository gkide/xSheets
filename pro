---
tags: [ ubuntu, security ]
---
# https://ubuntu.com/pro

# Attach your Ubuntu LTS machine to an Ubuntu Pro subscription using the token
sudo pro attach YourUbuntuProToken

# To use a different subscription
sudo pro detach

sudo pro enable  ServiceName # Enable services
sudo pro disable ServiceName # Disable services

# Report current status of Ubuntu Pro services on system
pro status
# Show security updates for packages in the system, including all available ESM related content.
pro security-status

############
# Also See #
############
cheat -t ubuntu
cheat -t security
