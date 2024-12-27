use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Canvas::Points;

### /usr/src/goffice/goffice/canvas/goc-utils.h

sub goc_int_array_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_int_array_new (guint $n);
  returns GocIntArray
  is      native(goffice)
  is      export
{ * }

sub goc_int_array_ref (GocIntArray $array)
  returns GocIntArray
  is      native(goffice)
  is      export
{ * }

sub goc_int_array_unref (GocIntArray $array)
  is      native(goffice)
  is      export
{ * }

sub goc_points_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_points_new (guint $n);
  returns GocPoints
  is      native(goffice)
  is      export
{ * }

sub goc_points_ref (GocPoints $points)
  returns GocPoints
  is      native(goffice)
  is      export
{ * }

sub goc_points_unref (GocPoints $points)
  is      native(goffice)
  is      export
{ * }
