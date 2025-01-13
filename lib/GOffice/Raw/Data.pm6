use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Pango::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Data;

### /usr/src/goffice/goffice/data/go-data.h

sub go_data_date_conv (GOData $dat)
  returns GODateConventions
  is      native(goffice)
  is      export
{ * }

sub go_data_dup (GOData $src)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_emit_changed (GOData $dat)
  is      native(goffice)
  is      export
{ * }

sub go_data_eq (GOData $a, GOData $b)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_get_bounds (
  GOData  $data,
  gdouble $minimum is rw,
  gdouble $maximum is rw
)
  is      native(goffice)
  is      export
{ * }

sub go_data_get_matrix_markup (
  GOData $data,
  gint   $row,
  gint   $column
)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_get_matrix_size (
  GOData $data,
  gint   $n_rows is rw,
  gint   $n_columns is rw
)
  is      native(goffice)
  is      export
{ * }

sub go_data_get_matrix_string (
  GOData $data,
  gint   $row,
  gint   $column
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_get_matrix_value (
  GOData $data,
  gint   $row,
  gint   $column
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_get_n_dimensions (GOData $data)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_get_n_values (GOData $data)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_get_scalar_markup (GOData $data)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_get_scalar_string (GOData $data)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_get_scalar_value (GOData $data)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_get_values (GOData $data)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_get_vector_markup (
  GOData $data,
  gint   $column
)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_get_vector_size (GOData $data)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_get_vector_string (
  GOData $data,
  gint   $column
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_get_vector_value (
  GOData $data,
  gint   $column
)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_has_value (GOData $data)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_is_decreasing (GOData $data)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_is_increasing (GOData $data)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_is_valid (GOData $dat)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_is_varying_uniformly (GOData $data)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_columns (GODataMatrix $mat)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_markup (GODataMatrix $mat)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_minmax (
  GODataMatrix $mat,
  gdouble      $min is rw,
  gdouble      $max is rw
)
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_rows (GODataMatrix $mat)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_size (GODataMatrix $mat)
  returns GODataMatrixSize
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_str (GODataMatrix $mat)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_value (GODataMatrix $mat)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_get_values (GODataMatrix $mat)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_preferred_fmt (GOData $dat)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_get_markup (GODataScalar $val)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_get_str (GODataScalar $val)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_get_value (GODataScalar $val)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_serialize (
  GOData   $dat,
  gpointer $user
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_unserialize (
  GOData   $dat,
  Str      $str,
  gpointer $user
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_decreasing (GODataVector $vec)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_len (GODataVector $vec)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_markup (GODataVector $vec)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_minmax (
  GODataVector $vec,
  gdouble      $min is rw,
  gdouble      $max is rw
)
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_str (GODataVector $vec)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_value (GODataVector $vec)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_get_values (GODataVector $vec)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_increasing (GODataVector $vec)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_vary_uniformly (GODataVector $vec)
  returns uint32
  is      native(goffice)
  is      export
{ * }
