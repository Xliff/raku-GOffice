use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Pango::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Chart;

### /usr/src/goffice/goffice/graph/gog-chart.h

sub gog_chart_axis_set_assign (GogChart $chart, GogAxisSet $type)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_chart_axis_set_is_valid (GogChart $chart, GogAxisSet $type)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_chart_foreach_elem (
  GogChart $chart,
  gboolean $only_visible,
           &handler (guint32, gpointer, Str, PangoAttrList, gpointer),
  gpointer $data
)
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_axes (GogChart $chart, GogAxisType $target)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_axis_set (GogChart $chart)
  returns GogAxisSet
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_cardinality (
  GogChart $chart,
  guint32  $full    is rw,
  guint32  $visible is rw
)
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_grid (GogChart $chart)
  returns GogGrid
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_plot_area (
  GogChart          $chart,
  GogViewAllocation $plot_area
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_plots (GogChart $chart)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_position (
  GogChart $chart,
  guint32  $x      is rw,
  guint32  $y      is rw,
  guint32  $cols   is rw,
  guint32  $rows   is rw
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_chart_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_axis_set_from_str (Str $str)
  returns GogAxisSet
  is      native(goffice)
  is      export
{ * }

sub gog_chart_is_3d (GogChart $chart)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_chart_request_cardinality_update (GogChart $chart)
  is      native(goffice)
  is      export
{ * }

sub gog_chart_set_plot_area (GogChart $chart, GogViewAllocation $plot_area)
  is      native(goffice)
  is      export
{ * }

sub gog_chart_set_position (
  GogChart $chart,
  gint     $x,
  gint     $y,
  gint     $cols,
  gint     $rows
)
  is      native(goffice)
  is      export
{ * }

sub gog_chart_view_get_plot_area (GogView $view)
  returns GogViewAllocation
  is      native(goffice)
  is      export
{ * }
