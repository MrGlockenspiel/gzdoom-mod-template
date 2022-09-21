TARGET := game.pk3

SRC_DIR := src
ACS_SRC := $(wildcard $(SRC_DIR)/acs/*.acs)
MAP_SRC := $(wildcard $(SRC_DIR)/maps/*.wad)

# tool paths 
ACC := acc
NODE_BUILDER := zdbsp
ZDOOM := gzdoom
ZIP := zip -r

all: $(TARGET)

$(TARGET): acs 
	rm -f $(TARGET)
	cd $(SRC_DIR) && $(ZIP) $(TARGET) *
	mv $(SRC_DIR)/$(TARGET) ./$(TARGET)

clean:
	rm -f $(TARGET)

acs:
	$(foreach var,$(ACS_SRC),$(ACC) $(var);)

nodes:
	$(NODE_BUILDER) "$(MAP_SRC)"

test: acs
	gzdoom -file $(SRC_DIR)/

testbuild: $(TARGET)
	gzdoom -file $(TARGET)

.PHONY: all clean test
