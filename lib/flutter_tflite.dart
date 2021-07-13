
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterTflite {
  static const MethodChannel _channel = MethodChannel('flutter_tflite');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
