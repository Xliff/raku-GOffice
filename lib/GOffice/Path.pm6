use v6.c;

use NativeCall;

use GOffice::Raw::Types;
use GOffice::Raw::Path;

use GLib::Roles::Implementor;

class GOffice::Path {
  has GOPath $!gop is implementor;

  submethod BUILD ( :goffice-path( :$!gop ) )
  { }

  method GOffice::Raw::Structs::GOPath
  { $!gop }

  multi method new {
    my $goffice-path = go_path_new();

    $goffice-path ?? self.bless( :$goffice-path ) !! Nil
  }

  method new_from_odf_enhanced_path (Str() $src, GHashTable() $variables) {
    my $goffice-path =  go_path_new_from_odf_enhanced_path($src, $variables);

    $goffice-path ?? self.bless( :$goffice-path ) !! Nil
  }

  method new_from_svg (Str() $src) {
    my $goffice-path = go_path_new_from_svg($src);

    $goffice-path ?? self.bless( :$goffice-path ) !! Nil
  }

  method append (GOPath() $path2, :$raw = False) {
    propReturnObject(
      go_path_append($!gop, $path2),
      $raw,
      |self.getTypePair
    );
  }

  multi method arc (
    Num()  $cx,
    Num()  $cy,
    Num()  $r,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg           = False
  ) {
    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;
    ($th0, $th1) .= map({ π / 2 - $_ });

    my ($rx, $ry) = ($r * $th0.cos, $r * $th1.sin);

    samewith($cx, $cy, $rx, $ry, $th0, $th1);
  }
  multi method arc (
    Num()  $cx,
    Num()  $cy,
    Num()  $rx,
    Num()  $ry,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg           = False
  ) {
    my gdouble ($ccx, $ccy, $rrx, $rry, $tth0, $tth1) =
      ($cx, $cy, $rx, $ry, $th0, $th1);

    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;

    go_path_arc($!gop, $ccx, $ccy, $rrx, $rry, $tth0, $tth1);
  }

  proto method arc_to (|)
  { * }

  multi method arc_to (
    Num()  $cx,
    Num()  $cy,
    Num()  $r,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg           = False
  ) {
    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;
    ($th0, $th1) .= map({ π / 2 - $_ });

    my ($rx, $ry) = ($r * $th0.cos, $r * $th1.sin);

    samewith($cx, $cy, $rx, $ry, $th0, $th1);
  }
  multi method arc_to (
    Num()  $cx,
    Num()  $cy,
    Num()  $rx,
    Num()  $ry,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg          = False
  ) {
    my gdouble ($ccx, $ccy, $rrx, $rry, $tth0, $tth1) =
      ($cx, $cy, $rx, $ry, $th0, $th1);

    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;

    go_path_arc_to($!gop, $ccx, $ccy, $rrx, $rry, $tth0, $tth1);
  }

  method clear {
    go_path_clear($!gop);
  }

  method close {
    go_path_close($!gop);
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      go_path_copy($!gop),
      $raw,
      |self.getTypePair
    )
  }

  method copy_restricted (Int() $start, Int() $end, :$raw = False) {
    my gssize ($s, $e) = ($start, $end);

    propReturnObject(
      go_path_copy_restricted($!gop, $s, $e),
      $raw,
      |self.getTypePair
    );
  }

  method curve_to (
    Num() $x0,
    Num() $y0,
    Num() $x1,
    Num() $y1,
    Num() $x2,
    Num() $y2
  ) {
    my gdouble ($xx0, $yy0, $xx1, $yy1, $xx2, $yy2) =
      ($x0, $y0, $x1, $y1, $x2, $y2);

    go_path_curve_to($!gop, $xx0, $yy0, $xx1, $yy1, $xx2, $yy2);
  }

  method free {
    go_path_free($!gop);
  }

  method get_options ( :$enum = False ) {
    my $o = go_path_get_options($!gop);
    return $o unless $enum;
    GOPathOptionsEnum($o);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &go_path_get_type, $n, $t );
  }

  method interpret (
    Int()   $direction,
            &move_to,
            &line_to,
            &curve_to,
            &close_path,
    Pointer $closure      = gpointer
  ) {
    my GOPathDirection $d = $direction;

    go_path_interpret(
      $!gop,
      $d,
      &move_to,
      &line_to,
      &curve_to,
      &close_path,
      $closure
    );
  }

  method interpret_full (
    Int()   $start,
    Int()   $end,
            &move_to,
            &line_to,
            &curve_to,
            &close_path,
    Pointer $closure      = gpointer
  ) {
    my gssize ($s, $e) = ($start, $end);

    go_path_interpret_full(
      $!gop,
      $s,
      $e,
      &move_to,
      &line_to,
      &curve_to,
      &close_path,
      $closure
    );
  }

  method line_to (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    go_path_line_to($!gop, $xx, $yy);
  }

  method move_to (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    go_path_move_to($!gop, $xx, $yy);
  }

  proto method pie_wedge (|)
  { * }

  multi method pie_wedge (
    Num()  $cx,
    Num()  $cy,
    Num()  $r,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg           = False
  ) {
    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;
    ($th0, $th1) .= map({ π / 2 - $_ });

    my ($rx, $ry) = ($r * $th0.cos, $r * $th1.sin);

    samewith($cx, $cy, $rx, $ry, $th0, $th1);
  }
  multi method pie_wedge (
    Num()  $cx,
    Num()  $cy,
    Num()  $rx,
    Num()  $ry,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg          = False
  ) {
    my gdouble ($ccx, $ccy, $rrx, $rry, $tth0, $tth1) =
     ($cx, $cy, $rx, $ry, $th0, $th1);

    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;

    go_path_pie_wedge($!gop, $ccx, $ccy, $rrx, $rry, $tth0, $tth1);
  }

  method rectangle (Num() $x, Num() $y, Num() $width, Num() $height) {
    my gdouble ($xx, $yy, $w, $h)  =  ($x, $y, $width, $height);

    go_path_rectangle($!gop, $xx, $yy, $w, $h);
  }

  method ref {
    go_path_ref($!gop);
    self;
  }

  proto method ring_wedge (|)
  { * }

  multi method ring_wedge (
    Num()  $cx,
    Num()  $cy,
    Num()  $r,
    Num()  $th0 is copy,
    Num()  $th1 is copy,
          :$deg           = False
  ) {
    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;
    ($th0, $th1) .= map({ π / 2 - $_ });

    my ($rx, $ry) = ($r * $th0.cos, $r * $th1.sin);

    samewith($cx, $cy, $rx, $ry, $th0, $th1);
  }
  multi method ring_wedge (
    Num()  $cx,
    Num()  $cy,
    Num()  $rx_out,
    Num()  $ry_out,
    Num()  $rx_in,
    Num()  $ry_in,
    Num()  $th0      is copy,
    Num()  $th1      is copy,
          :$deg               = False
  ) {
    my gdouble ($ccx, $ccy, $rxo, $ryo, $rxi, $ryi, $tth0, $tth1) =
     ($cx, $cy, $rx_out, $ry_out, $rx_in, $ry_in, $th0, $th1);

    ($th0, $th1) .= map({ $_ * π / 180 }) if $deg;

    go_path_ring_wedge(
      $!gop,
      $ccx,
      $ccy,
      $rxo,
      $ryo,
      $rxi,
      $ryi,
      $tth0,
      $tth1
    );
  }

  method scale (Num() $scale_x,Num() $scale_y) {
    my gdouble ($x, $y) = ($scale_x, $scale_y);

    go_path_scale($!gop, $x, $y);
  }

  method set_options (Int() $options) {
    my GOPathOptions $o = $options;

    go_path_set_options($!gop, $o);
  }

  method to_cairo (Int() $direction, cairo_t() $cr) {
    my GOPathDirection $d = $direction;

    go_path_to_cairo($!gop, $direction, $cr);
  }

  method to_svg {
    go_path_to_svg($!gop);
  }

}
