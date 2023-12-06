
import 'whistle_loop_stagingsdk_platform_interface.dart';

class WhistleLoopStagingsdk {
  Future<String?> getPlatformVersion() {
    return WhistleLoopStagingsdkPlatform.instance.getPlatformVersion();
  }
}
