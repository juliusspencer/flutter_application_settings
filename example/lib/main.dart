import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_application_settings/flutter_application_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _error = '';

  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text('Settings'), onPressed: _viewAppSettings),
              Text(_error)
            ],
          ),
        ),
      ),
    );
  }

  void _viewAppSettings() async {
    // Platform messages are asynchronous, so we initialize in an async method.
    String error;
    try {
      await FlutterApplicationSettings.viewAppSettings;
    } on PlatformException {
      error = 'Failed to get load app settings.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _error = error;
    });
  }


}
