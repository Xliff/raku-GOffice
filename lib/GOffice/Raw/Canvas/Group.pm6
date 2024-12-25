use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;

unit package GOfffice::Raw::Canvas::Group;

### /usr/src/goffice/goffice/canvas/goc-group.h

sub goc_group_add_child (
  GocGroup $parent,
  GocItem  $item
)
  is      native(panel)
  is      export
{ * }

sub goc_group_adjust_bounds (
  GocGroup $group,
  gdouble  $x0 is rw,
  gdouble  $y0 is rw,
  gdouble  $x1 is rw,
  gdouble  $y1 is rw
)
  is      native(panel)
  is      export
{ * }

sub goc_group_adjust_coords (
  GocGroup $group,
  gdouble  $x is rw,
  gdouble  $y is rw
)
  is      native(panel)
  is      export
{ * }

sub goc_group_cairo_transform (
  GocGroup $group,
  cairo_t  $cr,
  gdouble  $x,
  gdouble  $y
)
  is      native(panel)
  is      export
{ * }

sub goc_group_clear (GocGroup $group)
  is      native(panel)
  is      export
{ * }

sub goc_group_find_child (
  GocGroup $group,
  GocItem  $item
)
  returns gint
  is      native(panel)
  is      export
{ * }

sub goc_group_freeze (
  GocGroup $group,
  gboolean $freeze
)
  is      native(panel)
  is      export
{ * }

sub goc_group_get_child (GocGroup $group)
  returns GocItem
  is      native(panel)
  is      export
{ * }

sub goc_group_get_children (GocGroup $group)
  returns GPtrArray
  is      native(panel)
  is      export
{ * }

sub goc_group_get_type
  returns GType
  is      native(panel)
  is      export
{ * }

sub goc_group_new (GocGroup $parent)
  returns GocGroup
  is      native(panel)
  is      export
{ * }

sub goc_group_remove_child (
  GocGroup $parent,
  GocItem  $item
)
  is      native(panel)
  is      export
{ * }

sub goc_group_set_clip_path (
  GocGroup          $group,
  GOPath            $clip_path,
  cairo_fill_rule_t $clip_rule
)
  is      native(panel)
  is      export
{ * }
