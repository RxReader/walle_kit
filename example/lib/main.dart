import 'dart:async';

import 'package:flutter/material.dart';
import 'package:walle_kit/walle_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _channelId = '';

  @override
  void initState() {
    super.initState();
    _initChannelId();
  }

  Future<void> _initChannelId() async {
    final String? channelId = await Walle.getChannelId();

    if (!mounted) {
      return;
    }

    setState(() {
      _channelId = channelId ?? 'unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('walle_kit'),
        ),
        body: Center(
          child: Text('channelId: $_channelId\n'),
        ),
      ),
    );
  }
}
