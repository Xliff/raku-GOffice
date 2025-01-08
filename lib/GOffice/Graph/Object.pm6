use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Graph::Object;

use GLib::GSList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GOffice::Roles::Signals::Graph::Object;

our subset GogObjectAncestry is export of Mu
  where GogObject | GObject;

class GOffice::Graph::Object {
  also does GLib::Roles::Object;
  also does GOffice::Roles::Signals::Graph::Object;

  has GogObject $!ggo is implementor;

  submethod BUILD ( :$goffice-graph-obj ) {
    self.setGogObject($goffice-graph-obj) if $goffice-graph-obj
  }

  method setGogObject (GogObjectAncestry $_) {
    my $to-parent;

    $!ggo = do {
      when GogObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogObject, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Structs::GogObject
    is also<GogObject>
  { $!ggo }

  multi method new (
    $goffice-graph-obj where * ~~ GogObjectAncestry,

    :$ref = True
  ) {
    return unless $goffice-graph-obj;

    my $o = self.bless( :$goffice-graph-obj );
    $o.ref if $ref;
    $o;
  }

  # Type: string
  method alignment is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('alignment', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('alignment', $gv);
      }
    );
  }

  # Type: string
  method anchor is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('anchor', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('anchor', $gv);
      }
    );
  }

  # Type: string
  method compass is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('compass', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('compass', $gv);
      }
    );
  }

  # Type: uint
  method id is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('id', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('id', $gv);
      }
    );
  }

  # Type: boolean
  method invisible is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('invisible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('invisible', $gv);
      }
    );
  }

  # Type: boolean
  method is-position-manual is rw  is g-property is also<is_position_manual> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-position-manual', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-position-manual', $gv);
      }
    );
  }

  # Type: string
  method manual-size is rw  is g-property is also<manual_size> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('manual-size', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('manual-size', $gv);
      }
    );
  }

  # Type: string
  method position is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('position', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('position', $gv);
      }
    );
  }

  # Is originally:
  # GogObject *parent,  GogObject *child --> void
  method child-removed ( :$raw = False )
    is also<child_removed>
    is g-signal
  {
    self.connect-gogobject($!ggo, 'child-removed', :$raw);
  }

  # Is originally:
  # GogObject *obj,  GogObject *child --> void
  method child-name-changed ( :$raw = False )
    is also<child_name_changed>
    is g-signal
  {
    self.connect-gogobject($!ggo, 'child-name-changed', :$raw);
  }

  # Is originally:
  # GogObject *obj --> void
  method name-changed is also<name_changed> is g-signal {
    self.connect($!ggo, 'name-changed');
  }

  # Is originally:
  # GogObject *obj --> void
  method update-editor is also<update_editor> is g-signal {
    self.connect($!ggo, 'update-editor');
  }

  # Is originally:
  # GogObject *obj,  gboolean size --> void
  method changed is g-signal {
    self.connect-boolean($!ggo, 'changed');
  }

  # Is originally:
  # GogObject *obj --> void
  method children-reordered is also<children_reordered> is g-signal {
    self.connect($!ggo, 'children-reordered');
  }

  # Is originally:
  # GogObject *parent,  GogObject *child --> void
  method child-added ( :$raw = False ) is also<child_added> is g-signal {
    self.connect-gogobject($!ggo, 'child-added', :$raw);
  }

  method add_by_name (Str() $role, GogObject() $child) is also<add-by-name> {
    gog_object_add_by_name($!ggo, $role, $child);
  }

  method add_by_role ( Int() $role,GogObject() $child) is also<add-by-role> {
    my GogObjectRole $r = $role;

    gog_object_add_by_role($!ggo, $r, $child);
  }

  method can_reorder (Int() $inc_ok, Int() $dec_ok) is also<can-reorder> {
    my gboolean ($i, $d) = ($inc_ok, $dec_ok).map( *.so.Int );

    gog_object_can_reorder($!ggo, $inc_ok, $dec_ok);
  }

  method clear_parent is also<clear-parent> {
    gog_object_clear_parent($!ggo);
  }

  method document_changed (GODoc() $doc) is also<document-changed> {
    gog_object_document_changed($!ggo, $doc);
  }

  method dup (GogObject() $new_parent, &datadup = Callable, :$raw = False) {
    propReturnObject(
      gog_object_dup($!ggo, $new_parent, &datadup),
      $raw,
      |self.getTypePair
    );
  }

  method emit_changed (Int() $size) is also<emit-changed> {
    my gboolean $s = $size.so.Int;

    gog_object_emit_changed($!ggo, $s);
  }

  method find_role_by_name (Str() $role, :$raw = False)
    is static
    is also<find-role-by-name>
  {
    propReturnObject(
      gog_object_find_role_by_name($!ggo, $role),
      $raw,
      |GOffice::Graph::Object::Role.getTypePair
    );
  }

  method get_child_by_name (Str() $name, :$raw = False)
    is also<get-child-by-name>
  {
    propReturnObject(
      gog_object_get_child_by_name($!ggo, $name),
      $raw,
      |self.getTypePair
    );
  }

  method get_child_by_role (GogObjectRole() $role, :$raw = False)
    is also<get-child-by-role>
  {
    propReturnObject(
      gog_object_get_child_by_role($!ggo, $role),
      $raw,
      |self.getTypePair
    );
  }

  method get_children (
    GogObjectRole()  $filter         = GogObjectRole,
                    :$raw            = False,
                    :glist(:$gslist) = False
  )
    is also<get-children>
  {
    returnGSList(
      gog_object_get_children($!ggo, $filter),
      $raw,
      $gslist,
      |self.getTypePair
    );
  }

  method get_editor (GogDataAllocator() $dalloc, GOCmdContext() $cc)
    is also<get-editor>
  {
    gog_object_get_editor($!ggo, $dalloc, $cc);
  }

  method get_graph ( :$raw = False ) is also<get-graph> {
    propReturnObject(
      gog_object_get_graph($!ggo),
      $raw,
      |::('GOffice::Graph').getTypePair
    );
  }

  method get_id is also<get-id> {
    gog_object_get_id($!ggo);
  }

  method get_manual_allocation (
    GogViewAllocation()   $parent_allocation,
    GogViewRequisition()  $requisition,
                         :$raw                = False
  )
    is also<get-manual-allocation>
  {
    propReturnObject(
      gog_object_get_manual_allocation(
        $!ggo,
        $parent_allocation,
        $requisition
      ),
      $raw,
      |GOffice::View::Allocation.getTypePair
    );
  }

  method get_manual_position (GogViewAllocation() $pos)
    is also<get-manual-position>
  {
    gog_object_get_manual_position($!ggo, $pos);
  }

  method get_manual_size_mode is also<get-manual-size-mode> {
    gog_object_get_manual_size_mode($!ggo);
  }

  method get_name is also<get-name> {
    gog_object_get_name($!ggo);
  }

  method get_parent ( :$raw = False ) is also<get-parent> {
    propReturnObject(
      gog_object_get_parent($!ggo),
      $raw,
      |self.getTypePair
    );
  }

  method get_position_flags (Int() $mask) is also<get-position-flags> {
    my GogObjectPosition $m = $mask;

    gog_object_get_position_flags($!ggo, $m);
  }

  method get_theme ( :$raw = False ) is also<get-theme> {
    propReturnObject(
      gog_object_get_theme($!ggo),
      $raw,
      GOffice::Graph::Theme.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_object_get_type, $n, $t );
  }

  method is_default_position_flags (Str() $name)
    is also<is-default-position-flags>
  {
    so gog_object_is_default_position_flags($!ggo, $name);
  }

  method is_deletable is also<is-deletable> {
    so gog_object_is_deletable($!ggo);
  }

  method new_view (GogView() $parent = GogView, :$raw = False)
    is also<new-view>
  {
    propReturnObject(
      gog_object_new_view($!ggo, $parent),
      $raw,
      |GOffice::Graph::View.getTypePair
    );
  }

  method possible_additions is also<possible-additions> {
    gog_object_possible_additions($!ggo);
  }

  # method register_roles (
  #   GogObjectRole  $roles,
  #   gint           $n_roles
  # ) {
  #   gog_object_register_roles($!ggo, $roles, $n_roles);
  # }

  method reorder (Int() $inc, Int() $goto_max) {
    my gboolean ($i, $g) = ($inc, $goto_max).map( *.so.Int );

    gog_object_reorder($!ggo, $i, $g);
  }

  method request_editor_update is also<request-editor-update> {
    gog_object_request_editor_update($!ggo);
  }

  method request_update is also<request-update> {
    gog_object_request_update($!ggo);
  }

  method set_invisible (Int() $invisible)
    is also<set-invisible>
  {
    my gboolean $i = $invisible.so.Int;

    gog_object_set_invisible($!ggo, $i);
  }

  method set_manual_position (GogViewAllocation() $pos)
    is also<set-manual-position>
  {
    gog_object_set_manual_position($!ggo, $pos);
  }

  method set_name (Str() $name, CArray[Pointer[GError]] $err = gerror)
    is also<set-name>
  {
    clear_error;
    gog_object_set_name($!ggo, $name, $err);
    set_error($err);
  }

  method set_parent (GogObject() $parent, GogObjectRole() $role, Int() $id)
    is also<set-parent>
  {
    my gint $i = $id;

    gog_object_set_parent($!ggo, $parent, $role, $i);
  }

  method set_position_flags (Int() $flags, Int() $mask)
    is also<set-position-flags>
  {
    my GogObjectPosition ($f, $m) = ($flags, $mask);

    gog_object_set_position_flags($!ggo, $f, $m);
  }

  method update {
    gog_object_update($!ggo);
  }

}

# cw: Move to GOffice::Enums
class GOffice::Enums::ObjectRole {

  method role_get_type is also<role-get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_object_role_get_type, $n, $t );
  }

}
