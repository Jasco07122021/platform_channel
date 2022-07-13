import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const platformAndroid = MethodChannel("samples.flutter.dev/battery");
  String _batteryLevel = "Unknown battery level...";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platformAndroid.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery level: $result";
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: ${e.message}";
    }catch(e){
      batteryLevel = "$e";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Channel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
