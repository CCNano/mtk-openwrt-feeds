KERNEL_LOADADDR := 0x48080000

define Device/mediatek_mt7988a-gsw-10g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-gsw-10g-spim-nand
  DEVICE_DTS := mt7988a-gsw-10g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-gsw-10g-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-gsw-10g-spim-nand

define Device/mediatek_mt7988a-gsw-10g-spim-nand-sb
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-gsw-10g-spim-nand-sb
  DEVICE_DTS := mt7988a-gsw-10g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-gsw-10g-spim-snand
  DEVICE_PACKAGES := uboot-envtools dmsetup
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar rootfs=$$$$(IMAGE_ROOTFS)-hashed-$$(firstword $$(DEVICE_DTS)) | \
	append-metadata
  FIT_KEY_DIR := $(TOPDIR)/../../keys
  FIT_KEY_NAME := fit_key
  ANTI_ROLLBACK_TABLE := $(TOPDIR)/../../fw_ar_table.xml
  AUTO_AR_CONF := $(TOPDIR)/../../auto_ar_conf.mk
  HASHED_BOOT_DEVICE := 253:0
  BASIC_KERNEL_CMDLINE := console=ttyS0,115200n1 rootfstype=squashfs loglevel=8
  KERNEL = kernel-bin | lzma | squashfs-hashed | fw-ar-ver | \
	fit-sign lzma $$(KDIR)/image-sb-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS =
endef
TARGET_DEVICES += mediatek_mt7988a-gsw-10g-spim-nand-sb
DEFAULT_DEVICE_VARS += FIT_KEY_DIR FIT_KEY_NAME ANTI_ROLLBACK_TABLE \
	AUTO_AR_CONF HASHED_BOOT_DEVICE BASIC_KERNEL_CMDLINE

define Device/mediatek_mt7988a-dsa-10g-emmc-sb
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-emmc-sb
  DEVICE_DTS := mt7988a-dsa-10g-emmc
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-emmc
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1 uboot-envtools dmsetup
  IMAGE/sysupgrade.bin := sysupgrade-tar rootfs=$$$$(IMAGE_ROOTFS)-hashed-$$(firstword $$(DEVICE_DTS)) | \
	append-metadata
  FIT_KEY_DIR := $(TOPDIR)/../../keys
  FIT_KEY_NAME := fit_key
  ANTI_ROLLBACK_TABLE := $(TOPDIR)/../../fw_ar_table.xml
  AUTO_AR_CONF := $(TOPDIR)/../../auto_ar_conf.mk
  BASIC_KERNEL_CMDLINE := console=ttyS0,115200n1 rootfstype=squashfs,f2fs loglevel=8
  KERNEL = kernel-bin | lzma | squashfs-hashed | fw-ar-ver | \
	fit-sign lzma $$(KDIR)/image-sb-$$(firstword $$(DEVICE_DTS)).dtb
  KERNEL_INITRAMFS =
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-emmc-sb
DEFAULT_DEVICE_VARS += FIT_KEY_DIR FIT_KEY_NAME ANTI_ROLLBACK_TABLE \
	AUTO_AR_CONF BASIC_KERNEL_CMDLINE

define Device/mediatek_mt7988a-gsw-10g-spim-nand-4pcie
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-gsw-10g-spim-nand-4pcie
  DEVICE_DTS := mt7988a-gsw-10g-spim-nand-4pcie
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-gsw-10g-spim-snand-4pcie
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-gsw-10g-spim-nand-4pcie

define Device/mediatek_mt7988a-gsw-10g-sfp-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-gsw-10g-sfp-spim-nand
  DEVICE_DTS := mt7988a-gsw-10g-sfp-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-gsw-10g-sfp-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-gsw-10g-sfp-spim-nand

define Device/mediatek_mt7988a-dsa-10g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-spim-nand
  DEVICE_DTS := mt7988a-dsa-10g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-spim-nand

define Device/mediatek_mt7988a-dsa-e2p5g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-e2p5g-spim-nand
  DEVICE_DTS := mt7988a-dsa-e2p5g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-e2p5g-spim-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-e2p5g-spim-nand

define Device/mediatek_mt7988a-dsa-i2p5g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-i2p5g-spim-nand
  DEVICE_DTS := mt7988a-dsa-i2p5g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-i2p5g-spim-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-i2p5g-spim-nand

define Device/mediatek_mt7988a-dsa-10g-snfi-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-snfi-nand
  DEVICE_DTS := mt7988a-dsa-10g-snfi-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-snfi-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-snfi-nand

define Device/mediatek_mt7988a-dsa-10g-spim-nor
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-spim-nor
  DEVICE_DTS := mt7988a-dsa-10g-spim-nor
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-spim-nor
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-spim-nor

define Device/mediatek_mt7988a-dsa-10g-emmc
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-emmc
  DEVICE_DTS := mt7988a-dsa-10g-emmc
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-emmc
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-emmc

define Device/mediatek_mt7988a-dsa-10g-sd
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988a-dsa-10g-sd
  DEVICE_DTS := mt7988a-dsa-10g-sd
  SUPPORTED_DEVICES := mediatek,mt7988a-dsa-10g-sd
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988a-dsa-10g-sd

define Device/mediatek_mt7988c-gsw-10g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-gsw-10g-spim-nand
  DEVICE_DTS := mt7988c-gsw-10g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-gsw-10g-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-gsw-10g-spim-nand

define Device/mediatek_mt7988c-gsw-10g-sfp-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-gsw-10g-sfp-spim-nand
  DEVICE_DTS := mt7988c-gsw-10g-sfp-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-gsw-10g-sfp-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-gsw-10g-sfp-spim-nand

define Device/mediatek_mt7988c-dsa-10g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-10g-spim-nand
  DEVICE_DTS := mt7988c-dsa-10g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-10g-spim-snand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-10g-spim-nand

define Device/mediatek_mt7988c-dsa-e2p5g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-e2p5g-spim-nand
  DEVICE_DTS := mt7988c-dsa-e2p5g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-e2p5g-spim-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-e2p5g-spim-nand

define Device/mediatek_mt7988c-dsa-i2p5g-spim-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-i2p5g-spim-nand
  DEVICE_DTS := mt7988c-dsa-i2p5g-spim-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-i2p5g-spim-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-i2p5g-spim-nand

define Device/mediatek_mt7988c-dsa-10g-snfi-nand
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-10g-snfi-nand
  DEVICE_DTS := mt7988c-dsa-10g-snfi-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-10g-snfi-nand
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-10g-snfi-nand

define Device/mediatek_mt7988c-dsa-10g-spim-nor
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-10g-spim-nor
  DEVICE_DTS := mt7988c-dsa-10g-spim-nor
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-10g-spim-nor
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-10g-spim-nor

define Device/mediatek_mt7988c-dsa-10g-emmc
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-10g-emmc
  DEVICE_DTS := mt7988c-dsa-10g-emmc
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-10g-emmc
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-10g-emmc

define Device/mediatek_mt7988c-dsa-10g-sd
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7988c-dsa-10g-sd
  DEVICE_DTS := mt7988c-dsa-10g-sd
  SUPPORTED_DEVICES := mediatek,mt7988c-dsa-10g-sd
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mediatek_mt7988c-dsa-10g-sd
