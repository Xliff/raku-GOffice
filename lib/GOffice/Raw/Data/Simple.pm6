use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Data::Simple;

### /usr/src/goffice/goffice/data/go-data-simple.h

sub go_data_matrix_val_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_matrix_val_new (
  CArray[gdouble] $val,
  guint32         $n,
                  &notify (gpointer)
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_str_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_str_new (
  Str      $str,
  gboolean $needs_free
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_str_new_copy (Str $str)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_str_set_str (
  GODataScalarStr $str,
  Str             $text,
  gboolean        $needs_free
)
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_val_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_scalar_val_new (gdouble $val)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_str_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_str_new (
  CArray[Str] $str,
  guint32     $n,
              &notify (gpointer)
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_str_new_copy (CArray[Str] $str)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_str_set_translate_func (
  GODataVectorStr $vector,
                  &func (Str, gpointer --> Str),
  gpointer        $data,
                  &notify (gpointer)
)
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_str_set_translation_domain (
  GODataVectorStr $vector,
  Str             $domain
)
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_val_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_val_new (
  CArray[gdouble] $val,
  guint32         $n,
                  &notify (gpointer)
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub go_data_vector_val_new_copy (CArray[gdouble] $val)
  returns GOData
  is      native(goffice)
  is      export
{ * }
