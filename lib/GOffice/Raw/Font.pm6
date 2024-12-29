use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Pango::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Font;

### /usr/src/goffice/goffice/utils/go-font.h

sub go_font_as_str (GOFont $font)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_font_cache_register (GClosure $callback)
  is      native(goffice)
  is      export
{ * }

sub go_font_cache_unregister (GClosure $callback)
  is      native(goffice)
  is      export
{ * }

sub go_font_eq (GOFont $a, GOFont $b)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_font_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_fonts_list_families (PangoContext $context)
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_fonts_list_sizes
  returns GSList
  is      native(goffice)
  is      export
{ * }

sub go_font_metrics_free (GOFontMetrics $metrics)
  is      native(goffice)
  is      export
{ * }

sub go_font_metrics_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_font_metrics_new (
  PangoContext $context,
  GOFont       $font
)
  returns GOFontMetrics
  is      native(goffice)
  is      export
{ * }

sub go_font_new_by_desc (PangoFontDescription $desc)
  returns GOFont
  is      native(goffice)
  is      export
{ * }

sub go_font_new_by_index (uint32 $i)
  returns GOFont
  is      native(goffice)
  is      export
{ * }

sub go_font_new_by_name (Str $str)
  returns GOFont
  is      native(goffice)
  is      export
{ * }

sub go_font_ref (GOFont $font)
  returns GOFont
  is      native(goffice)
  is      export
{ * }

sub go_font_unref (GOFont $font)
  is      native(goffice)
  is      export
{ * }
