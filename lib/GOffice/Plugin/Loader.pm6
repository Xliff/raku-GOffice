use v6.c;

use NativeCall;

use GOffice::Raw::Types;
use GOffice::Raw::Plugin::Loader;

class GOffice::Plugin::Loader {
  has GOPluginLoader $!gpl is implementor;

  method get_plugin ( :$raw = False ) {
    propReturnObject(
      go_plugin_loader_get_plugin($!gpl),
      $raw,
      |::('GOffice::Plugin').getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &go_plugin_loader_get_type, $n, $t );
  }

  method is_base_loaded {
    so go_plugin_loader_is_base_loaded($!gpl);
  }

  method load_base (CArray[GOErrorInfo] $err) {
    go_plugin_loader_load_base($!gpl, $err);
  }

  method load_service (
    GOPluginLoaderService() $s,
    CArray[GOErrorInfo]     $err
  ) {
    go_plugin_loader_load_service($!gpl, $s, $err);
  }

  method set_attributes (GHashTable() $attrs, CArray[GOErrorInfo] $err) {
    go_plugin_loader_set_attributes($!gpl, $attrs, $err);
  }

  method set_plugin (GOPlugin() $p) {
    go_plugin_loader_set_plugin($!gpl, $p);
  }

  method unload_base (CArray[GOErrorInfo] $err) {
    go_plugin_loader_unload_base($!gpl, $err);
  }

  method unload_service (
    GOPluginLoaderService() $s,
    CArray[GOErrorInfo]     $err
  ) {
    go_plugin_loader_unload_service($!gpl, $s, $err);
  }

}

class GOffice::Plugin::Loader::Module {
  has GOPluginLoaderModule $!gplm is implementor;

  method get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &go_plugin_loader_module_get_type,
      $n,
      $t
    );
  }

  method register_version (Str() $ver) {
    go_plugin_loader_module_register_version($!gplm, $ver);
  }

}
