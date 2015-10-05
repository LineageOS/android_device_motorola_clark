ifneq ($(filter clark, $(TARGET_DEVICE)),)
    include $(call all-subdir-makefiles)
endif
