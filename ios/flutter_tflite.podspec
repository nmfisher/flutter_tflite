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
  s.source_files = 'Classes/**/*', 'src/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.vendored_libraries="lib/libtensorflowlite.*"
  s.xcconfig = {
    "USER_HEADER_SEARCH_PATHS" => '"${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/include"',
    'OTHER_CFLAGS' => '-fmodules -fcxx-modules',
    'OTHER_LDFLAGS' => '-force_load "-ltensorflowlite"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  }

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 
    #'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'LIBRARY_SEARCH_PATHS' => "'${PODS_ROOT}/../.symlinks/plugins/flutter_tflite/ios/lib'",
  }
  
  s.swift_version = '5.0'
end
