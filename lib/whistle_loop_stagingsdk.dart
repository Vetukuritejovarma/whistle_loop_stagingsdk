import 'whistle_loop_stagingsdk_platform_interface.dart';

class WhistleLoopStagingsdk {
  Future<String?> getPlatformVersion() {
    return WhistleLoopStagingsdkPlatform.instance.getPlatformVersion();
  }

  Future<String?> initDeviceId() {
    return WhistleLoopStagingsdkPlatform.instance.initDeviceId();
  }

  Future<String?> getpac() {
    return WhistleLoopStagingsdkPlatform.instance.getpac();
  }

  Future<String?> getIP() {
    return WhistleLoopStagingsdkPlatform.instance.getIP();
  }

  Future<String?> getPlatform() {
    return WhistleLoopStagingsdkPlatform.instance.getPlatform();
  }

  Future<String?> getDeviceType() {
    return WhistleLoopStagingsdkPlatform.instance.getDeviceType();
  }


  Future<String?> getTime() {
    return WhistleLoopStagingsdkPlatform.instance.getTime();
  }
  Future<String?> getDate() {
    return WhistleLoopStagingsdkPlatform.instance.getDate();
  }

  Future<String?> getConnectionType() {
    return WhistleLoopStagingsdkPlatform.instance.getConnectionType();
  }
}