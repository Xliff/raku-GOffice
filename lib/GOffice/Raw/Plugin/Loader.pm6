use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Plugin::Loader;

### /usr/src/goffice/goffice/app/go-plugin-loader.h

sub go_plugin_loader_get_plugin (GOPluginLoader $l)
  returns GOPlugin
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_is_base_loaded (GOPluginLoader $l)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_load_base (
  GOPluginLoader      $l,
  CArray[GOErrorInfo] $err
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_load_service (
  GOPluginLoader      $l,
  GOPluginService     $s,
  CArray[GOErrorInfo] $err
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_set_attributes (
  GOPluginLoader      $l,
  GHashTable          $attrs,
  CArray[GOErrorInfo] $err
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_set_plugin (
  GOPluginLoader $l,
  GOPlugin       $p
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_unload_base (
  GOPluginLoader      $l,
  CArray[GOErrorInfo] $err
)
  is      native(goffice)
  is      export
{ * }

sub go_plugin_loader_unload_service (
  GOPluginLoader      $l,
  GOPluginService     $s,
  CArray[GOErrorInfo] $err
)
  is      native(goffice)
  is      export
{ * }
