use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GTK::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Series;

### /usr/src/goffice/goffice/graph/gog-series.h

sub gog_series_element_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_fill_type (GogSeries $series)
  returns GogSeriesFillType
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_fill_type_from_combo (
  GogSeries   $series,
  GtkComboBox $combo
)
  returns GogSeriesFillType
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_interpolation_params (GogSeries $series)
  returns GogDataset
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_name (GogSeries $series)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_overrides (GogSeries $series)
  returns GList
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_plot (GogSeries $series)
  returns GogPlot
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_xy_data (
  GogSeries               $series,
  CArray[CArray[gdouble]] $x,
  CArray[CArray[gdouble]] $y
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_series_get_xyz_data (
  GogSeries               $series,
  CArray[CArray[gdouble]] $x,
  CArray[CArray[gdouble]] $y,
  CArray[CArray[gdouble]] $z
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_series_has_legend (GogSeries $series)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_series_is_valid (GogSeries $series)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub gog_series_map_XL_dim (
  GogSeries    $series,
  GogMSDimType $ms_type
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_series_num_elements (GogSeries $series)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub gog_series_populate_fill_type_combo (
  GogSeries   $series,
  GtkComboBox $combo
)
  is      native(goffice)
  is      export
{ * }

sub gog_series_set_XL_dim (
  GogSeries               $series,
  GogMSDimType            $ms_type,
  GOData                  $val,
  CArray[Pointer[GError]] $err
)
  is      native(goffice)
  is      export
{ * }

sub gog_series_set_dim (
  GogSeries               $series,
  gint                    $dim_i,
  GOData                  $val,
  CArray[Pointer[GError]] $err
)
  is      native(goffice)
  is      export
{ * }

sub gog_series_set_fill_type (
  GogSeries         $series,
  GogSeriesFillType $fill_type
)
  is      native(goffice)
  is      export
{ * }

sub gog_series_set_index (
  GogSeries $series,
  gint      $ind,
  gboolean  $is_manual
)
  is      native(goffice)
  is      export
{ * }

sub gog_series_set_name (
  GogSeries               $series,
  GODataScalar            $name_src,
  CArray[Pointer[GError]] $err
)
  is      native(goffice)
  is      export
{ * }
