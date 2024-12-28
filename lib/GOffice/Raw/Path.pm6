use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Path;

### /usr/src/goffice/goffice/utils/go-path.h

sub go_path_append (GOPath $path1, GOPath $path2)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_arc (
  GOPath  $path,
  gdouble $cx,
  gdouble $cy,
  gdouble $rx,
  gdouble $ry,
  gdouble $th0,
  gdouble $th1
)
  is      native(goffice)
  is      export
{ * }

sub go_path_arc_to (
  GOPath  $path,
  gdouble $cx,
  gdouble $cy,
  gdouble $rx,
  gdouble $ry,
  gdouble $th0,
  gdouble $th1
)
  is      native(goffice)
  is      export
{ * }

sub go_path_clear (GOPath $path)
  is      native(goffice)
  is      export
{ * }

sub go_path_close (GOPath $path)
  is      native(goffice)
  is      export
{ * }

sub go_path_copy (GOPath $path)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_copy_restricted (GOPath $path, gssize $start, gssize $end)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_curve_to (
  GOPath  $path,
  gdouble $x0,
  gdouble $y0,
  gdouble $x1,
  gdouble $y1,
  gdouble $x2,
  gdouble $y2
)
  is      native(goffice)
  is      export
{ * }

sub go_path_free (GOPath $path)
  is      native(goffice)
  is      export
{ * }

sub go_path_get_options (GOPath $path)
  returns GOPathOptions
  is      native(goffice)
  is      export
{ * }

sub go_path_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_path_interpret (
  GOPath          $path,
  GOPathDirection $direction,
                  &move_to (gpointer, GOPathPoint), #- GOPathMoveToFunc
                  &line_to (gpointer, GOPathPoint), #= GOPathLineToFunc
                  &curve_to (
                    gpointer,
                    GOPathPoint,
                    GOPathPoint,
                    GOPathPoint
                  ), #=GOPathCurveToFunc
                  &close_path (gpointer),
  Pointer         $closure
)
  is      native(goffice)
  is      export
{ * }

sub go_path_interpret_full (
  GOPath          $path,
  gssize          $start,
  gssize          $end,
  GOPathDirection $direction,
                  &move_to (gpointer, GOPathPoint), #- GOPathMoveToFunc
                  &line_to (gpointer, GOPathPoint), #= GOPathLineToFunc
                  &curve_to (
                    gpointer,
                    GOPathPoint,
                    GOPathPoint,
                    GOPathPoint
                  ), #=GOPathCurveToFunc
                  &close_path (gpointer),
  Pointer         $closure
)
  is      native(goffice)
  is      export
{ * }

sub go_path_line_to (
  GOPath  $path,
  gdouble $x,
  gdouble $y
)
  is      native(goffice)
  is      export
{ * }

sub go_path_move_to (
  GOPath  $path,
  gdouble $x,
  gdouble $y
)
  is      native(goffice)
  is      export
{ * }

sub go_path_new
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_new_from_odf_enhanced_path (
  Str        $src,
  GHashTable $variables
)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_new_from_svg (Str $src)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_pie_wedge (
  GOPath  $path,
  gdouble $cx,
  gdouble $cy,
  gdouble $rx,
  gdouble $ry,
  gdouble $th0,
  gdouble $th1
)
  is      native(goffice)
  is      export
{ * }

sub go_path_rectangle (
  GOPath  $path,
  gdouble $x,
  gdouble $y,
  gdouble $width,
  gdouble $height
)
  is      native(goffice)
  is      export
{ * }

sub go_path_ref (GOPath $path)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_ring_wedge (
  GOPath  $path,
  gdouble $cx,
  gdouble $cy,
  gdouble $rx_out,
  gdouble $ry_out,
  gdouble $rx_in,
  gdouble $ry_in,
  gdouble $th0,
  gdouble $th1
)
  is      native(goffice)
  is      export
{ * }

sub go_path_scale (
  GOPath  $path,
  gdouble $scale_x,
  gdouble $scale_y
)
  returns GOPath
  is      native(goffice)
  is      export
{ * }

sub go_path_set_options (
  GOPath        $path,
  GOPathOptions $options
)
  is      native(goffice)
  is      export
{ * }

sub go_path_to_cairo (
  GOPath          $path,
  GOPathDirection $direction,
  Cairo::cairo_t  $cr
)
  is      native(goffice)
  is      export
{ * }

sub go_path_to_svg (GOPath $path)
  returns Str
  is      native(goffice)
  is      export
{ * }
