#!/sbin/sh

toybox mount /dev/block/bootdevice/by-name/system -t ext4 /mnt/system
toybox mount /dev/block/bootdevice/by-name/modem -t ext4 /firmware

for file in /firmware/image/*.gz; do
  OUT_FILE=$(basename $file .gz)
  gzip -dc $file > /mnt/system/system/vendor/firmware/$OUT_FILE
  chmod 644 /mnt/system/system/vendor/firmware/$OUT_FILE
done

toybox umount /mnt/system
toybox umount /firmware
