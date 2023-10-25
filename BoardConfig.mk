# Include the BoardConfig.mk of base product
include device/qcom/msmnile_au/BoardConfig.mk

TARGET_ARCH := arm64
TARGET_2ND_ARCH := arm

#Recovery fstab for km4
TARGET_RECOVERY_FSTAB := device/qcom/msmnile_tb/fstab.qcom

#Overwrite required variables below this
# Base product BoardConfigVendor.mk will already be included. So, use below to set new variables or to override old ones
-include $(QCPATH)/common/msmnile_tb/BoardConfigVendor.mk

TARGET_USERIMAGES_USE_F2FS := false
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
