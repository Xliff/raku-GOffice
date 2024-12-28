use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Canvas;

use GDK::Event;
use GTK::Layout;
#use GOffice::Doc;

our subset GocCanvasAncestry is export of Mu
  where GocCanvas | GtkLayoutAncestry;

class GOffice::Canvas is GTK::Layout {
  has GocCanvas $!gc is implementor;

  submethod BUILD ( :$goffice-canvas ) {
    self.setGocCanvas($goffice-canvas) if $goffice-canvas
  }

  method setGocCanvas (GocCanvasAncestry $_) {
    my $to-parent;

    $!gc = do {
      when GocCanvas {
        $to-parent = cast(GtkLayout, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocCanvas, $_);
      }
    }
    self.setGtkLayout($to-parent);
  }

  method GOffice::Raw::Definitions::GocCanvas
    is also<GocCanvas>
  { $!gc }

  multi method new (
    $goffice-canvas where * ~~ GocCanvasAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas;

    my $o = self.bless( :$goffice-canvas );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $goffice-canvas = self.new-object-ptr( self.get_type );

    my $o = $goffice-canvas ?? self.bless( :$goffice-canvas ) !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: int
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'height does not allow writing'
      }
    );
  }

  # Type: int
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        warn 'width does not allow writing'
      }
    );
  }

  method direction is rw is g-pseudo-property {
    Proxy.new:
      FETCH => -> $     { self.get_direction    },
      STORE => -> $, \v { self.set_direction(v) }
  }

  method document is rw  is g-pseudo-property is also<doc> {
    Proxy.new:
      FETCH => -> $     { self.get_document    },
      STORE => -> $, \v { self.set_document(v) }
  }

  method pixels_per_unit
    is rw
    is g-pseudo-property
    is also<
      pixels-per-unit
      ppu
    >
  {
    Proxy.new:
      FETCH => -> $     { self.get_pixels_per_unit    },
      STORE => -> $, \v { self.set_pixels_per_unit(v) }
  }

  multi method c2w (Num() $x, Num() $y) {
    samewith($x, $y, $, $);
  }
  multi method c2w (Num() $x, Num() $y, $X is rw, $Y is rw) {
    my gdouble ($xx, $yy) = ($x,$y);
    my gint    ($XX, $YY) = 0 xx 2;

    goc_canvas_c2w($!gc, $xx, $yy, $XX, $YY);
    ($X, $Y) = ($XX, $YY);
  }

  proto method get_bounds (|)
    is also<get-bounds>
  { * }

  multi method get_bounds {
    samewith($, $, $, $);
  }
  multi method get_bounds ($x0 is rw, $y0 is rw, $x1 is rw, $y1 is rw) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = 0e0 xx 4;

    goc_canvas_get_bounds($!gc, $xx0, $yy0, $xx1, $yy1);
    ($x0, $y0, $x1, $y1) = ($xx0, $yy0, $xx1, $yy1);
  }

  method get_cur_event ( :$raw = False )
    is also<
      get-cur-event
      cur_event
      cur-event
      current-event
      current_event
      event
    >
  {
    propReturnObject(
      goc_canvas_get_cur_event($!gc),
      $raw,
      |GDK::Event.getTypePair
    );
  }

  method get_direction ( :$enum = True ) is also<get-direction> {
    my $d = goc_canvas_get_direction($!gc);
    return $d unless $enum;
    GODirectionEnum($d);
  }

  method get_document ( :$raw = False ) is also<get-document> {
    propReturnObject(
      goc_canvas_get_document($!gc),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_grabbed_item ( :$raw = False )
    is also<
      get-grabbed-item
      grabbed-item
      grabbed_item
    >
  {
    propReturnObject(
      goc_canvas_get_grabbed_item($!gc),
      $raw,
      |GOffice::Canvas::Item.getTypePair
    );
  }

  method get_height is also<get-height> {
    goc_canvas_get_height($!gc);
  }

  method get_item_at (Num() $x, Num() $y) is also<get-item-at> {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_canvas_get_item_at($!gc, $x, $y);
  }

  method get_pixels_per_unit is also<get-pixels-per-unit> {
    goc_canvas_get_pixels_per_unit($!gc);
  }

  method get_realized
    is also<
      get-realized
      realized
    >
  {
    so goc_canvas_get_realized($!gc);
  }

  method get_root ( :$raw = False )
    is also<
      get-root
      root
    >
  {
    propReturnObject(
      goc_canvas_get_root($!gc),
      $raw,
      |GOffice::Canvas::Group.getTypePair
    );
  }

  proto method get_scroll_position (|)
    is also<get-scroll-position>
  { * }

  multi method get_scroll_position is also<scroll-position> {
    samewith($, $);
  }
  multi method get_scroll_position ($x is rw, $y is rw) {
    my gdouble ($xx, $yy) = 0e0 xx 2;

    goc_canvas_get_scroll_position($!gc, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_canvas_get_type, $n, $t );
  }

  method get_width is also<get-width> {
    goc_canvas_get_width($!gc);
  }

  method grab_item (GocItem() $item) is also<grab-item> {
    goc_canvas_grab_item($!gc, $item);
  }

  method invalidate (Num() $x0, Num() $y0, Num() $x1, Num() $y1) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_canvas_invalidate($!gc, $xx0, $yy0, $xx1, $yy1);
  }

  method invalidate_region (GocItem() $item, cairo_region_t() $region)
    is also<invalidate-region>
  {
    goc_canvas_invalidate_region($!gc, $item, $region);
  }

  method render (
    cairo_t() $cr,
    Num()     $x0,
    Num()     $y0,
    Num()     $x1,
    Num()     $y1
  ) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_canvas_render($!gc, $cr, $x0, $y0, $x1, $y1);
  }

  method scroll_to (Num() $x, Num() $y) is also<scroll-to> {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_canvas_scroll_to($!gc, $xx, $yy);
  }

  method set_direction (Int() $direction) is also<set-direction> {
    my GocDirection $d = $direction;

    goc_canvas_set_direction($!gc, $d);
  }

  method set_document (GODoc() $document) is also<set-document> {
    goc_canvas_set_document($!gc, $document);
  }

  method set_pixels_per_unit (Num() $pixels_per_unit)
    is also<set-pixels-per-unit>
  {
    my gdouble $p = $pixels_per_unit;

    goc_canvas_set_pixels_per_unit($!gc, $p);
  }

  method ungrab_item is also<ungrab-item> {
    goc_canvas_ungrab_item($!gc);
  }

  multi method w2c (Int() $X, Int() $Y) {
    samewith($X, $Y, $, $);
  }
  multi method w2c (Int() $X, Int() $Y, $x is rw, $y is rw) {
    my gint    ($XX, $YY) = ($X, $Y);
    my gdouble ($xx, $yy) = 0e0 xx 2;

    goc_canvas_w2c($!gc, $X, $Y, $xx, $yy);
    ($xx, $yy) = ($x, $y);
  }

}
