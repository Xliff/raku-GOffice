use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Plugin;

### /usr/src/goffice/goffice/app/go-plugin.h

sub go_plugins_get_active_plugins
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_plugins_get_available_plugins
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_plugins_get_plugin_by_id (Str $plugin_id)
  returns GOPlugin
  is      native(goffice)
  is      export
{ * }

sub go_plugins_get_plugin_dir
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_activate (
  GOPlugin            $plugin,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_can_deactivate (GOPlugin $plugin)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_plugin_db_activate_plugin_list (
  GSList              $plugins,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_db_deactivate_plugin_list (
  GSList              $plugins,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_db_is_plugin_marked_for_deactivation (GOPlugin $plugin)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_plugin_db_mark_plugin_for_deactivation (
  GOPlugin $plugin,
  gboolean $mark
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_deactivate (
  GOPlugin            $plugin,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_dependencies_ids (GOPlugin $plugin)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_description (GOPlugin $plugin)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_dir_name (GOPlugin $plugin)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_id (GOPlugin $plugin)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_loader (GOPlugin $plugin)
  returns GOPluginLoader
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_name (GOPlugin $plugin)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_services (GOPlugin $plugin)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_textdomain (GOPlugin $plugin)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_plugin_get_type_module (GOPlugin $plugin)
  returns GTypeModule
  is      native(goffice)
  is      export
{ * }

sub go_plugin_is_active (GOPlugin $plugin)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_plugin_is_loaded (GOPlugin $plugin)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_plugin_load_service (
  GOPlugin            $plugin,
  GOPluginService     $service,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_unload_service (
  GOPlugin            $plugin,
  GOPluginService     $service,
  CArray[GOErrorInfo] $ret_error
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_use_ref (GOPlugin $plugin)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_use_unref (GOPlugin $plugin)
  is      native(goffice)
  is      export
{ * }

sub go_plugins_init (
  GOCmdContext $context,
  GSList       $known_states,
  GSList       $active_plugins,
  GSList       $plugin_dirs,
  gboolean     $activate_new_plugins,
  GType        $default_loader_type
)
  is      native(goffice)
  is      export
{ * }

sub go_plugins_register_loader (
  Str             $id_str,
  GOPluginService $service
)
  is      native(goffice)
  is      export
{ * }

sub go_plugins_rescan (
  CArray[GOErrorInfo]     $ret_error,
  CArray[Pointer[GSList]] $ret_new_plugins
)
  is      native(goffice)
  is      export
{ * }

sub go_plugins_shutdown
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_plugins_unregister_loader (Str $id_str)
  is      native(goffice)
  is      export
{ * }
