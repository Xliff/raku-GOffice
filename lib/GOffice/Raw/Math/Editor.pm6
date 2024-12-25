use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GOffice::Raw::Definitions;

unit package GOffice::Raw::Math::Editor;

### /usr/src/goffice/goffice/gtk/go-math-editor.h

sub go_math_editor_get_inline (GoMathEditor $gme)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_get_itex (GoMathEditor $gme)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_get_mathml (GoMathEditor $gme)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_new
  returns GoMathEditor
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_set_inline (
  GoMathEditor $gme,
  gboolean     $mode
)
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_set_itex (
  GoMathEditor $gme,
  Str          $text
)
  is      native(goffice)
  is      export
{ * }

sub go_math_editor_set_mathml (
  GoMathEditor $gme,
  Str          $text
)
  is      native(goffice)
  is      export
{ * }
