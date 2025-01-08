use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::StyledObject;

### /usr/src/goffice/goffice/utils/go-styled-object.h

sub go_styled_object_apply_theme (GOStyledObject $gso, GOStyle $style)
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_fill (
  GOStyledObject $so,
  Cairo::cairo_t $cr,
  gboolean       $preserve
)
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_get_auto_style (GOStyledObject $gso)
  returns GOStyle
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_get_document (GOStyledObject $gso)
  returns GODoc
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_get_style (GOStyledObject $gso)
  returns GOStyle
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_set_cairo_line (
  GOStyledObject $so,
  Cairo::cairo_t $cr
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_set_style (
  GOStyledObject $gso,
  GOStyle        $style
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_styled_object_style_changed (GOStyledObject $gso)
  is      native(goffice)
  is      export
{ * }
