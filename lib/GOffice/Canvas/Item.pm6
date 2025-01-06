use v6.c;

use Method::Also;

use NativeCall;
use GOffice::Raw::Types;
use GOffice::Raw::Canvas::Item;

use GDK::Window;
use GTK::StyleContext;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

our subset GocItemAncestry is export of Mu
  where GocItem | GObject;

class GOffice::Canvas::Item {
  also does GLib::Roles::Object;

  has GocItem $!gi is implementor;

  submethod BUILD ( :$goffice-canvas-item ) {
    self.setGocItem($goffice-canvas-item) if $goffice-canvas-item
  }

  method setGocItem (GocItemAncestry $_) {
    my $to-parent;

    $!gi = do {
      when GocItem {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocItem, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Definitions::GocItem
    is also<GocItem>
  { $!gi }

  method create-pointer (GocGroup() $parent, Int() $type) {
    my GType $t = $type;

    goc_item_new($parent, $t, Str);
  }

  multi method new (GocItemAncestry $goffice-canvas-item, :$ref = True, *%a) {
    return unless $goffice-canvas-item;

    my $o = self.bless( :$goffice-canvas-item );
    $o.ref if $ref;
    return $o;
  }
  multi method new ($parent, $type, *%a) {
    my $goffice-canvas-item = self.create-pointer($parent, $type);

    my $o = $goffice-canvas-item
      ?? self.bless( :$goffice-canvas-item )
      !! Nil;
    $o.setAttributess(%a) if $o && +%a;
    $o;
  }

  method bounds_changed is also<bounds-changed> {
    goc_item_bounds_changed($!gi);
  }

  method copy (GocItem() $source, :$raw = False) {
    returnProperCanvasItem(
      goc_item_copy($!gi, $source),
      $raw,
    );
  }

  method destroy {
    goc_item_destroy($!gi);
  }

  multi method distance (
     $x,
     $y,
    :$array     = True,
    :$raw       = False
  ) {
    samewith($x, $y, GocItem.new, :$raw);
  }
  multi method distance (
    Int()      $x,
    Int()      $y,
    GocItem()  $near_item,
              :$raw        = False
  ) {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_item_distance($!gi, $x, $y, $near_item);
    returnProperCanvasItem($near_item, $raw );
  }

  method draw (cairo_t() $cr) {
    goc_item_draw($!gi, $cr);
  }

  method draw_region (
    cairo_t() $cr,
    Num()     $x0,
    Num()     $y0,
    Num()     $x1,
    Num()     $y1
  )
    is also<draw-region>
  {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_item_draw_region($!gi, $cr, $xx0, $yy0, $xx1, $yy1);
  }

  method duplicate (GocGroup $parent) {
    goc_item_duplicate($!gi, $parent);
  }

  method get_bounds ($x0 is rw, $y0 is rw, $x1 is rw, $y1 is rw)
    is also<get-bounds>
  {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_item_get_bounds($!gi, $xx0, $yy0, $xx1, $yy1);
  }

  method get_operator is also<get-operator> {
    goc_item_get_operator($!gi);
  }

  method get_parent ( :$raw = False ) is also<get-parent> {
    propReturnObject(
      goc_item_get_parent($!gi),
      $raw,
      |::('GOffice::Canvas::Group').getTypePair
    );
  }

  method get_style_context ( :$raw = False ) is also<get-style-context> {
    propReturnObject(
      goc_item_get_style_context($!gi),
      $raw,
      |GTK::StyleContext.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_item_get_type, $n, $t );
  }

  method get_window ( :$raw = False ) is also<get-window> {
    propReturnObject(
      goc_item_get_window($!gi),
      $raw,
      |GDK::Window.getTypePair
    );
  }

  method grab {
    goc_item_grab($!gi);
  }

  method hide {
    goc_item_hide($!gi);
  }

  method invalidate {
    goc_item_invalidate($!gi);
  }

  method is_visible is also<is-visible> {
    goc_item_is_visible($!gi);
  }

  method lower (Int() $n) {
    my gint $nn = $n;

    goc_item_lower($!gi, $nn);
  }

  method lower_to_bottom is also<lower-to-bottom> {
    goc_item_lower_to_bottom($!gi);
  }

  method raise (Int() $n) {
    my gint $nn = $n;

    goc_item_raise($!gi, $nn);
  }

  method raise_to_top is also<raise-to-top> {
    goc_item_raise_to_top($!gi);
  }

  method set (Str() $first_arg_name) {
    goc_item_set($!gi, $first_arg_name);
  }

  method set_operator (Int() $op) is also<set-operator> {
    my cairo_operator_t $o = $op;

    goc_item_set_operator($!gi, $o);
  }

  method set_transform (cairo_matrix_t() $m) is also<set-transform> {
    goc_item_set_transform($!gi, $m);
  }

  method set_visible (Int() $visible) is also<set-visible> {
    my gboolean $v = $visible.so.Int;

    goc_item_set_visible($!gi, $v);
  }

  method show {
    goc_item_show($!gi);
  }

  method ungrab {
    goc_item_ungrab($!gi);
  }

}

sub returnProperCanvasItem ($object is copy, :$raw = False) is export {
  return $object if $raw;

  $object = cast(GObject, $object) unless $object ~~ GObject;
  my \T = do given $object.getType {
    when ::('GOffice::Canvas::Arc').get_type        { ::('GOffice::Canvas::Arc')        }
    when ::('GOffice::Canvas::Circle').get_type     { ::('GOffice::Canvas::Circle')     }
    when ::('GOffice::Canvas::Ellipse').get_type    { ::('GOffice::Canvas::Ellipse')    }
    when ::('GOffice::Canvas::Graph').get_type      { ::('GOffice::Canvas::Graph')      }
    when ::('GOffice::Canvas::Group').get_type      { ::('GOffice::Canvas::Group')      }
    when ::('GOffice::Canvas::Image').get_type      { ::('GOffice::Canvas::Image')      }
    when ::('GOffice::Canvas::Line').get_type       { ::('GOffice::Canvas::Line')       }
    when ::('GOffice::Canvas::Path').get_type       { ::('GOffice::Canvas::Path')       }
    when ::('GOffice::Canvas::Pixbuf').get_type     { ::('GOffice::Canvas::Pixbuf')     }
    when ::('GOffice::Canvas::Polygon').get_type    { ::('GOffice::Canvas::Polygon')    }
    when ::('GOffice::Canvas::Rectangle').get_type  { ::('GOffice::Canvas::Rectangle')  }
    when ::('GOffice::Canvas::StyledItem').get_type { ::('GOffice::Canvas::StyledItem') }
    when ::('GOffice::Canvas::Text').get_type       { ::('GOffice::Canvas::Text')       }
    when ::('GOffice::Canvas::Widget').get_type     { ::('GOffice::Canvas::Widget')     }

    default {
      GOffice::Canvas::Item
    }
  }

  T.new($object);
}
