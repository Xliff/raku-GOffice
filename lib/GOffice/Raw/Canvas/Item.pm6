use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GDK::Raw::Definitions;
use GTK::Raw::Definitions;
use GOffice::Raw::Definitions;

unit package GOffice::Raw::Canvas::Item;

### /usr/src/goffice/goffice/canvas/goc-item.h

sub goc_item_bounds_changed (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_copy (
  GocItem $dest,
  GocItem $source
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_destroy (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_distance (
  GocItem         $item,
  gdouble         $x,
  gdouble         $y,
  CArray[GocItem] $near_item
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub goc_item_draw (
  GocItem $item,
  cairo_t $cr
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_draw_region (
  GocItem $item,
  cairo_t $cr,
  gdouble $x0,
  gdouble $y0,
  gdouble $x1,
  gdouble $y1
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub goc_item_duplicate (
  GocItem  $item,
  GocGroup $parent
)
  returns GocItem
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_bounds (
  GocItem $item,
  gdouble $x0 is rw,
  gdouble $y0 is rw,
  gdouble $x1 is rw,
  gdouble $y1 is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_operator (GocItem $item)
  returns cairo_operator_t
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_parent (GocItem $item)
  returns GocGroup
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_style_context (GocItem $item)
  returns GtkStyleContext
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_item_get_window (GocItem $item)
  returns GdkWindow
  is      native(goffice)
  is      export
{ * }

sub goc_item_grab (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_hide (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_invalidate (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_is_visible (GocItem $item)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub goc_item_lower (
  GocItem $item,
  gint    $n
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_lower_to_bottom (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_new (
  GocGroup $parent,
  GType    $type,
)
  returns GocItem
  is      native(goffice)
  is      export
{ * }

sub goc_item_raise (
  GocItem $item,
  gint    $n
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_raise_to_top (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_set (
  GocItem $item,
  Str     $first_arg_name
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_set_operator (
  GocItem          $item,
  cairo_operator_t $op
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_set_transform (
  GocItem        $item,
  cairo_matrix_t $m
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_set_visible (
  GocItem  $item,
  gboolean $visible
)
  is      native(goffice)
  is      export
{ * }

sub goc_item_show (GocItem $item)
  is      native(goffice)
  is      export
{ * }

sub goc_item_ungrab (GocItem $item)
  is      native(goffice)
  is      export
{ * }
