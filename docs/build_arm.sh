#macos 
#brew install gcc48

cd .

# Android/ARM, armeabi-v7a (ARMv7 VFP), Android 4.0+ (ICS)
NDK=$NDK_ROOT
NDKABI=21
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm" 
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"

echo 11111

which make
echo "aaa"
# make clean
make HOST_CC="gcc-4.8 -O2 -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"
# cp ./libluajit.a ../../android/jni/libluajit.a
make clean
echo 2222
./configure --prefix=`pwd`/android/armv7 --host=arm-linux-androideabi HOST_CC="gcc-4.8 -O2 -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"

cd android

echo "new dir"
echo `pwd`
#ndk-build clean APP_ABI="armeabi-v7a,x86"
# ndk-build APP_ABI="armeabi-v7a"

ndk-build APP_ABI=all

# cp libs/armeabi-v7a/libtolua.so ../Plugins/Android/libs/armeabi-v7a
# ndk-build clean APP_ABI="armeabi-v7a,x86"
