import 'package:flutter/material.dart';
import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FetchDeviceId(),
    );
  }
}

class FetchDeviceId extends StatefulWidget {
  @override
  _FetchDeviceIdState createState() => _FetchDeviceIdState();
}

class _FetchDeviceIdState extends State<FetchDeviceId> {
  String? _advertisingId;
  String? _clickedDate;
  String? _clickedTime;
  String? pkgname;
  String? _ipAddress;
  String? _platform;
  String? _deviceModel;

  @override
  void initState() {
    super.initState();
  }

  Future<void> initDeviceId() async {
    String? advertisingId;
    try {
      advertisingId = await AdvertisingId.id(true);
    } on PlatformException {
      advertisingId = 'Failed to get advertising id.';
    }

    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    String time = '${now.hour}:${now.minute}:${now.second}';

    if (!mounted) return;

    setState(() {
      _advertisingId = advertisingId;
      _clickedDate = date;
      _clickedTime = time;
    });
  }
  Future<void> getpac() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String? packageName = packageInfo.packageName;

    if (!mounted) return;

    setState(() {
      pkgname = packageName;
    });
  }
  Future<void> getIP() async {
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      dynamic data = await ipAddress.getIpAddress();

      if (!mounted) return;

      setState(() {
        _ipAddress = data.toString();
      });
    } on IpAddressException catch (exception) {
      print(exception.message);
    }
  }
  void getPlatform() {
    String platform;

    if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Unknown';
    }

    if (!mounted) return;

    setState(() {
      _platform = platform;
    });
  }
  Future<void> getDeviceType() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;      setState(() {
        _deviceModel = androidInfo.model.toString();

      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        _deviceModel = iosInfo.systemVersion;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Device ID'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                initDeviceId();
                getpac();
                getIP();
                getPlatform();

                getDeviceType();
              },
              child: Text('Fetch Advertising ID'),
            ),
            SizedBox(height: 20),
            Text(
              _advertisingId != null ? 'Device ID: $_advertisingId' : 'Click the button to fetch the advertising ID',
              style: TextStyle(
                  color: Colors.blue, // Change the color to red
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              _clickedDate != null ? 'Clicked Date: $_clickedDate' : 'No click recorded',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              _clickedTime != null ? 'Clicked Time: $_clickedTime' : 'No click recorded',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            SizedBox(height: 20),
            Text(
              pkgname != null ? 'Package Name: $pkgname' : 'No package name fetched',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            Text(
              _ipAddress != null ? 'IP Address: $_ipAddress' : 'No IP address fetched',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            Text(
              _platform != null ? 'Platform: $_platform' : 'No platform fetched',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
            Text(
              _deviceModel != null ? 'Device Model: $_deviceModel' : 'No device model fetched',
              style: TextStyle(
                  color: Colors.black, // Change the color to black
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold// Change the font size to 20
              ),
            ),
          ],
        ),
      ),
    );
  }
}