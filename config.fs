[AID_VENDOR_MOT_ATVC]
value:9012

[AID_VENDOR_MOT_TPAPI]
value:9007

[AID_VENDOR_MOT_PWRIC]
value:9001

[AID_VENDOR_MOT_TCMD]
value:9004

[AID_VENDOR_QCOM_DIAG]
value:2950

[AID_VENDOR_RFS]
value:2951

[AID_VENDOR_RFS_SHARED]
value:2952

[system/bin/wcnss_filter]
mode: 0755
user: AID_BLUETOOTH
group: AID_BLUETOOTH
caps: BLOCK_SUSPEND

[system/bin/pm-service]
mode: 0755
user: AID_SYSTEM
group: AID_SYSTEM
caps: NET_BIND_SERVICE

[firmware/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[bt_firmware/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[persist/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0

[storage/]
mode: 0555
user: AID_SYSTEM
group: AID_SDCARD_R
caps: 0

[fsg/]
mode: 0755
user: AID_ROOT
group: AID_ROOT
caps: 0
