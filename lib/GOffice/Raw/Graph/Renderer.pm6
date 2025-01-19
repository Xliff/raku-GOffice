use v6.c;

use NativeCall;

use GDK::Raw::Definitions;
use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Renderer;

### /usr/src/goffice/goffice/graph/gog-renderer.h

sub gog_renderer_draw_circle (
  GogRenderer $rend,
  gdouble     $x,
  gdouble     $y,
  gdouble     $r
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_color_map (
  GogRenderer       $rend,
  GogAxisColorMap   $map,
  gint              $discrete,
  gboolean          $horizontal,
  GogViewAllocation $rect
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_data_label (
  GogRenderer       $rend,
  GogSeriesLabelElt $elt,
  GogViewAllocation $pos,
  GOAnchorType      $anchor,
  GOStyle           $legend_style
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_equation (
  GogRenderer $renderer,
  LsmDomView  $mathml_view,
  gdouble     $x,
  gdouble     $y
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_gostring (
  GogRenderer       $rend,
  GOString          $str,
  GogViewAllocation $pos,
  GOAnchorType      $anchor,
  GoJustification   $justification,
  gdouble           $width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_grip (
  GogRenderer $renderer,
  gdouble     $x,
  gdouble     $y
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_marker (
  GogRenderer $rend,
  gdouble     $x,
  gdouble     $y
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_rectangle (
  GogRenderer       $rend,
  GogViewAllocation $rect
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_rotated_rectangle (
  GogRenderer       $rend,
  GogViewAllocation $rect,
  gboolean          $rotate_bg
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_selection_rectangle (
  GogRenderer       $renderer,
  GogViewAllocation $rectangle
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_shape (
  GogRenderer $renderer,
  GOPath      $path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_draw_text (
  GogRenderer       $rend,
  Str               $text,
  GogViewAllocation $pos,
  GOAnchorType      $anchor,
  gboolean          $use_markup,
  GoJustification   $justification,
  gdouble           $width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_export_image (
  GogRenderer   $renderer,
  GOImageFormat $format,
  GsfOutput     $output,
  gdouble       $x_dpi,
  gdouble       $y_dpi
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_fill_circle (
  GogRenderer $rend,
  gdouble     $x,
  gdouble     $y,
  gdouble     $r
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_fill_rectangle (
  GogRenderer       $rend,
  GogViewAllocation $rect
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_fill_serie (
  GogRenderer $renderer,
  GOPath      $path,
  GOPath      $close_path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_fill_shape (
  GogRenderer $renderer,
  GOPath      $path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_cairo_surface (GogRenderer $renderer)
  returns cairo_surface_t
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_gostring_AABR (
  GogRenderer    $rend,
  GOString       $str,
  GOGeometryAABR $aabr,
  gdouble        $max_width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_gostring_OBR (
  GogRenderer   $rend,
  GOString      $str,
  GOGeometryOBR $obr,
  gdouble       $max_width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_hairline_width_pts (GogRenderer $rend)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_pixbuf (GogRenderer $renderer)
  returns GdkPixbuf
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_scale (GogRenderer $renderer)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_text_AABR (
  GogRenderer    $rend,
  Str            $text,
  gboolean       $use_markup,
  GOGeometryAABR $aabr,
  gdouble        $max_width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_text_OBR (
  GogRenderer   $rend,
  Str           $text,
  gboolean      $use_markup,
  GOGeometryOBR $obr,
  gdouble       $max_width
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_line_size (
  GogRenderer $r,
  gdouble     $width
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_new (GogGraph $graph)
  returns GogRenderer
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_pop_clip (GogRenderer $rend)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_pop_style (GogRenderer $rend)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_pt2r (
  GogRenderer $r,
  gdouble     $d
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_pt2r_x (
  GogRenderer $r,
  gdouble     $d
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_pt2r_y (
  GogRenderer $r,
  gdouble     $d
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_push_clip (
  GogRenderer $rend,
  GOPath      $path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_push_clip_rectangle (
  GogRenderer $rend,
  gdouble     $x,
  gdouble     $y,
  gdouble     $w,
  gdouble     $h
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_push_style (
  GogRenderer $rend,
  GOStyle     $style
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_render_to_cairo (
  GogRenderer $renderer,
  cairo_t     $cairo,
  gdouble     $width,
  gdouble     $height
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_request_update (GogRenderer $renderer)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_stroke_circle (
  GogRenderer $rend,
  gdouble     $x,
  gdouble     $y,
  gdouble     $r
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_stroke_rectangle (
  GogRenderer       $rend,
  GogViewAllocation $rect
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_stroke_serie (
  GogRenderer $renderer,
  GOPath      $path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_stroke_shape (
  GogRenderer $renderer,
  GOPath      $path
)
  is      native(goffice)
  is      export
{ * }

sub gog_renderer_update (
  GogRenderer $renderer,
  gdouble     $w,
  gdouble     $h
)
  returns uint32
  is      native(goffice)
  is      export
{ * }
