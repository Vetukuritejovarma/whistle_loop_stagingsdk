import 'dart:io';
import 'package:advertising_id/advertising_id.dart';//initDeviceId
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_platform_interface.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:connectivity_plus/connectivity_plus.dart';





class MethodChannelWhistleLoopStagingsdk extends WhistleLoopStagingsdkPlatform {
  // ...

  @override
  Future<String?> initDeviceId() async {
    String? advertisingId;
    try {
      advertisingId = await AdvertisingId.id(true);
    } on PlatformException {
      advertisingId = 'Failed to get advertising id.';
    }
    return advertisingId;
  }


  @override
  Future<String?> getpac() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String? packageName = packageInfo.packageName;
    return packageName;
  }

  @override

  Future<String> getIP() async {
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      dynamic data = await ipAddress.getIpAddress();
      return data.toString();
    } on IpAddressException catch (exception) {
      print(exception.message);
      return 'Failed to get IP address.';
    }
  }

  @override
  Future<String?> getDeviceType() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
    return null;
  }

  @override
  Future<String> getTime() async {
    DateTime now = DateTime.now();
    // String date = '${now.year}-${now.month}-${now.day}';
    String time = '${now.hour}:${now.minute}:${now.second}';

    return time;
  }

  @override
  Future<String> getDate() async {
    DateTime now = DateTime.now();
    String date = '${now.year}-${now.month}-${now.day}';
    // String time = '${now.hour}:${now.minute}:${now.second}';

    return date;
  }

  @override
  Future<String> getPlatform() async {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else {
      return 'Unknown';
    }
  }



  @override
  Future<String> getConnectionType() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return 'Mobile';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return 'WiFi';
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      return 'Ethernet';
    } else if (connectivityResult == ConnectivityResult.vpn) {
      return 'VPN';
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      return 'Bluetooth';
    } else if (connectivityResult == ConnectivityResult.other) {
      return 'Other';
    } else if (connectivityResult == ConnectivityResult.none) {
      return 'None';
    } else {
      return 'Unknown';
    }
  }




// ...
}