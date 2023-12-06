import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whistle_loop_stagingsdk/whistle_loop_stagingsdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWhistleLoopStagingsdk platform = MethodChannelWhistleLoopStagingsdk();
  const MethodChannel channel = MethodChannel('whistle_loop_stagingsdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
