import 'package:flutter_test/flutter_test.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_platform_interface.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWhistleLoopStagingsdkPlatform
    with MockPlatformInterfaceMixin
    implements WhistleLoopStagingsdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WhistleLoopStagingsdkPlatform initialPlatform = WhistleLoopStagingsdkPlatform.instance;

  test('$MethodChannelWhistleLoopStagingsdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWhistleLoopStagingsdk>());
  });

  test('getPlatformVersion', () async {
    WhistleLoopStagingsdk whistleLoopStagingsdkPlugin = WhistleLoopStagingsdk();
    MockWhistleLoopStagingsdkPlatform fakePlatform = MockWhistleLoopStagingsdkPlatform();
    WhistleLoopStagingsdkPlatform.instance = fakePlatform;

    expect(await whistleLoopStagingsdkPlugin.getPlatformVersion(), '42');
  });
}
