import 'dart:async';

import 'package:flutter/services.dart';

class FlutterApplicationSettings {
  static const MethodChannel _channel = const MethodChannel('flutter_application_settings');

  static Future<void> get viewAppSettings async {
    await _channel.invokeMethod('viewAppSettings');
  }
}
