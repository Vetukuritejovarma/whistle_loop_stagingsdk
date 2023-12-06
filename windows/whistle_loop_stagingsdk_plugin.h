#ifndef FLUTTER_PLUGIN_WHISTLE_LOOP_STAGINGSDK_PLUGIN_H_
#define FLUTTER_PLUGIN_WHISTLE_LOOP_STAGINGSDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace whistle_loop_stagingsdk {

class WhistleLoopStagingsdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  WhistleLoopStagingsdkPlugin();

  virtual ~WhistleLoopStagingsdkPlugin();

  // Disallow copy and assign.
  WhistleLoopStagingsdkPlugin(const WhistleLoopStagingsdkPlugin&) = delete;
  WhistleLoopStagingsdkPlugin& operator=(const WhistleLoopStagingsdkPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace whistle_loop_stagingsdk

#endif  // FLUTTER_PLUGIN_WHISTLE_LOOP_STAGINGSDK_PLUGIN_H_
