//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <active_window_info/active_window_info_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) active_window_info_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ActiveWindowInfoPlugin");
  active_window_info_plugin_register_with_registrar(active_window_info_registrar);
}
