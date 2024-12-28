use v6.c;

use GOffice::Raw::Types;
use GOffice::Raw::Canvas::Points;

use GLib::Roles::Implementor;

class GOffice::Canvas::IntArray {
  also does GLib::Roles::Implementor;
  also does Positional;

  has GocIntArray $!gia is implementor;

  submethod BUILD ( :goffice-canvas-array(:$!gia) )
  { }

  method GOffice::Raw::Structs::GocIntArray
  { $!gia }

  multi method new (GocPoints $goffice-canvas-array) {
    $goffice-canvas-array ?? self.bless( :$goffice-canvas-array ) !! Nil;
  }

  multi method new (Int() $n) {
    my guint $nn                   = $n;
    my       $goffice-canvas-array = goc_int_array_new($nn);

    $goffice-canvas-array ?? self.bless( :$goffice-canvas-array ) !! Nil
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_int_array_get_type, $n, $t );
  }

  method AT-POS (\k) {
    return Nil unless k ~~ 0 .. $!gia.elems;

    $!gia.vals[k];
  }

  method ref {
    goc_int_array_ref($!gia);
    self;
  }

  method unref {
    goc_int_array_unref($!gia);
  }
}

class GOffice::Canvas::Points {
  also does GLib::Roles::Implementor;
  also does Positional;

  has GocPoints $!gcp is implementor handles<elems points>;

  submethod BUILD ( :goffice-canvas-points(:$!gcp) )
  { }

  method GOffice::Raw::Structs::GocPoints
  { $!gcp }

  multi method new (GocPoints $goffice-canvas-points) {
    $goffice-canvas-points ?? self.bless( :$goffice-canvas-points ) !! Nil;
  }
  multi method new (@points) {
    # cw: Convert to CArray to assure type of gdouble
    my $ca = @points.map({ ArrayToCArray(gdouble, $_) });
    my $o = samewith(@points.elems);
    my $i = 0;
    # cw: Can't use a slip because it's a CArray
    $o[$i++].set( .[0], .[1] ) for @points;
    $o;
  }
  multi method new (Int() $n) {
    my guint $nn                    = $n;
    my       $goffice-canvas-points = goc_points_new($nn);

    $goffice-canvas-points ?? self.bless( :$goffice-canvas-points ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_points_get_type, $n, $t );
  }

  method point-at (Int() $n, :$raw = False) {
    my guint $nn = $n;

    return Nil unless $n ~~ 0 .. $!gcp.elems;
    propReturnObject(
      $!gcp.points[$nn],
      $raw,
      |GOffice::Canvas::Point.getTypePair
    );
  }

  method AT-POS (\k) {
    $.point-at(k);
  }

  method ref {
    goc_points_ref($!gcp);
    self;
  }

  method unref {
    goc_points_unref($!gcp);
  }
}
