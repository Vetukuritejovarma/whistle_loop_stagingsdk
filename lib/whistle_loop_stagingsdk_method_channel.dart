import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'whistle_loop_stagingsdk_platform_interface.dart';

/// An implementation of [WhistleLoopStagingsdkPlatform] that uses method channels.
class MethodChannelWhistleLoopStagingsdk extends WhistleLoopStagingsdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('whistle_loop_stagingsdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
