################################################################################
#
# pwm_mk
#
################################################################################

PWM_MK_VERSION = 3287c0f84015756affa39421d9b147c962c52d28
PWM_MK_SITE = https://Matthias26@bitbucket.org/keyinfuser/pwm_mk.git
PWM_MK_SITE_METHOD = git
PWM_MK_LICENSE = GPLv2
PWM_MK_LICENSE_FILES = COPYING

$(eval $(kernel-module))

define PWM_MK_CPY
	cp pwm_test.ko $(TARGET_DIR)/root/
endef

$(eval $(generic-package))
