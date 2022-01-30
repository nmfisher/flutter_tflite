# flutter_tflite

A Flutter plugin wrapping tensorflow lite.

This isn't a genuine Flutter plugin, even though it is packaged as such. This is just a convenient way to package TFLite dynamic libraries and a few helper classes so that actual Flutter plugins/projects can reference this project in their `pubspec.yaml`.

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

and on Android:




