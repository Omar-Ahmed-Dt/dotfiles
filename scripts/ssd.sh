!#/bin/bash
# Unlock with your passphrase: root9289
sudo cryptsetup open /dev/sdb myssd
# Mount it
sudo mount /dev/mapper/myssd /mnt/myssd
