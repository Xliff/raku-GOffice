use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Canvas::Group;

### /usr/src/goffice/goffice/canvas/goc-group.h

sub goc_group_add_child (
  GocGroup $parent,
  GocItem  $item
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_adjust_bounds (
  GocGroup $group,
  gdouble  $x0 is rw,
  gdouble  $y0 is rw,
  gdouble  $x1 is rw,
  gdouble  $y1 is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_adjust_coords (
  GocGroup $group,
  gdouble  $x is rw,
  gdouble  $y is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_cairo_transform (
  GocGroup       $group,
  Cairo::cairo_t $cr,
  gdouble        $x,
  gdouble        $y
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_clear (GocGroup $group)
  is      native(goffice)
  is      export
{ * }

sub goc_group_find_child (
  GocGroup $group,
  GocItem  $item
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub goc_group_freeze (
  GocGroup $group,
  gboolean $freeze
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_get_child (GocGroup $group)
  returns GocItem
  is      native(goffice)
  is      export
{ * }

sub goc_group_get_children (GocGroup $group)
  returns GPtrArray
  is      native(goffice)
  is      export
{ * }

sub goc_group_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_group_new (GocGroup $parent)
  returns GocGroup
  is      native(goffice)
  is      export
{ * }

sub goc_group_remove_child (
  GocGroup $parent,
  GocItem  $item
)
  is      native(goffice)
  is      export
{ * }

sub goc_group_set_clip_path (
  GocGroup                 $group,
  GOPath                   $clip_path,
  Cairo::cairo_fill_rule_t $clip_rule
)
  is      native(goffice)
  is      export
{ * }
