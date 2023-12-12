# Inherit from the base product
$(call inherit-product, device/qcom/msmnile_au/msmnile_au.mk)
TARGET_BASE_PRODUCT := msmnile_au

PRODUCT_NAME := msmnile_tb
PRODUCT_DEVICE := msmnile_tb
PRODUCT_BRAND := qti
PRODUCT_MODEL := msmnile_tb for arm64

TARGET_OUT_INTERMEDIATES := out/target/product/$(PRODUCT_NAME)/obj
$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr:
	mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

# Change Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_DEVICE)/$(KERNEL_MODULES_INSTALL)/lib/modules
# TARGET_KERNEL_VERSION := 5.15
# TARGET_HAS_GENERIC_KERNEL_HEADERS := true
# Set the system.prop files to that of the inherited product plus the new product. Alternatively, the system.prop file can be copied over
# TARGET_SYSTEM_PROP := device/qcom/msmnile_au/system.prop device/qcom/msmnile_tb/system.prop

TARGET_BOARD_DERIVATIVE_SUFFIX := _tb

#TARGET_USES_KM40 := true
ENABLE_AB ?= true
ifeq ($(ENABLE_AB), true)
PRODUCT_COPY_FILES += device/qcom/msmnile_tb/fstab_AB_dynamic_partition_variant.qti:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
else
PRODUCT_COPY_FILES += device/qcom/msmnile_tb/fstab_non_AB_dynamic_partition_variant.qti:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
endif

PRODUCT_PACKAGES += android.hardware.lights-service.qti
TARGET_USES_GAS := false
