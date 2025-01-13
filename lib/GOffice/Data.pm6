use v6.c;

use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::Data;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GODataAncestry is export of Mu
  where GOData | GObject;

class GOffice::Data {
  also does GLib::Roles::Object;

  has GOData $!gd is implementor;

  submethod BUILD ( :$goffice-data ) {
    self.setGOData($goffice-data) if $goffice-data
  }

  method setGOData (GODataAncestry $_) {
    my $to-parent;

    $!gd = do {
      when GOData {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GOData, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Definitions::GOData
    is also<GOData>
  { $!gd }

  multi method new (
    $goffice-data where * ~~ GODataAncestry,

    :$ref = True
  ) {
    return unless $goffice-data;

    my $o = self.bless( :$goffice-data );
    $o.ref if $ref;
    $o;
  }

  method date_conv ( :$raw = False ) is also<date-conv> {
    propReturnObject(
      go_data_date_conv($!gd),
      $raw,
      |GOffice::DateConventions.getTypePair
    );
  }

  method dup ( :$raw = False ) {
    propReturnObject(
      go_data_dup($!gd),
      $raw,
      |self.getTypePair
    );
  }

  method emit_changed is also<emit-changed> {
    go_data_emit_changed($!gd);
 }

  method eq (GOData() $a, GOData() $b) {
    so go_data_eq($!gd, $b);
  }

  proto method get_bounds (|)
    is also<get-bounds>
  { * }

  multi method get_bounds {
    samewith($, $);
  }
  multi method get_bounds ($minimum is rw, $maximum is rw) {
    my gdouble ($mn, $mx) = 0e0 xx 2;

    go_data_get_bounds($!gd, $mn, $mx);
    ($minimum, $maximum) = ($mn, $mx);
  }

  method get_matrix_markup (Int() $row, Int() $column)
    is also<get-matrix-markup>
  {
    my gint ($r, $c) = ($row, $column);

    go_data_get_matrix_markup($!gd, $row, $column);
  }

  proto method get_matrix_size (|)
    is also<get-matrix-size>
  { * }

  multi method get_matrix_size {
    samewith($, $);
  }
  multi method get_matrix_size ($n_rows is rw, $n_columns is rw) {
    my gint ($r, $c) = 0 xx 2;

    go_data_get_matrix_size($!gd, $r, $c);
    ($n_rows, $n_columns) = ($r, $c)
  }

  method get_matrix_string (Int() $row, Int() $column)
    is also<get-matrix-string>
  {
    my gint ($r, $c) = ($row, $column);

    go_data_get_matrix_string($!gd, $r, $c);
  }

  method get_matrix_value (Int() $row, Int() $column)
    is also<get-matrix-value>
  {
    my gint ($r, $c) = ($row, $column);

    go_data_get_matrix_value($!gd, $row, $column);
  }

  method get_n_dimensions is also<get-n-dimensions> {
    go_data_get_n_dimensions($!gd);
  }

  method get_n_values is also<get-n-values> {
    go_data_get_n_values($!gd);
  }

  method get_scalar_markup is also<get-scalar-markup> {
    go_data_get_scalar_markup($!gd);
  }

  method get_scalar_string is also<get-scalar-string> {
    go_data_get_scalar_string($!gd);
  }

  method get_scalar_value is also<get-scalar-value> {
    go_data_get_scalar_value($!gd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_get_type, $n, $t );
  }

  method get_values is also<get-values> {
    go_data_get_values($!gd);
  }

  method get_vector_markup (Int() $column) is also<get-vector-markup> {
    my gint $c = $column;

    go_data_get_vector_markup($!gd, $c);
  }

  method get_vector_size is also<get-vector-size> {
    go_data_get_vector_size($!gd);
  }

  method get_vector_string (Int() $column) is also<get-vector-string> {
    my gint $c = $column;

    go_data_get_vector_string($!gd, $c);
  }

  method get_vector_value (Int() $column) is also<get-vector-value> {
    my gint $c = $column;

    go_data_get_vector_value($!gd, $c);
  }

  method has_value is also<has-value> {
    go_data_has_value($!gd);
  }

  method is_decreasing is also<is-decreasing> {
    so go_data_is_decreasing($!gd);
  }

  method is_increasing is also<is-increasing> {
    so go_data_is_increasing($!gd);
  }

  method is_valid is also<is-valid> {
    so go_data_is_valid($!gd);
  }

  method is_varying_uniformly is also<is-varying-uniformly> {
    so go_data_is_varying_uniformly($!gd);
  }

  method preferred_fmt is also<preferred-fmt> {
    go_data_preferred_fmt($!gd);
  }

  method serialize (gpointer $user = gpointer, :$raw = False) {
    propReturnObject(
      go_data_serialize($!gd, $user),
      $raw,
      |self.getTypePair
    );
  }

  method unserialize (Str() $str, gpointer $user = gpointer) {
    go_data_unserialize($!gd, $str, $user);
  }
}

our subset GODataMatrixAncestry is export of Mu
  where GODataMatrix | GODataAncestry;

class GOffice::Data::Matrix is GOffice::Data {
  has GODataMatrix $!gdm;

  submethod BUILD ( :$goffice-data-object ) {
    self.setGODataMatrix($goffice-data-object) if $goffice-data-object
  }

  method setGODataMatrix (GODataMatrixAncestry $_) {
    my $to-parent;

    $!gdm = do {
      when GODataMatrix {
        $to-parent = cast(GOData, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataMatrix, $_);
      }
    }
    self.setGOData($to-parent);
  }

  method GOffice::Raw::Definitions::GODataMatrix
  { $!gdm }

  multi method new (
    $goffice-data-object where * ~~ GODataMatrixAncestry,

    :$ref = True
  ) {
    return unless $goffice-data-object;

    my $o = self.bless( :$goffice-data-object );
    $o.ref if $ref;
    $o;
  }

  method get_columns is also<get-columns> {
    go_data_matrix_get_columns($!gdm);
  }

  method get_markup is also<get-markup> {
    go_data_matrix_get_markup($!gdm);
  }

  proto method get_minmax (|)
    is also<get-minmax>
  { * }

  multi method get_minmax {
    samewith($, $);
  }
  multi method get_minmax ($min is rw, $max is rw) {
    my gdouble ($mn, $mx) = 0e0 xx 2;

    go_data_matrix_get_minmax($!gdm, $min, $max);
    ($min, $max) = ($mn, $mx);
  }

  method get_rows is also<get-rows> {
    go_data_matrix_get_rows($!gdm);
  }

  method get_size is also<get-size> {
    go_data_matrix_get_size($!gdm);
  }

  method get_str is also<get-str> {
    go_data_matrix_get_str($!gdm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_matrix_get_type, $n, $t );
  }

  method get_value is also<get-value> {
    go_data_matrix_get_value($!gdm);
  }

  method get_values is also<get-values> {
    go_data_matrix_get_values($!gdm);
  }

}


our subset GODataScalarAncestry is export of Mu
  where GODataScalar | GODataAncestry;

class GOffice::Data::Scalar is GOffice::Data {
  has GODataScalar $!gds is implementor;

  submethod BUILD ( :$goffice-data-object ) {
    self.setGODataScalar($goffice-data-object) if $goffice-data-object
  }

  method setGODataScalar (GODataScalarAncestry $_) {
    my $to-parent;

    $!gds = do {
      when GODataScalar {
        $to-parent = cast(GOData, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataScalar, $_);
      }
    }
    self.setGOData($to-parent);
  }

  method GOffice::Raw::Definitions::GODataScalar
    is also<GODataScalar>
  { $!gds }

  multi method new (
    $goffice-data-object where * ~~ GODataScalarAncestry,

    :$ref = True
  ) {
    return unless $goffice-data-object;

    my $o = self.bless( :$goffice-data-object );
    $o.ref if $ref;
    $o;
  }

  method get_markup is also<get-markup> {
    go_data_scalar_get_markup($!gds);
  }

  method get_str is also<get-str> {
    go_data_scalar_get_str($!gds);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_scalar_get_type, $n, $t );
  }

  method get_value is also<get-value> {
    go_data_scalar_get_value($!gds);
  }

}


our subset GODataVectorAncestry is export of Mu
  where GODataVector | GODataAncestry;

class GOffice::Data::Vector is GOffice::Data {
  has GODataVector $!gdv is implementor;

  submethod BUILD ( :$goffice-data-object ) {
    self.setGODataVector($goffice-data-object) if $goffice-data-object
  }

  method setGODataVector (GODataVectorAncestry $_) {
    my $to-parent;

    $!gdv = do {
      when GODataVector {
        $to-parent = cast(GOData, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataVector, $_);
      }
    }
    self.setGOData($to-parent);
  }

  method GOffice::Raw::Definitions::GODataVector
    is also<GODataVector>
  { $!gdv }

  multi method new (
    $goffice-data-object where * ~~ GODataVectorAncestry,

    :$ref = True
  ) {
    return unless $goffice-data-object;

    my $o = self.bless( :$goffice-data-object );
    $o.ref if $ref;
    $o;
  }

  method decreasing {
    go_data_vector_decreasing($!gdv);
  }

  method get_len is also<get-len> {
    go_data_vector_get_len($!gdv);
  }

  method get_markup is also<get-markup> {
    go_data_vector_get_markup($!gdv);
  }

  method get_minmax ($min is rw, $max is rw) {
    my gdouble ($mn, $mx) = 0e0 xx 2;

    go_data_vector_get_minmax($!gdv, $mn, $mx);
  }

  method get_str is also<get-str> {
    go_data_vector_get_str($!gdv);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_vector_get_type, $n, $t );
  }

  method get_value is also<get-value> {
    go_data_vector_get_value($!gdv);
  }

  method get_values is also<get-values> {
    go_data_vector_get_values($!gdv);
  }

  method increasing {
    go_data_vector_increasing($!gdv);
  }

  method vary_uniformly is also<vary-uniformly> {
    go_data_vector_vary_uniformly($!gdv);
  }

}
