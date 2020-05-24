#!/sbin/sh

for file in /firmware/image/*.gz; do
  OUT_FILE=$(basename $file .gz)
  gzip -dc $file > /mnt/system/system/vendor/firmware/$OUT_FILE
  chmod 644 /mnt/system/system/vendor/firmware/$OUT_FILE
done
