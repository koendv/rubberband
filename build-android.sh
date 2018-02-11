#!/bin/bash
# objects in obj/ ; libraries in libs/
export ANDROID_NDK=/opt/android-ndk-r10e
( cd jni ; $ANDROID_NDK/ndk-build )
( cd libs ; zip -9 -r ../rubberband.zip . )

