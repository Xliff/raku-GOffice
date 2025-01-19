use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GDK::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph;

### /usr/src/goffice/goffice/graph/gog-graph.h

sub gog_graph_dup (GogGraph $graph)
  returns GogGraph
  is      native(goffice)
  is      export
{ * }

sub gog_graph_export_image (
  GogGraph      $graph,
  GOImageFormat $format,
  GsfOutput     $output,
  gdouble       $x_dpi,
  gdouble       $y_dpi
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_data (GogGraph $graph)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_document (GogGraph $graph)
  returns GODoc
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_size (
  GogGraph $graph,
  gdouble  $width is rw,
  gdouble  $height is rw
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_supported_image_formats
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_theme (GogGraph $graph)
  returns GogTheme
  is      native(goffice)
  is      export
{ * }

sub gog_graph_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_graph_num_cols (GogGraph $graph)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_graph_num_rows (GogGraph $graph)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_graph_ref_data (
  GogGraph $graph,
  GOData   $dat
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub gog_graph_render_to_cairo (
  GogGraph        $graph,
  Cairo::cairo_t  $cairo,
  gdouble         $w,
  gdouble         $h
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_set_size (
  GogGraph $graph,
  gdouble  $width,
  gdouble  $height
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_set_theme (
  GogGraph $graph,
  GogTheme $theme
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_unref_data (
  GogGraph $graph,
  GOData   $dat
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_validate_chart_layout (GogGraph $graph)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_graph_view_get_selection (GogGraphView $gview)
  returns GogView
  is      native(goffice)
  is      export
{ * }

sub gog_graph_view_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_graph_view_handle_event (
  GogGraphView $gview,
  GdkEvent     $event,
  gdouble      $x_offset,
  gdouble      $y_offset
)
  is      native(goffice)
  is      export
{ * }

sub gog_graph_view_set_selection (
  GogGraphView $gview,
  GogObject    $gobj
)
  is      native(goffice)
  is      export
{ * }
