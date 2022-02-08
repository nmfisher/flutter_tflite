# flutter_tflite

A Flutter plugin wrapping TFLite shared libraries for Android/iOS. This isn't a genuine "plugin", just a convenient way to deliver TFLite dependencies for downstream Flutter plugins/projects to reference in their `pubspec.yaml`.

To do so, your podspec on iOS should look something like this:

## iOS

```
Pod::Spec.new do |s|
...
  s.dependency 'Flutter'
  s.dependency "flutter_tflite"
...
  s.pod_target_xcconfig = { 
    "ALWAYS_SEARCH_USER_PATHS" => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ltensorflowlite',
    "USER_HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/include"'
  }
```

## Android:

Libraries will be automatically merged into your application's jniLibs folder.

If you need to write your own C++ code (which you probably will), your CMakeLists.txt file should look something like:

```
string(REPLACE "your_app_lib\\intermediates\\cmake" "flutter_tflite\\intermediates\\stripped_native_libs" JNI_DIR ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
string(REPLACE "obj" "out\\lib" JNI_DIR ${JNI_DIR})

link_directories(${JNI_DIR})

include_directories(../src)
include_directories(../include)
link_directories(src/main/libs/${ANDROID_ABI}) # don't use jniLibs here because we just want to link against these libraries, the actual .so files will be copied by the AAR dependencies
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
add_library( 
            yourlib
            SHARED
            ../src/custom.cpp
        ) 


target_link_libraries(yourlib -landroid -llog -ltflite -ltensorflowlite )
```

This assumes a directory structure like:
````
- android
  - CMakeLists.txt
- src
  - custom.cpp
- include
  - custom.hpp
- ios
  - ...
- pubspec.yaml
```

### TFLite

TFLite has been built as follows:

```
git clone https://github.com/tensorflow/tensorflow.git && cd tensorflow
~/bin/bazel build -c opt --cxxopt=-std=c++14 --config=android_x86_64 //tensorflow/lite:libtensorflowlite.so
~/bin/bazel build -c opt --cxxopt=-std=c++14 --config=android_x86 //tensorflow/lite:libtensorflowlite.so
~/bin/bazel build -c opt --cxxopt=-std=c++14 --config=android_arm //tensorflow/lite:libtensorflowlite.so
~/bin/bazel build -c opt --cxxopt=-std=c++14 --config=android_arm64 //tensorflow/lite:libtensorflowlite.so
```




