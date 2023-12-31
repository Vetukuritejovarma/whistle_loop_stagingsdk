import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'whistle_loop_stagingsdk_method_channel.dart';

abstract class WhistleLoopStagingsdkPlatform extends PlatformInterface {
  /// Constructs a WhistleLoopStagingsdkPlatform.
  WhistleLoopStagingsdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static WhistleLoopStagingsdkPlatform _instance = MethodChannelWhistleLoopStagingsdk();

  /// The default instance of [WhistleLoopStagingsdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelWhistleLoopStagingsdk].
  static WhistleLoopStagingsdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WhistleLoopStagingsdkPlatform] when
  /// they register themselves.
  static set instance(WhistleLoopStagingsdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> initDeviceId() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String?> getpac() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String?> getIP() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String?> getPlatform() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String?> getDeviceType() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String> getTime() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String> getDate() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
  Future<String?> getConnectionType() {
    throw UnimplementedError('initDeviceId() has not been implemented.');
  }
}
