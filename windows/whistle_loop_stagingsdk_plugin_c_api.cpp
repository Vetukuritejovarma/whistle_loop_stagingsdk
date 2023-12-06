#include "include/whistle_loop_stagingsdk/whistle_loop_stagingsdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "whistle_loop_stagingsdk_plugin.h"

void WhistleLoopStagingsdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  whistle_loop_stagingsdk::WhistleLoopStagingsdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
