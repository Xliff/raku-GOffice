use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Plugin;

use GLib::GSList;
use GLib::Object::TypeModule;
use GOffice::Plugin::Loader;

use GLib::Roles::Implementor;

our subset GOPluginAncestry is export of Mu
  where GOPlugin | GTypeModuleAncestry;

class GOffice::Plugin is GLib::Object::TypeModule {
  has GOPlugin $!gp is implementor;

  submethod BUILD ( :$goffice-plugin ) {
    self.setGOPlugin($goffice-plugin) if $goffice-plugin
  }

  method setGOPlugin (GOPluginAncestry $_) {
    my $to-parent;

    $!gp = do {
      when GOPlugin {
        $to-parent = cast(GTypeModule, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GOPlugin, $_);
      }
    }
    self.setGTypeModule($to-parent);
  }

  method GOffice::Raw::Definitions::GOPlugin
    is also<GOPlugin>
  { $!gp }

  multi method new (
    $goffice-plugin where * ~~ GOPluginAncestry,

    :$ref = True
  ) {
    return unless $goffice-plugin;

    my $o = self.bless( :$goffice-plugin );
    $o.ref if $ref;
    $o;
  }

  method activate (CArray[GOErrorInfo] $ret_error) {
    go_plugin_activate($!gp, $ret_error);
  }

  method can_deactivate is also<can-deactivate> {
    go_plugin_can_deactivate($!gp);
  }

  has $!gp-p;

  method plugin {

    unless $!gp-p {
      my \T = class :: {
        has $!gp is built;

        method activate_plugin_list (
          GSList()            $plugins,
          CArray[GOErrorInfo] $ret_error
        )
          is also<activate-plugin-list>
        {
          go_plugin_db_activate_plugin_list($!gp, $ret_error);
        }

        method deactivate_plugin_list (
          GSList()            $plugins,
          CArray[GOErrorInfo] $ret_error
        )
          is also<deactivate-plugin-list>
        {
          go_plugin_db_deactivate_plugin_list($!gp, $ret_error);
        }

        method is_plugin_marked_for_deactivation
          is also<is-plugin-marked-for-deactivation>
        {
          so go_plugin_db_is_plugin_marked_for_deactivation($!gp);
        }

        method mark_plugin_for_deactivation (Int() $mark)
          is also<mark-plugin-for-deactivation>
        {
          my gboolean $m = $mark.so.Int;

          go_plugin_db_mark_plugin_for_deactivation($!gp, $m);
        }
      }

      $!gp-p = T.new( gp =>$!gp );
    }

    $!gp-p;
  }

  method deactivate (CArray[GOErrorInfo] $ret_error) {
    go_plugin_deactivate($!gp, $ret_error);
  }

  method get_dependencies_ids is also<get-dependencies-ids> {
    go_plugin_get_dependencies_ids($!gp);
  }

  method get_description is also<get-description> {
    go_plugin_get_description($!gp);
  }

  method get_dir_name is also<get-dir-name> {
    go_plugin_get_dir_name($!gp);
  }

  method get_id is also<get-id> {
    go_plugin_get_id($!gp);
  }

  method get_loader is also<get-loader> {
    go_plugin_get_loader($!gp);
  }

  method get_name is also<get-name> {
    go_plugin_get_name($!gp);
  }

  method get_services is also<get-services> {
    go_plugin_get_services($!gp);
  }

  method get_textdomain is also<get-textdomain> {
    go_plugin_get_textdomain($!gp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_plugin_get_type, $n, $t );
  }

  method get_type_module ( :$raw = False ) is also<get-type-module> {
    propReturnObject(
      go_plugin_get_type_module($!gp),
      $raw,
      |GLib::Object::TypeModule.getTypePair
    );
  }

  method is_active is also<is-active> {
    so go_plugin_is_active($!gp);
  }

  method is_loaded is also<is-loaded> {
    so go_plugin_is_loaded($!gp);
  }

  method load_service (
    GOPluginService     $service,
    CArray[GOErrorInfo] $ret_error
  )
    is also<load-service>
  {
    go_plugin_load_service($!gp, $service, $ret_error);
  }

  method unload_service (
    GOPluginService     $service,
    CArray[GOErrorInfo] $ret_error
  )
    is also<unload-service>
  {
    go_plugin_unload_service($!gp, $service, $ret_error);
  }

  method use_ref is also<use-ref> {
    go_plugin_use_ref($!gp);
  }

  method use_unref is also<use-unref> {
    go_plugin_use_unref($!gp);
  }

}

class GOffice::Plugins {
  also does GLib::Roles::StaticClass;

  method get_active_plugins ( :$raw = False, :glist(:$gslist) = False )
    is also<get-active-plugins>
  {
    returnGSList(
      go_plugins_get_active_plugins(),
      $raw,
      $gslist,
      |GOffice::Plugin.getTypePair
    );
  }

  method get_available_plugins ( :$raw = False, :glist(:$gslist) = False )
    is also<get-available-plugins>
  {
    returnGSList(
      go_plugins_get_available_plugins(),
      $raw,
      $gslist,
      |GOffice::Plugin.getTypePair
    );
  }

  method get_plugin_by_id ( Str() $id, :$raw = False )
    is also<get-plugin-by-id>
  {
    propReturnObject(
      go_plugins_get_plugin_by_id($id),
      $raw,
      |GOffice::Plugin.getTypePair
    );
  }

  method get_plugin_dir is also<get-plugin-dir> {
    go_plugins_get_plugin_dir();
  }

  constant GPLM = GOffice::Plugin::Loader::Module;

  multi method init (
    :$context                                           = GOCmdContext,
    :known-states(:$known_states)                       = GSList,
    :active-plugins(:$active_plugins)                   = GSList,
    :plugin-dirs(:$plugin_dirs)                         = GSList,
    :new(:activate-new-plugins(:$activate_new_plugins)) = True,
    :default-loader(:$default_loader)                   = GPLM.get_type
  ) {
    samewith(
      $context,
      $known_states,
      $active_plugins,
      $plugin_dirs,
      $activate_new_plugins,
      $default_loader
    );
  }
  multi method init (
    GOCmdContext() $context,
    GSList()       $known_states,
    GSList()       $active_plugins,
    GSList()       $plugin_dirs,
    Int()          $activate_new_plugins,
    Int()          $default_loader_type
  ) {
    my gboolean $a = $activate_new_plugins.so.Int;
    my GType    $d = $default_loader_type;

    # cw: Next step is to write a routine to a shared lib that does this
    #     in C

    go_plugins_init(
      $context,
      $known_states,
      $active_plugins,
      $plugin_dirs,
      $a,
      $d
    );
  }

  method register_loader (
    Str()             $id_str,
    GOPluginService() $service
  )
    is also<register-loader>
  {
    go_plugins_register_loader($id_str, $service);
  }

  method rescan (
    CArray[GOErrorInfo]     $ret_error,
    CArray[Pointer[GSList]] $ret_new_plugins
  ) {
    go_plugins_rescan($ret_error, $ret_new_plugins);
  }

  method shutdown {
    go_plugins_shutdown();
  }

  method unregister_loader (Str() $id) is also<unregister-loader> {
    go_plugins_unregister_loader($id);
  }

}
