use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Object;

### /usr/src/goffice/goffice/graph/gog-object.h

sub gog_object_add_by_name (
  GogObject $parent,
  Str       $role,
  GogObject $child
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_add_by_role (
  GogObject     $parent,
  GogObjectRole $role,
  GogObject     $child
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_can_reorder (
  GogObject $obj,
  gboolean  $inc_ok,
  gboolean  $dec_ok
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_clear_parent (GogObject $obj)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_document_changed (
  GogObject $obj,
  GODoc     $doc
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_dup (
  GogObject $src,
  GogObject $new_parent,
            &datadup (GogDataset, GogDataset)
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_emit_changed (
  GogObject $obj,
  gboolean  $size
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_find_role_by_name (
  GogObject $obj,
  Str       $role
)
  returns GogObjectRole
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_child_by_name (
  GogObject $obj,
  Str       $name
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_child_by_role (
  GogObject     $obj,
  GogObjectRole $role
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_children (
  GogObject     $obj,
  GogObjectRole $filter
)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_editor (
  GogObject        $obj,
  GogDataAllocator $dalloc,
  GOCmdContext     $cc
)
  returns Pointer
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_graph (GogObject $obj)
  returns GogGraph
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_id (GogObject $obj)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_manual_allocation (
  GogObject          $gobj,
  GogViewAllocation  $parent_allocation,
  GogViewRequisition $requisition
)
  returns GogViewAllocation
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_manual_position (
  GogObject         $obj,
  GogViewAllocation $pos
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_manual_size_mode (GogObject $obj)
  returns GogManualSizeMode
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_name (GogObject $obj)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_parent (GogObject $obj)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_position_flags (
  GogObject         $obj,
  GogObjectPosition $mask
)
  returns GogObjectPosition
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_theme (GogObject $obj)
  returns GogTheme
  is      native(goffice)
  is      export
{ * }

sub gog_object_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_object_is_default_position_flags (
  GogObject $obj,
  Str       $name
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_is_deletable (GogObject $obj)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_new_view (
  GogObject $obj,
  GogView   $parent
)
  returns GogView
  is      native(goffice)
  is      export
{ * }

sub gog_object_possible_additions (GogObject $parent)
  returns GSList
  is      native(goffice)
  is      export
{ * }

# cw: To be provided with ::Class package
# sub gog_object_register_roles (
#   GogObjectClass $klass,
#   GogObjectRole  $roles,
#   gint           $n_roles
# )
#   is      native(goffice)
#   is      export
# { * }

sub gog_object_reorder (
  GogObject $obj,
  gboolean  $inc,
  gboolean  $goto_max
)
  returns GogObject
  is      native(goffice)
  is      export
{ * }

sub gog_object_request_editor_update (GogObject $obj)
  is      native(goffice)
  is      export
{ * }

sub gog_object_request_update (GogObject $obj)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_role_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_object_set_invisible (
  GogObject $obj,
  gboolean  $invisible
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_set_manual_position (
  GogObject         $obj,
  GogViewAllocation $pos
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_set_name (
  GogObject               $obj,
  Str                     $name,
  CArray[Pointer[GError]] $err
)
  is      native(goffice)
  is      export
{ * }

sub gog_object_set_parent (
  GogObject     $child,
  GogObject     $parent,
  GogObjectRole $role,
  gint          $id
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_set_position_flags (
  GogObject         $obj,
  GogObjectPosition $flags,
  GogObjectPosition $mask
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_object_update (GogObject $obj)
  is      native(goffice)
  is      export
{ * }
