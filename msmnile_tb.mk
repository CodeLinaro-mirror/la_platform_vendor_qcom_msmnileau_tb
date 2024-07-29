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

TARGET_BOARD_DERIVATIVE_SUFFIX := _tb

#PRODUCT_PACKAGES += android.hardware.lights-service.qti
TARGET_USES_GAS := false
