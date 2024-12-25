use v6.c;

use GOffice::Raw::Types;
use GOffice::Raw::Canvas;

use GDK::Event;
use GTK::Layout;
use GOffice::Doc;

class GOffice::Canvas is GTK::Layout {
  has GocCanvas $!gc is implementor;

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
  { * }

  multi method get_bounds {
    samewith($, $, $, $);
  }
  multi method get_bounds ($x0 is rw, $y0 is rw, $x1 is rw, $y1 is rw) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = 0e0 xx 4;

    goc_canvas_get_bounds($!gc, $xx0, $yy0, $xx1, $yy1);
    ($x0, $y0, $x1, $y1) = ($xx0, $yy0, $xx1, $yy1);
  }

  method get_cur_event ( :$raw = False ) {
    propReturnObject(
      goc_canvas_get_cur_event($!gc),
      $raw,
      |GDK::Event.getTypePair
    );
  }

  method get_direction ( :$enum = True ) {
    my $d = goc_canvas_get_direction($!gc);
    return $d unless $enum;
    GoDirectionEnum($d);
  }

  method get_document ( :$raw = False ) {
    propReturnObject(
      goc_canvas_get_document($!gc),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_grabbed_item ( :$raw = False ) {
    propReturnObject(
      goc_canvas_get_grabbed_item($!gc),
      $raw,
      |GOffice::Canvas::Item.getTypePair
    );
  }

  method get_height {
    goc_canvas_get_height($!gc);
  }

  method get_item_at (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_canvas_get_item_at($!gc, $x, $y);
  }

  method get_pixels_per_unit {
    goc_canvas_get_pixels_per_unit($!gc);
  }

  method get_realized {
    so goc_canvas_get_realized($!gc);
  }

  method get_root ( :$raw = False ) {
    propReturnObject(
      goc_canvas_get_root($!gc),
      $raw,
      |GOffice::Canvas::Group.getTypePair
    );
  }

  proto method get_scroll_position (|)
  { * }

  multi method get_scroll_position {
    samewith($, $);
  }
  multi method get_scroll_position ($x is rw, $y is rw) {
    my gdouble ($xx, $yy) = 0e0 xx 2;

    goc_canvas_get_scroll_position($!gc, $xx, $yy);
    ($x, $y) = ($xx, $yy);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_canvas_get_type, $n, $t );
  }

  method get_width {
    goc_canvas_get_width($!gc);
  }

  method grab_item (GocItem() $item) {
    goc_canvas_grab_item($!gc, $item);
  }

  method invalidate (Num() $x0, Num() $y0, Num() $x1, Num() $y1) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_canvas_invalidate($!gc, $xx0, $yy0, $xx1, $yy1);
  }

  method invalidate_region (GocItem() $item, cairo_region_t() $region) {
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

  method scroll_to (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_canvas_scroll_to($!gc, $xx, $yy);
  }

  method set_direction (Int() $direction) {
    my GocDirection $d = $direction;

    goc_canvas_set_direction($!gc, $d);
  }

  method set_document (GODoc() $document) {
    goc_canvas_set_document($!gc, $document);
  }

  method set_pixels_per_unit (Num() $pixels_per_unit) {
    my gdouble $p = $pixels_per_unit;

    goc_canvas_set_pixels_per_unit($!gc, $p);
  }

  method ungrab_item {
    goc_canvas_ungrab_item($!gc);
  }

  multi method w2c (Int() $X, Int() $Y) {
    samewith($X, $y, $, $);
  }
  multi method w2c (Int() $X, Int() $Y, $x is rw, $y is rw) {
    my gint    ($XX, $YY) = ($X, $Y)
    my gdouble ($xx, $yy) = 0e0 xx 2;

    goc_canvas_w2c($!gc, $X, $Y, $xx, $yy);
    ($xx, $yy) = ($x, $y);
  }

}
