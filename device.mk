# A/B
ENABLE_AB ?= true
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# API
BOARD_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Architecture
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := dubai

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# AVB
BOARD_AVB_ENABLE := true

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.dubai

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.biometrics.face.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default \
    com.dsi.ant@1.0.vendor \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_audio_session \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm@1.4-service.clearkey

# Emulated Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

# Fingerprint
TARGET_USES_FOD_ZPOS := true

# FM
BOARD_HAVE_QCOM_FM := false

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0 \
    android.hardware.gatekeeper@1.0.vendor

# Generic Kernel Headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Charger
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init/charger_fw_fstab.qti:$(TARGET_COPY_OUT_VENDOR)/etc/charger_fw_fstab.qti

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor

# Init
PRODUCT_PACKAGES += \
    charger_fw_fstab.qti \
    fstab.default \
    init.dubai.perf.rc \
    init.mmi.boot.sh \
    init.mmi.charge_only.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.touch.sh \
    init.oem.hw.sh \
    init.qcom.sensors.sh \
    init.qti.chg_policy.sh \
    init.qti.qcv.rc \
    init.qti.qcv.sh \
    init.target.rc \
    init.vendor.st21nfc.rc \
    ueventd.dubai.rc

# Keymaster
PRODUCT_PACKAGES += \
   android.hardware.keymaster@4.1 \
   android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti \
    lights.qcom

# Manifests
DEVICE_MANIFEST_FILE := device/motorola/dubai/manifest_yupik.xml
DEVICE_MATRIX_FILE := device/qcom/common/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    device/motorola/dubai/dubai_vendor_framework_compatibility_matrix.xml

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Overlays
PRODUCT_PACKAGES += \
    MotFrameworks \
    MotSettings \
    MotSystemUI \
    MotWifiResTarget

# Partitions - Dynamic
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_COPY_FILES += $(LOCAL_PATH)/init/fstab.default:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.default

$(call inherit-product, build/make/target/product/gsi_keys.mk)

# Partitions - FRP
BOARD_FRP_PARTITION_NAME := frp

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# QSSI
TARGET_USES_QSSI := true

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := all

# RRO
TARGET_USES_RRO := true

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    android.hardware.sensors@2.0-ScopedWakelock \
    libsensorndkbridge \
    sensors.dubai

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/qca6750/WCNSS_mot_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_mot_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/qca6750/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/qca6750/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wlan/WCNSS_qcom_cfg.ini

# Proprietary Vendor
$(call inherit-product, vendor/motorola/dubai/dubai-vendor.mk)
