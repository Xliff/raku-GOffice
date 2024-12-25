use v6.c;

use NativeCall;

use GOffice::Raw::Structs;

use GOffice::Canvas::Item;

use GLib::Roles::Implementor;

class GOffice::Canvas::StyledItem is GOC::Canvas::Item {
  has GocStyledItem $!gsi is implementor;

  method get_scale_line_width {
    goc_styled_item_get_scale_line_width($!gsi);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_styled_item_get_type, $n, $t );
  }

  method set_cairo_line (cairo_t() $cr) {
    goc_styled_item_set_cairo_line($!gsi, $cr);
  }

  method set_scale_line_width (Int() $scale_line_width) {
    my gboolean $s = $scale_line_width.Int.so;

    goc_styled_item_set_scale_line_width($!gsi, $s);
  }
}

### /usr/src/goffice/goffice/canvas/goc-styled-item.h

sub goc_styled_item_get_scale_line_width (GocStyledItem $gsi)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub goc_styled_item_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_styled_item_set_cairo_line (
  GocStyledItem $gsi,
  cairo_t       $cr
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub goc_styled_item_set_scale_line_width (
  GocStyledItem $gsi,
  gboolean      $scale_line_width
)
  is      native(goffice)
  is      export
{ * }
