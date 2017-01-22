#!/bin/bash -eu
rm -rf buck-out

buck build //java:jni#android-arm,shared
cp buck-out/gen/java/jni#android-arm,shared/libyoga.so android/libs/armeabi/
cp buck-out/gen/lib/fb/fbjni#android-arm,shared/liblib_fb_fbjni.so android/libs/armeabi/
cp buck-out/gen/yoga#android-arm,shared/libyogacore.so android/libs/armeabi/

buck build //java:jni#android-x86,shared
cp buck-out/gen/java/jni#android-x86,shared/libyoga.so android/libs/x86/
cp buck-out/gen/lib/fb/fbjni#android-x86,shared/liblib_fb_fbjni.so android/libs/x86/
cp buck-out/gen/yoga#android-x86,shared/libyogacore.so android/libs/x86/

## compile aar
#./gradlew clean build


