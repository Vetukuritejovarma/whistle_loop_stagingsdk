import 'package:flutter_test/flutter_test.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_platform_interface.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWhistleLoopStagingsdkPlatform
    with MockPlatformInterfaceMixin
    implements WhistleLoopStagingsdkPlatform {


  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getConnectionType() {
    // TODO: implement getConnectionType
    throw UnimplementedError();
  }

  @override
  Future<String?> getDeviceType() {
    // TODO: implement getDeviceType
    throw UnimplementedError();
  }

  @override
  Future<String?> getIP() {
    // TODO: implement getIP
    throw UnimplementedError();
  }

  @override
  Future<String?> getPlatform() {
    // TODO: implement getPlatform
    throw UnimplementedError();
  }



  @override
  Future<String?> getpac() {
    // TODO: implement getpac
    throw UnimplementedError();
  }

  @override
  Future<String?> initDeviceId() {
    // TODO: implement initDeviceId
    throw UnimplementedError();
  }

  @override
  Future<String> getDate() {
    // TODO: implement getDate
    throw UnimplementedError();
  }

  @override
  Future<String> getTime() {
    // TODO: implement getTime
    throw UnimplementedError();
  }
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
