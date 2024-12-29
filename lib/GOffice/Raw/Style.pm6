use v6.c;

use NativeCall;

use Cairo;
use Pango::Raw::Definitions;
use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Style;

### /usr/src/goffice/goffice/utils/go-style.h

sub go_style_apply_theme (
  GOStyle     $dst,
  GOStyle     $src,
  GOStyleFlag $fields
)
  is      native(goffice)
  is      export
{ * }

sub go_style_assign (GOStyle $dst, GOStyle $src)
  is      native(goffice)
  is      export
{ * }

sub go_style_clear_auto (GOStyle $style)
  is      native(goffice)
  is      export
{ * }

sub go_style_dup (GOStyle $style)
  returns GOStyle
  is      native(goffice)
  is      export
{ * }

sub go_style_fill (
  GOStyle        $style,
  Cairo::cairo_t $cr,
  gboolean       $preserve
)
  is      native(goffice)
  is      export
{ * }

sub go_style_force_auto (GOStyle $style)
  is      native(goffice)
  is      export
{ * }

sub go_style_get_editor (
  GOStyle      $style,
  GOStyle      $default_style,
  GOCmdContext $cc,
  GObject      $object_with_style
)
  returns Pointer
  is      native(goffice)
  is      export
{ * }

sub go_style_get_marker (GOStyle $style)
  returns GOMarker
  is      native(goffice)
  is      export
{ * }

sub go_style_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_style_is_auto (GOStyle $style)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_is_different_size (GOStyle $a, GOStyle $b)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_is_fill_visible (GOStyle $style)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_is_line_visible (GOStyle $style)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_is_marker_visible (GOStyle $style)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_is_outline_visible (GOStyle $style)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_new
  returns GOStyle
  is      native(goffice)
  is      export
{ * }

sub go_style_populate_editor (
  GOStyle      $style,
  GOEditor     $editor,
  GOStyle      $default_style,
  GOCmdContext $cc,
  GObject      $object_with_style,
  gboolean     $watch_for_external_change
)
  is      native(goffice)
  is      export
{ * }

sub go_style_set_cairo_line (
  GOStyle        $style,
  Cairo::cairo_t $cr
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_style_set_fill_brightness (GOStyle $style, gdouble $brightness)
  is      native(goffice)
  is      export
{ * }

sub go_style_set_font (GOStyle $style, GOFont $font)
  is      native(goffice)
  is      export
{ * }

sub go_style_set_font_desc (
  GOStyle              $style,
  PangoFontDescription $desc
)
  is      native(goffice)
  is      export
{ * }

sub go_style_set_marker (GOStyle  $style, GOMarker $marker)
  is      native(goffice)
  is      export
{ * }

sub go_style_set_text_angle (GOStyle $style, gdouble $angle)
  is      native(goffice)
  is      export
{ * }
