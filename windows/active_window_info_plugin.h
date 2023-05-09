#ifndef FLUTTER_PLUGIN_ACTIVE_WINDOW_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_ACTIVE_WINDOW_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace active_window_info {

class ActiveWindowInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ActiveWindowInfoPlugin();

  virtual ~ActiveWindowInfoPlugin();

  // Disallow copy and assign.
  ActiveWindowInfoPlugin(const ActiveWindowInfoPlugin&) = delete;
  ActiveWindowInfoPlugin& operator=(const ActiveWindowInfoPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace active_window_info

#endif  // FLUTTER_PLUGIN_ACTIVE_WINDOW_INFO_PLUGIN_H_
