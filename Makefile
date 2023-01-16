
BUILD_DIR := linuxbuild/
MAKEOPTS :=


all: $(BUILD_DIR)/NorthstarLauncher.exe $(BUILD_DIR)/Northstar.dll
	mkdir -p $(BUILD_DIR)
	cp NorthstarDLL/$(BUILD_DIR)/Northstar.dll $(BUILD_DIR)
	cp NorthstarDLL/$(BUILD_DIR)/linuxbuild/MinHook.dll $(BUILD_DIR)
	cp NorthstarLauncher/$(BUILD_DIR)/NorthstarLauncher.exe $(BUILD_DIR)


debug: MAKEOPTS += debug
debug: all


$(BUILD_DIR)/NorthstarLauncher.exe:
	$(MAKE) -C NorthstarLauncher/ $(MAKEOPTS)


$(BUILD_DIR)/Northstar.dll:
	$(MAKE) -C NorthstarDLL/ $(MAKEOPTS)


.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
	$(MAKE) -C NorthstarDLL/ clean
	$(MAKE) -C NorthstarLauncher/
