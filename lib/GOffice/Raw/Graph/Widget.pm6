use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Widget;

### /usr/src/goffice/goffice/gtk/go-graph-widget.h

sub go_graph_widget_get_chart (GOGraphWidget $widget)
  returns GogChart
  is      native(goffice)
  is      export
{ * }

sub go_graph_widget_get_graph (GOGraphWidget $widget)
  returns GogGraph
  is      native(goffice)
  is      export
{ * }

sub go_graph_widget_get_renderer (GOGraphWidget $widget)
  returns GogRenderer
  is      native(goffice)
  is      export
{ * }

sub go_graph_widget_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_graph_widget_new (GogGraph $graph)
  returns GOGraphWidget
  is      native(goffice)
  is      export
{ * }

sub go_graph_widget_set_size_mode (
  GOGraphWidget         $widget,
  GOGraphWidgetSizeMode $size_mode,
  gint                  $width,
  gint                  $height
)
  is      native(goffice)
  is      export
{ * }
