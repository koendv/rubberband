This is an Android build of Rubber Band, an audio time-stretching and pitch-shifting library.
For use in Java see [TarsosDSP](https://0110.be/posts/Control_Audio_Time_Stretching_and_Pitch_Shifting_from_Java_using_Rubber_Band_And_JNI).


Architectures
----
* armeabi
* armeabi-v7a
* arm64-v8a
* x86_64

Instructions
----
* Install Android NDK on linux

  Download [Android NDK](https://developer.android.com/ndk/index.html). I am using Android NDK r10e.

* Clone git repository

  `git clone --recursive https://github.com/koendv/rubberband`
  
* Edit build-android.sh and set the Android NDK installation path.

  Example:
  
  `export ANDROID_NDK=/opt/android-ndk-r10e/`
  
* Run following command to compile librubberband:

  `./build-android.sh`
  
* Find the libraries in the libs directory. Find a zip of librubberband for various architectures in the release directory.

* You can also download [prebuilt-binaries](https://github.com/koendv/rubberband/raw/master/release/rubberband.zip)

To Do
----
Tune compilation options for different archs.
