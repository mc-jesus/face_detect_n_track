CXX = g++

PKG_DEFAULT = `pkg-config gstreamer-1.0 gtk+-2.0 opencv --libs`
PKG_GSTPLAYER = `pkg-config gstreamer-1.0 gtk+-2.0 opencv --cflags`

FACEDETECTOR = VideoFaceDetector.cpp
MAIN_SRC = main.cpp
EXEC = trackFaces

default: vfd
	$(CXX) $(MAIN_SRC) VideoFaceDetector.o -o $(EXEC) \
	-lgstapp-1.0 $(PKG_DEFAULT)

vfd:
	$(CXX) -g -c VideoFaceDetector.cpp --std=c++11 \
	-lopencv_highgui -lopencv_objdetect -lopencv_core \
	-lopencv_imgproc

clean:
	rm -f $(EXEC) *.o

new:
	make clean && make
