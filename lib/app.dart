import 'package:flutter/material.dart';
import 'package:platform_channel_flutter/views/home_view.dart';

class PlatformChannelApp extends StatelessWidget {
  const PlatformChannelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
