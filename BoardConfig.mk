# include the BoardConfig.mk of base product
include device/qcom/msmnile_au/BoardConfig.mk

TARGET_ARCH := arm64
TARGET_2ND_ARCH := arm

USE_IMAGING_AIS := false
AIS_ISP_DISABLE_SHDR := true

TARGET_RECOVERY_FSTAB := device/qcom/msmnile_tb/fstab.qcom
