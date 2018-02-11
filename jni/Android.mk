LOCAL_PATH := $(call my-dir)/..
LOCAL_MODULE := rubberband
LOCAL_MODULE_FILENAME := librubberband-jni

RUBBERBAND_PATH := $(LOCAL_PATH)
RUBBERBAND_SRC_PATH := $(RUBBERBAND_PATH)/src

LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/src

LOCAL_CFLAGS := \
	-Wall \
	-I$(RUBBERBAND_PATH) \
	-I$(RUBBERBAND_SRC_PATH) \
	-DUSE_SPEEX \
	-DUSE_KISSFFT \
	-DPROCESS_SAMPLE_TYPE=float \
	-DLACK_POSIX_MEMALIGN \
	-DUSE_OWN_ALIGNED_MALLOC \
	-DLACK_SINCOS \
	-DNO_EXCEPTIONS \
	-DNO_THREADING \
	-DNO_THREAD_CHECKS

RUBBERBAND_JNI_FILES := \
	$(RUBBERBAND_SRC_PATH)/jni/RubberBandStretcherJNI.cpp

RUBBERBAND_SRC_FILES := \
        $(RUBBERBAND_SRC_PATH)/base/Profiler.cpp \
        $(RUBBERBAND_SRC_PATH)/system/Thread.cpp \
        $(RUBBERBAND_SRC_PATH)/system/Allocators.cpp \
        $(RUBBERBAND_SRC_PATH)/system/sysutils.cpp \
        $(RUBBERBAND_SRC_PATH)/system/VectorOpsComplex.cpp \
        $(RUBBERBAND_SRC_PATH)/StretcherChannelData.cpp \
        $(RUBBERBAND_SRC_PATH)/dsp/AudioCurveCalculator.cpp \
        $(RUBBERBAND_SRC_PATH)/dsp/FFT.cpp \
        $(RUBBERBAND_SRC_PATH)/dsp/Resampler.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/SilentAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/CompoundAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/HighFrequencyAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/SpectralDifferenceAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/ConstantAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/audiocurves/PercussiveAudioCurve.cpp \
        $(RUBBERBAND_SRC_PATH)/StretcherImpl.cpp \
        $(RUBBERBAND_SRC_PATH)/StretcherProcess.cpp \
        $(RUBBERBAND_SRC_PATH)/StretchCalculator.cpp \
        $(RUBBERBAND_SRC_PATH)/RubberBandStretcher.cpp \
        $(RUBBERBAND_SRC_PATH)/speex/resample.c

LOCAL_SRC_FILES += \
	$(RUBBERBAND_JNI_FILES) \
        $(RUBBERBAND_SRC_FILES)

LOCAL_SRC_FILES += \
	$(RUBBERBAND_SRC_PATH)/kissfft/kiss_fft.c \
	$(RUBBERBAND_SRC_PATH)/kissfft/kiss_fftr.c

ifeq ($(TARGET_ARCH_ABI), x86_64)
LOCAL_CFLAGS += \
	-O3 \
	-DUSE_POMMIER_MATHFUN \
	-DNO_TIMING \
	-DNO_TIMING_COMPLETE_NOOP

endif

ifeq ($(TARGET_ARCH_ABI), arm64-v8a)
LOCAL_CFLAGS += \
	-O3 \
	-DUSE_POMMIER_MATHFUN \
	-DNO_TIMING \
	-DNO_TIMING_COMPLETE_NOOP

endif

ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
LOCAL_CFLAGS += \
	-O3 \
	-mfpu=neon \
	-mfloat-abi=softfp \
	-ffast-math \
	-ftree-vectorize \
	-freciprocal-math \
	-fsingle-precision-constant \
	-D__ARM_ARCH_7__ \
	-DARM_RUNFAST \
	-DUSE_POMMIER_MATHFUN \
	-DNO_TIMING \
	-DNO_TIMING_COMPLETE_NOOP

LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := true
endif

ifeq ($(TARGET_ARCH_ABI), armeabi)
LOCAL_CFLAGS += \
	-O3 \
	-DNO_TIMING \
	-DNO_TIMING_COMPLETE_NOOP

LOCAL_ARM_MODE := arm
LOCAL_ARM_NEON := false
endif

LOCAL_LDLIBS += -llog

include $(BUILD_SHARED_LIBRARY)

