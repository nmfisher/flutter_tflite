cmake_minimum_required(VERSION 3.4.1)  # for example

include_directories(../ios/include)

link_directories(src/main/jniLibs/${ANDROID_ABI})

add_library( 
            tflite
            SHARED
            ../ios/src/TfliteBase.cpp
        )

target_link_libraries(tflite -landroid -llog -ltensorflowlite)
