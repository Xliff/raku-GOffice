use v6.c;

use Method::Also;

use NativeCall;

use Cairo;
use GLib::Raw::Traits;
use GOffice::Raw::Types;

use GOffice::Canvas::Item;

use GLib::Roles::Implementor;

our subset GocStyledItemAncestry is export of Mu
  where GocStyledItem | GocItemAncestry;

class GOffice::Canvas::StyledItem is GOffice::Canvas::Item {
  has GocStyledItem $!gsi is implementor;

  submethod BUILD ( :$goffice-styled-item ) {
    self.setGocStyledItem($goffice-styled-item) if $goffice-styled-item
  }

  method setGocStyledItem (GocStyledItemAncestry $_) {
    my $to-parent;

    $!gsi = do {
      when GocStyledItem {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocStyledItem, $_);
      }
    }
    self.setGocItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocStyledItem
  { $!gsi }

  multi method new (
    $goffice-styled-item where * ~~ GocStyledItemAncestry,

    :$ref = True
  ) {
    return unless $goffice-styled-item;

    my $o = self.bless( :$goffice-styled-item );
    $o.ref if $ref;
    $o;
  }

  method scale_line_width
    is rw
    is g-pseudo-property
    is also<scaled-line-width>
  {
    Proxy.new:
      FETCH => -> $     { self.get_scale_line_width    },
      STORE => -> $, \v { self.set_scale_line_width(v) }
  }

  # Type: GOStyle
  method style ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Style.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('style', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Style.getTypePair
        );
      },
      STORE => -> $, GOStyle() $val is copy {
        $gv.object = $val;
        self.prop_set('style', $gv);
      }
    );
  }

  method get_scale_line_width is also<get-scale-line-width> {
    goc_styled_item_get_scale_line_width($!gsi);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_styled_item_get_type, $n, $t );
  }

  method set_cairo_line (cairo_t() $cr) is also<set-cairo-line> {
    goc_styled_item_set_cairo_line($!gsi, $cr);
  }

  method set_scale_line_width (Int() $scale_line_width)
    is also<set-scale-line-width>
  {
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
