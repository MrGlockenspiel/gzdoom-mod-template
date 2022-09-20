TARGET := game.pk3
SOURCE := src

all: $(TARGET)

$(TARGET): 
	rm -f $(TARGET)
	cd $(SOURCE) && zip -r $(TARGET) *
	mv $(SOURCE)/$(TARGET) ./$(TARGET)

clean:
	rm -f $(TARGET)

acs:
	acc src/acs/script.acs src/acs/script

test: 
	gzdoom -file $(SOURCE)/

testbuild: $(TARGET)
	gzdoom -file $(TARGET)

.PHONY: all clean test
