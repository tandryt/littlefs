# LittleFS makefile fragment for integration with bambam build system

# Add LittleFS source files
LITTLEFS_SRC_DIR := $(ROOTDIR)/external/littlefs
LITTLEFS_SRC_FILES := lfs.c lfs_util.c

# Add source files with full paths
C_SOURCE_FILES += $(addprefix $(LITTLEFS_SRC_DIR)/,$(LITTLEFS_SRC_FILES))

# Add include directories
INC_PATHS += -I$(LITTLEFS_SRC_DIR)

# Define LittleFS compile-time configuration
CFLAGS += -DLFS_CONFIG=lfs_config.h

# Add project source directory to include path for lfs_config.h
INC_PATHS += -I$(PROJECT_SOURCE_FOLDER)

# Add compiler flags to suppress LittleFS warnings
CFLAGS += -Wno-return-type -Wno-missing-field-initializers

# Optional: Add LittleFS block device files if needed
# LITTLEFS_BD_FILES := bd/lfs_rambd.c bd/lfs_filebd.c bd/lfs_emubd.c
# C_SOURCE_FILES += $(addprefix $(LITTLEFS_SRC_DIR)/,$(LITTLEFS_BD_FILES))