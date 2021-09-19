Pod::Spec.new do |s|
  s.name             = 'flutter_tflite'
  s.version          = '0.0.3'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*', 'src/TfliteBase.cpp'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.vendored_libraries="lib/libtensorflowlite.*"
  
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    "USER_HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/include"',
    'ALWAYS_SEARCH_USER_PATHS' => "YES",
    'OTHER_LDFLAGS' => '-ltensorflowlite'
  }

  s.user_target_xcconfig = {
    'ALWAYS_SEARCH_USER_PATHS' => "YES",
    "USER_HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/include"',
    'OTHER_CFLAGS' => '-fmodules -fcxx-modules',
    'OTHER_LDFLAGS' => '-ltensorflowlite', 
    # ^-- this doesn't seem to work. Ideally this plugin should export the right flags so any referencing plugin will automatically link with libtensorflowlite.so. 
    # right now, seems we have to add this manually to every 
    'LIBRARY_SEARCH_PATHS' => "'${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/lib'"
  }

  s.xcconfig = {
  }
  
  s.swift_version = '5.0'
end
