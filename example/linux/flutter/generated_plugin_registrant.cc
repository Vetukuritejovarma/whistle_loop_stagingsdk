//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <whistle_loop_stagingsdk/whistle_loop_stagingsdk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) whistle_loop_stagingsdk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WhistleLoopStagingsdkPlugin");
  whistle_loop_stagingsdk_plugin_register_with_registrar(whistle_loop_stagingsdk_registrar);
}
