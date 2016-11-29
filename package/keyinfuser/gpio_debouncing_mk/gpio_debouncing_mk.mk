################################################################################
#
# gpio_debouncing_mk
#
################################################################################

GPIO_DEBOUNCING_MK_VERSION = c49c578da3dad6e75937fac0e782c80c36e4154a
GPIO_DEBOUNCING_MK_SITE = https://Matthias26@bitbucket.org/keyinfuser/gpio_debouncing_mk.git
GPIO_DEBOUNCING_MK_SITE_METHOD = git
GPIO_DEBOUNCING_MK_LICENSE = GPLv2
GPIO_DEBOUNCING_MK_LICENSE_FILES = COPYING

$(eval $(kernel-module))

#define PWM_BBB_CPY
#	cp pwm_test.ko $(TARGET_DIR)/root/
#endef

$(eval $(generic-package))
