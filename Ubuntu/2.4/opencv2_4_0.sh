echo "Installing OpenCV 2.4.0"
mkdir OpenCV
cd OpenCV
echo "Installing Dependenices"
sudo apt-get install libopencv-dev
sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get install python-dev python-numpy
sudo apt-get install libtbb-dev
sudo apt-get install libqt4-dev libgtk2.0-dev
echo "Downloading ffmpeg"
wget http://ffmpeg.org/releases/ffmpeg-0.8.12.tar.bz2
echo "Installing ffmpeg"
tar -xvf ffmpeg-0.8.12.tar.bz2
cd ffmpeg-0.8.12/
./configure –enable-gpl –enable-libfaac –enable-libmp3lame –enable-libopencore-amrnb –enable-libopencore-amrwb –enable-libtheora –enable-libvorbis –enable-libx264 –enable-libxvid –enable-nonfree –enable-postproc –enable-version3 –enable-x11grab –enable-pic –enable-shared
make
sudo make install
cd ..
echo "Downloading v4l"
wget http://www.linuxtv.org/downloads/v4l-utils/v4l-utils-0.8.4.tar.bz2
echo "Installing v4l"
tar -xvf v4l-utils-0.8.4.tar.bz2
cd v4l-utils-0.8.4/
make
sudo make install
cd ..
echo "Downloading OpenCV 2.4.0"
wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.0/OpenCV-2.4.0.tar.bz2/download
echo "Installing OpenCV 2.4.0"
tar -xvf OpenCV-2.4.0.tar.bz2
mkdir build
cd build
cmake -D WITH_QT=ON -D WITH_XINE=OFF -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON ..
make
sudo make install
sudo echo “/usr/local/lib” >> /etc/ld.so.conf
sudo ldconfig
echo "OpenCV 2.4.0 ready to be used"
