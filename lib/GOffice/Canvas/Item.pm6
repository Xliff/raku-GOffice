use v6.x;

use GOffice::Raw::Types;
use GOffice::Raw::Canvas::Item;

use GDK::Window;
use GTK::StyleContext;
use GOffice::Canvas::Group;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class GOffice::Canvas::Item {
  has GocItem $!gi implementor;

  multi method new ($arg is copy, *%a) {
    if $arg ~~ Int {
      return samewith(GocGroup, $type)
    }

    if $arg !~~ GocGroup {
      $arg .= GocGroup if $arg.^can('GocGroup');
    }
    $arg = GocGroup unless $arg;
    X::GLib::InvalidType.new(
      message => 'Argument to .new must be a GocGroup compatible object!'
    ).throw unless $arg ~~ GocGroup;
    samewith($arg, self.get_type, |%a);
  }
  multi method new (GocGroup() $parent, Int() $type, *%a) {
    my GType $t = $type;

    my $goffice-canvas-item = goc_item_new($parent, $t, Str);

    my $o = $goffice-canvas-item
      ?? self.bless( :$goffice-canvas-item )
      !! Nil;
    $o.setAttributess(%a) if $o && +%a;
    $o;
  }

  method bounds_changed {
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
    samewith($x, $y, newCArray(GocItem), :$array, :$raw);
  }
  multi method distance (
    Int()            $x,
    Int()            $y,
    CArray[GocItem]  $near_item,
                    :$raw        = False
  ) {
    my gdouble ($xx, $yy) = ($x, $y);

    goc_item_distance($!gi, $x, $y, $near_item);
    returnProperCanvasItem( ppr($near_item), $raw );
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
  ) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_item_draw_region($!gi, $cr, $xx0, $yy0, $xx1, $yy1);
  }

  method duplicate (GocGroup $parent) {
    goc_item_duplicate($!gi, $parent);
  }

  method get_bounds ($x0 is rw, $y0 is rw, $x1 is rw, $y1 is rw) {
    my gdouble ($xx0, $yy0, $xx1, $yy1) = ($x0, $y0, $x1, $y1);

    goc_item_get_bounds($!gi, $xx0, $yy0, $xx1, $yy1);
  }

  method get_operator {
    goc_item_get_operator($!gi);
  }

  method get_parent ( :$raw = False ) {
    propReturnObject(
      goc_item_get_parent($!gi),
      $raw,
      |GOffice::Canvas::Group.getTypePair
    );
  }

  method get_style_context ( :$raw = False ) {
    propReturnObject(
      goc_item_get_style_context($!gi),
      $raw,
      |GTK::StyleContext.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_item_get_type, $n, $t );
  }

  method get_window ( :$raw = False ) {
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

  method is_visible {
    goc_item_is_visible($!gi);
  }

  method lower (Int() $n) {
    my gint $nn = $n;

    goc_item_lower($!gi, $nn);
  }

  method lower_to_bottom {
    goc_item_lower_to_bottom($!gi);
  }

  method raise (Int() $n) {
    my gint $nn = $n;

    goc_item_raise($!gi, $nn);
  }

  method raise_to_top {
    goc_item_raise_to_top($!gi);
  }

  method set (Str() $first_arg_name) {
    goc_item_set($!gi, $first_arg_name);
  }

  method set_operator (Int() $op) {
    my cairo_operator_t $o = $op;

    goc_item_set_operator($!gi, $o);
  }

  method set_transform (cairo_matrix_t() $m) {
    goc_item_set_transform($!gi, $m);
  }

  method set_visible (Int() $visible) {
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

sub returnProperCanvasItem ($object is copy, :$raw = False) {
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