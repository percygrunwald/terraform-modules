#!/bin/bash

NVME_VG_NAME="nvme-stripe"
NVME_LV_NAME="striped_lv_nvme"
NVME_MOUNT_POINT="/mnt/nvme_encrypted"

# Make sure nvme-cli package is installed
apt-get update && apt-get install -y nvme-cli udev cryptsetup cryptsetup-bin libcryptsetup*

# Create keyfile
mkdir -p /etc/keyfiles
test -e /etc/keyfiles/nvme.bin && echo "The LUKS keyfile already exists" || /bin/dd if=/dev/urandom of=/etc/keyfiles/nvme.bin bs=32 count=1
chmod 400 /etc/keyfiles/nvme.bin

allDevices=()
for device in /dev/nvme*n1
do
  /usr/sbin/nvme id-ctrl -v $device | egrep -q 'mn.*Amazon EC2 NVMe Instance Storage'
  if [ "$?" -eq 0 ]
  then
    crypto_disk_name="$${device:5}_crypt"
    allDevices+=( "/dev/mapper/$crypto_disk_name" )

    cryptsetup isLuks $device && echo "$device is a LUKS Device" || cryptsetup luksFormat -q --cipher aes-xts-plain64 --key-size 512 --hash sha256 --key-file /etc/keyfiles/nvme.bin $device

    if ! grep -q $crypto_disk_name /etc/crypttab
    then
      echo "$crypto_disk_name $device /etc/keyfiles/nvme.bin luks" >> /etc/crypttab
    fi
    cryptdisks_start $crypto_disk_name
    pvdisplay | grep -q $crypto_disk_name && echo "The physical volume $crypto_disk_name already exists" || pvcreate -v /dev/mapper/$crypto_disk_name
  fi
done

if [ "$${#allDevices[@]}" -gt 0 ]
then
  vgdisplay | grep -q "$NVME_VG_NAME" && echo "The volume group nvme-stripe already exists" || vgcreate $NVME_VG_NAME $${allDevices[@]}
  lvcreate -i$${#allDevices[@]} -I256 -l100%VG -n $NVME_LV_NAME $NVME_VG_NAME
  test -z "$(blkid /dev/$NVME_VG_NAME/$NVME_LV_NAME)" && mkfs -t ext4 -E lazy_itable_init=1 /dev/$NVME_VG_NAME/$NVME_LV_NAME
  if ! grep -q "$NVME_MOUNT_POINT" /etc/fstab
  then
    mkdir -p $NVME_MOUNT_POINT
    echo "# NVME" >> /etc/fstab
    echo "/dev/$NVME_VG_NAME/$NVME_LV_NAME $NVME_MOUNT_POINT ext4 defaults,nofail 0 0" >> /etc/fstab
  fi

  mount -a
fi
