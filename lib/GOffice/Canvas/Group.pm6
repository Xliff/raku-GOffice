use v6.c;

use GOffice::Raw::Types;
use Gffice::Raw::Canvas::Group;

use GOffice::Canvas::Item;

class GOffice::Canvas::Group is GOffice::Canvas::Item {
  has GocGroup $!gct is implementor;

  method new (GocGroup $parent = GocGroup) {
    my $goffice-canvas-group = goc_group_new($parent);

    $goffice-canvas-group ?? self.bless( :$goffice-canvas-group ) !! Nil;
  }

  method add_child (GocItem() $item) {
    goc_group_add_child($!gcg, $item);
  }

  method adjust_bounds (
    gdouble  $x0 is rw,
    gdouble  $y0 is rw,
    gdouble  $x1 is rw,
    gdouble  $y1 is rw
  ) {
    goc_group_adjust_bounds($!gcg, $x0, $y0, $x1, $y1);
  }

  method adjust_coords (
    gdouble  $x is rw,
    gdouble  $y is rw
  ) {
    goc_group_adjust_coords($!gcg, $x, $y);
  }

  method cairo_transform (
    cairo_t  $cr,
    gdouble  $x,
    gdouble  $y
  ) {
    goc_group_cairo_transform($!gcg, $cr, $x, $y);
  }

  method clear {
    goc_group_clear($!gcg);
  }

  method find_child (GocItem() $item) {

    goc_group_find_child($!gcg, $item);
  }

  method freeze (Int() $freeze) {
    my gboolean $f = $freeze.so.Int;

    goc_group_freeze($!gcg, $freeze);
  }

  method get_child {
    returnProperCanvasItem(
      goc_group_get_child($!gcg),
      $raw
    )
  }

  method get_children ( :$raw = False, :$garray = True ) {
    my $ca = goc_group_get_children($!gcg)
    return $ca if $raw;
    $ca = GLib::Array::Pointer.new($ca)
    return $ca if $garray;
    $ca.Array.map({ returnProperCanvasItem($_, False) });
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_group_get_type, $n, $t );
  }

  method remove_child (GocItem() $item) {
    goc_group_remove_child($!gcg, $item);
  }

  method set_clip_path (GOPath() $clip_path, Int() $clip_rule) {
    my cairo_fill_rule_t $c = $clip_rule;

    goc_group_set_clip_path($!gcg, $clip_path, $c);
  }

}
