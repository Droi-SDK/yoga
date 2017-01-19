#!/bin/bash -eu

buck build //java:jni#android-arm,shared

cp buck-out/gen/java/jni#android-arm,shared/libyoga.so android/libs/armeabi

cp buck-out/gen/lib/fb/fbjni#android-arm,shared/liblib_fb_fbjni.so android/libs/armeabi  

cp buck-out/gen/yoga#android-arm,shared/libyogacore.so android/libs/armeabi

buck build //java:jni#android-x86,shared

cp buck-out/gen/java/jni#android-x86,shared/libyoga.so android/libs/armeabi

cp buck-out/gen/lib/fb/fbjni#android-x86,shared/liblib_fb_fbjni.so android/libs/armeabi  

cp buck-out/gen/yoga#android-x86,shared/libyogacore.so android/libs/armeabi

## compile aar

./gradlew clean build

rm -rf android/bundle-release/*
cp -r build/intermediates/bundles/release/jni android/bundle-release/
cp -r build/intermediates/bundles/release/classes.jar android/bundle-release/
