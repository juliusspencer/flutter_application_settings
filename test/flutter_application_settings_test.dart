import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_settings/flutter_application_settings.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_application_settings');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('viewAppSettings', () async {
    await FlutterApplicationSettings.viewAppSettings;
  });
}
