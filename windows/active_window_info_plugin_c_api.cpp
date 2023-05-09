#include "include/active_window_info/active_window_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "active_window_info_plugin.h"

void ActiveWindowInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  active_window_info::ActiveWindowInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
