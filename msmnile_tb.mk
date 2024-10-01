# Inherit from the base product
$(call inherit-product, device/qcom/msmnile_au/msmnile_au.mk)
TARGET_BASE_PRODUCT := msmnile_au

PRODUCT_NAME := msmnile_tb
PRODUCT_DEVICE := msmnile_tb
PRODUCT_BRAND := qti
PRODUCT_MODEL := msmnile_tb for arm64
ENABLE_AB ?= true
TARGET_USES_CAR_FEATURES := true

TARGET_OUT_INTERMEDIATES := out/target/product/$(PRODUCT_NAME)/obj
$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr:
	mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

# Change Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_DEVICE)/$(KERNEL_MODULES_INSTALL)/lib/modules

TARGET_BOARD_DERIVATIVE_SUFFIX := _tb

#PRODUCT_PACKAGES += android.hardware.lights-service.qti
ifeq ($(TARGET_USES_CAR_FEATURES), true)
TARGET_USES_GAS := true
else
TARGET_USES_GAS := false
endif

# use local fstab for tablet build. This uses ext4 for userdata
ifeq ($(ENABLE_AB), true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab_AB_dynamic_partition_variant.qti:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
else
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab_non_AB_dynamic_partition_variant.qti:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
endif
