# Directories
STL_DIR=stl
IMG_DIR=png
SRC_DIR=src

# Apps
# You can redefine them with full path if not in PATH
OPENSCAD?=openscad
SIMARRANGE?=simarrange
STLSORT?=stlsort

# For plate generating
PLATE?=180
X?=$(PLATE)
Y?=$(PLATE)
SAFLAGS?=-m

SOURCES=$(wildcard $(SRC_DIR)/*.scad)
TARGETS=$(patsubst $(SRC_DIR)/%.scad, $(STL_DIR)/%.stl, $(SOURCES))
IMAGES=$(patsubst $(SRC_DIR)/%.scad, $(IMG_DIR)/%.png, $(SOURCES))

all: stls

stls: $(TARGETS)

$(STL_DIR)/%.stl: $(SRC_DIR)/%.scad
	$(OPENSCAD) -m make -o $@ $<
	$(STLSORT) $@

images: $(IMAGES)

$(IMG_DIR)/%.png: $(SRC_DIR)/%.scad
	$(OPENSCAD) -m make --render -o $@ $<

arrange: stls
	 $(SIMARRANGE) -x $(X) -y $(Y) $(SAFLAGS) $(TARGETS)
	 
clean:
	rm -f $(STL_DIR)/*.stl
	rm -f $(STL_DIR)/*.gcode
	rm -f $(IMG_DIR)/*.png
	rm -f plate??.png
	rm -f plate??.stl
