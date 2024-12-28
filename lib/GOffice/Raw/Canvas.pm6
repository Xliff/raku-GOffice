use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GDK::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Canvas;

### /usr/src/goffice/goffice/canvas/goc-canvas.h

sub goc_canvas_c2w (
  GocCanvas $canvas,
  gdouble   $x,
  gdouble   $y,
  gint      $x_ is rw,
  gint      $y_ is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_bounds (
  GocCanvas $canvas,
  gdouble   $x0 is rw,
  gdouble   $y0 is rw,
  gdouble   $x1 is rw,
  gdouble   $y1 is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_cur_event (GocCanvas $canvas)
  returns GdkEvent
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_direction (GocCanvas $canvas)
  returns GocDirection
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_document (GocCanvas $canvas)
  returns GODoc
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_grabbed_item (GocCanvas $canvas)
  returns GocItem
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_height (GocCanvas $canvas)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_item_at (
  GocCanvas $canvas,
  gdouble   $x,
  gdouble   $y
)
  returns GocItem
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_pixels_per_unit (GocCanvas $canvas)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_realized (GocCanvas $canvas)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_root (GocCanvas $canvas)
  returns GocGroup
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_scroll_position (
  GocCanvas $canvas,
  gdouble   $x is rw,
  gdouble   $y is rw
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_get_width (GocCanvas $canvas)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_grab_item (
  GocCanvas $canvas,
  GocItem   $item
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_invalidate (
  GocCanvas $canvas,
  gdouble   $x0,
  gdouble   $y0,
  gdouble   $x1,
  gdouble   $y1
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_invalidate_region (
  GocCanvas             $canvas,
  GocItem               $item,
  Cairo::cairo_region_t $region
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_render (
  GocCanvas      $canvas,
  Cairo::cairo_t $cr,
  gdouble        $x0,
  gdouble        $y0,
  gdouble        $x1,
  gdouble        $y1
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_scroll_to (
  GocCanvas $canvas,
  gdouble   $x,
  gdouble   $y
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_set_direction (
  GocCanvas    $canvas,
  GocDirection $direction
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_set_document (
  GocCanvas $canvas,
  GODoc     $document
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_set_pixels_per_unit (
  GocCanvas $canvas,
  gdouble   $pixels_per_unit
)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_ungrab_item (GocCanvas $canvas)
  is      native(goffice)
  is      export
{ * }

sub goc_canvas_w2c (
  GocCanvas $canvas,
  gint      $x,
  gint      $y,
  gdouble   $x_ is rw,
  gdouble   $y_ is rw
)
  is      native(goffice)
  is      export
{ * }
