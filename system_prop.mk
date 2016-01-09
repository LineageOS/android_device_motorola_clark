#
# System Properties for Moto X Pure
#

# Rich Communications Service is disabled in 5.1
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rcs.supported=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.camera.facialproc=false \
    persist.camera.HAL3.enabled=0 \
    persist.camera.tnr.video=on \
    persist.camera.tnr.preview=on

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.hfp.client=1 \
    qcom.bt.le_dev_pwr_class=1 \
    ro.bluetooth.hfp.ver=1.6 \
    qcom.bluetooth.soc=rome

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.mot.gps.assisted=false \
    persist.mot.gps.conf.from.sim=true \
    persist.mot.gps.smart_battery=1 \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1 \
    ro.pip.gated=0

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=RUIM \
    ro.use_data_netmgrd=true \
    ro.data.large_tcp_window_size=true \
    ro.mot.ignore_csim_appid=true \
    persist.data.netmgrd.qos.enable=true \
    persist.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
    persist.data.iwlan.enable=false \
    persist.radio.mcfg_enabled=1 \
    persist.radio.mcfg_noreset=1 \
    persist.radio.mcfg_remote=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.dfr_mode_set=1 \
    persist.radio.relay_oprt_change=1 \
    persist.radio.msgtunnel.start=true \
    persist.radio.oem_ind_to_both=0 \
    persist.radio.0x9e_not_callname=1 \
    persist.radio.mt_sms_ack=30 \
    persist.radio.force_get_pref=1 \
    persist.radio.mot_ecc_enabled=1 \
    persist.radio.mot_ecc_custid=common \
    persist.radio.calls.on.ims=true \
    persist.radio.jbims=1 \
    persist.radio.domain.ps=0 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.REVERSE_QMI=0 \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.VT_USE_MDM_TIME=0 \
    persist.radio.videopause.mode=0 \
    persist.radio.apn_delay=5000 \
    persist.radio.snapshot_timer=22 \
    persist.radio.snapshot_enabled=1 \
    persist.ims.volte=true \
    persist.ims.vt=false \
    persist.ims.vt.epdg=false \
    persist.ims.rcs=false \
    persist.rcs.supported=0 \
    persist.rcs.presence.provision=0 \
    persist.sys.qc.sub.rdump.on=1 \
    persist.rmnet.mux=enabled \
    persist.sys.cnd.iwlan=0 \
    persist.cne.logging.qxdm=0 \
    persist.vt.supported=0 \
    persist.eab.supported=0 \
    persist.qcril_uim_vcc_feature=1 \
    persist.data.qmi.adb_logmask=0 \
    telephony.lteOnCdmaDevice=1 \
    net.tethering.noprovisioning=true \

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    ro.opengles.version=196609 \
    ro.sf.lcd_density=560

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.mdpcomp.logs=0 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    persist.hwc.enable_vds=1 \
    persist.mdpcomp.4k2kSplit=1 \
    persist.mdpcomp_perfhint=50 \
    persist.metadata_dynfps.disable=true \
    persist.demo.hdmirotationlock=false \
    dev.pm.dyn_samplingrate=1 \
    ro.hwui.texture_cache_flushrate=0.4

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e82 \
    ro.usb.mtp_adb=0x2e76 \
    ro.usb.ptp=0x2e83 \
    ro.usb.ptp_adb=0x2e84 \
    ro.usb.bpt=0x2ee5 \
    ro.usb.bpt_adb=0x2ee6 \
    ro.usb.bpteth=0x2ee7 \
    ro.usb.bpteth_adb=0x2ee8

# Vendor specific
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.gt_library=libqti-gt.so \
    sys.games.gt.prof=0

#system props for time-services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Audio and Media
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.enable=true \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none \
    ro.fm.transmitter=false \
    ro.media.enc.aud.fileformat=qcp \
    ro.media.enc.aud.codec=qcelp \
    ro.media.enc.aud.bps=13300 \
    ro.media.enc.aud.ch=1 \
    ro.media.enc.aud.hz=8000 \
    ro.audio.monitorRotation=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    media.aac_51_output_enabled=true \
    persist.cne.feature=0 \
    persist.dpm.feature=3 \
    persist.audio.calfile0=/etc/acdbdata/Bluetooth_cal.acdb \
    persist.audio.calfile1=/etc/acdbdata/General_cal.acdb \
    persist.audio.calfile2=/etc/acdbdata/Global_cal.acdb \
    persist.audio.calfile3=/etc/acdbdata/Handset_cal.acdb \
    persist.audio.calfile4=/etc/acdbdata/Hdmi_cal.acdb \
    persist.audio.calfile5=/etc/acdbdata/Headset_cal.acdb \
    persist.audio.calfile6=/etc/acdbdata/Speaker_cal.acdb \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=false \
    audio.offload.disable=0 \
    audio.offload.buffer.size.kb=32 \
    audio.offload.multiple.enabled=true \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.pcm.24bit.enable=false \
    audio.offload.gapless.enabled=false \
    av.offload.enable=false \
    mm.enable.qcom_parser=4643 \
    mmp.enable.3g2=true \
    vidc.enc.dcvs.extra-buff-count=2 \
    tunnel.audio.encode=false \
    use.voice.path.for.pcm.voip=true \

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.sensors.gestures=true \
    ro.qc.sdk.gestures.camera=false \
    ro.qualcomm.cabl=0 \
    persist.sys.wfd.virtual=0 \
    persist.debug.coresight.config=stm-events \
    ro.bug2go.magickeys=24,26 \
    drm.service.enabled=true \
    mdc_initial_max_retry=10

# For Playstore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-motorola \
    ro.com.google.clientidbase.ms=android-motorola \
    ro.com.google.clientidbase.am=android-motorola \
    ro.com.google.clientidbase.gmm=android-motorola \
    ro.com.google.clientidbase.yt=android-motorola

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

