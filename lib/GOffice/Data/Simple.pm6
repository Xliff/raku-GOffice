use v6.c;

use Method::Also;

use NativeCall;

use GOffice::Raw::Types;
use GOffice::Raw::Data::Simple;

use GOffice::Data;

use GLib::Roles::Implementor;

our subset GODataMatrixValAncestry is export of Mu
  where GODataMatrixVal | GODataMatrixAncestry;

class GOffice::Data::Matrix::Val is GOffice::Data::Matrix {
  has GODataMatrixVal $!gdmv is implementor;

  submethod BUILD ( :$goffice-matrix-val ) {
    self.setGODataMatrixVal($goffice-matrix-val) if $goffice-matrix-val
  }

  method setGODataMatrixVal (GODataMatrixValAncestry $_) {
    my $to-parent;

    $!gdmv = do {
      when GODataMatrixVal {
        $to-parent = cast(GODataMatrix, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataMatrixVal, $_);
      }
    }
    self.setGODataMatrix($to-parent);
  }

  method GOffice::Raw::Definitions::GODataMatrixVal
  { $!gdmv }

  multi method new (
    $goffice-matrix-val where * ~~ GODataMatrixValAncestry,

    :$ref = True
  ) {
    return unless $goffice-matrix-val;

    my $o = self.bless( :$goffice-matrix-val );
    $o.ref if $ref;
    $o;
  }
  multi method new (@vals) {
    samewith( ArrayToCArray(gdouble, @vals), @vals.elems );
  }
  multi method new (
    CArray[gdouble] $val,
    Int()           $n,
                    &notify = Callable
  ) {
    my guint $nn = $n;

    my $goffice-matrix-val = go_data_matrix_val_new($val, $n, &notify);

    $goffice-matrix-val ?? self.bless( :$goffice-matrix-val ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_matrix_val_get_type, $n, $t );
  }

}

our subset GODataScalarStrAncestry is export of Mu
  where GODataScalarStr | GODataScalarAncestry;

class GOffice::Data::Scalar::String is GOffice::Data::Scalar {
  has GODataScalarStr $!gdss is implementor;

  submethod BUILD ( :$goffice-scalar-str ) {
    self.setGODataScalarStr($goffice-scalar-str) if $goffice-scalar-str
  }

  method setGODataScalarStr (GODataScalarStrAncestry $_) {
    my $to-parent;

    $!gdss = do {
      when GODataScalarStr {
        $to-parent = cast(GODataScalar, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataScalarStr, $_);
      }
    }
    self.setGODataScalar($to-parent);
  }

  method GOffice::Raw::Definitions::GODataScalarStr
  { $!gdss }

  multi method new (
    $goffice-scalar-str where * ~~ GODataScalarStrAncestry,

    :$ref = True
  ) {
    return unless $goffice-scalar-str;

    my $o = self.bless( :$goffice-scalar-str );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    Str()  $str,
    Int() :free(:$needs_free) = 0
  ) {
    my gboolean $n = $needs_free.so.Int;

    my $goffice-scalar-str = go_data_scalar_str_new($str, $n);

    $goffice-scalar-str ?? self.bless( :$goffice-scalar-str ) !! Nil;
  }

  method new_copy (Str() $str, :$raw = False ) is also<new-copy> {
    my $goffice-scalar-str = go_data_scalar_str_new_copy($str);

    $goffice-scalar-str ?? self.bless( :$goffice-scalar-str ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_scalar_str_get_type, $n, $t );
  }

  method set_str (
    Str()  $text,
    Int() :free(:$needs_free) = 0
  )
    is also<set-str>
  {
    my gboolean $n = $needs_free.so.Int;

    go_data_scalar_str_set_str($!gdss, $text, $n);
  }
}

class GOffice::Data::Scalar::Str is GOffice::Data::Scalar::String
{ }

our subset GODataScalarValAncestry is export of Mu
  where GODataScalarVal | GODataScalarAncestry;

class GOffice::Data::Scalar::Val is GOffice::Data::Scalar {
  has GODataScalarVal $!gdsv is implementor;

  submethod BUILD ( :$goffice-scalar-val ) {
    self.setGODataScalarVal($goffice-scalar-val) if $goffice-scalar-val
  }

  method setGODataScalarVal (GODataScalarValAncestry $_) {
    my $to-parent;

    $!gdsv = do {
      when GODataScalarVal {
        $to-parent = cast(GODataScalar, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataScalarVal, $_);
      }
    }
    self.setGODataScalar($to-parent);
  }

  method GOffice::Raw::Definitions::GODataScalarVal
  { $!gdsv }

  multi method new (
    $goffice-scalar-val where * ~~ GODataScalarValAncestry,

    :$ref = True
  ) {
    return unless $goffice-scalar-val;

    my $o = self.bless( :$goffice-scalar-val );
    $o.ref if $ref;
    $o;
  }
  multi method new (Num() $v) {
    my $goffice-scalar-val = go_data_scalar_val_new($v);

    $goffice-scalar-val ?? self.bless( :$goffice-scalar-val ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_scalar_val_get_type, $n, $t );
  }

}

our subset GODataVectorStrAncestry is export of Mu
  where GODataVectorStr | GODataVectorAncestry;

class GOffice::Data::Vector::Str is GOffice::Data::Vector {
  has GODataVectorStr $!gdvs is implementor;

  submethod BUILD ( :$goffice-vector-str ) {
    self.setGODataVectorStr($goffice-vector-str) if $goffice-vector-str
  }

  method setGODataVectorStr (GODataVectorStrAncestry $_) {
    my $to-parent;

    $!gdvs = do {
      when GODataVectorStr {
        $to-parent = cast(GODataVector, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataVectorStr, $_);
      }
    }
    self.setGODataVector($to-parent);
  }

  method GOffice::Raw::Definitions::GODataVectorStr
  { $!gdvs }

  multi method new (
    $goffice-vector-str where * ~~ GODataVectorStrAncestry,

    :$ref = True
  ) {
    return unless $goffice-vector-str;

    my $o = self.bless( :$goffice-vector-str );
    $o.ref if $ref;
    $o;
  }


  multi method new (@strs) {
    samewith( ArrayToCArray(Str, @strs), @strs.elems );
  }
  multi method new (
    CArray[Str] $str,
    Int()       $nn,
                &notify = Callable
  ) {
    my guint $n = $nn;

    my $goffice-vector-str = go_data_vector_str_new($str, $n, &notify);

    $goffice-vector-str ?? self.bless( :$goffice-vector-str ) !! Nil;
  }

  proto method new_copy (|)
    is also<new-copy>
  { * }

  multi method new_copy (@strs) {
    samewith( ArrayToCArray(Str, @strs) );
  }
  multi method new_copy (CArray[Str] $strs, :$raw = False ) {
    my $goffice-vector-str = go_data_vector_str_new_copy($strs);

    $goffice-vector-str ?? self.bless( :$goffice-vector-str ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_vector_str_get_type, $n, $t );
  }

  method set_translate_func (
             &func,
    gpointer $data   = gpointer,
             &notify = Callable
  )
    is also<set-translate-func>
  {
    go_data_vector_str_set_translate_func($!gdvs, &func, $data, &notify);
  }

  method set_translation_domain (Str() $domain) is also<set-translation-domain> {
    go_data_vector_str_set_translation_domain($!gdvs, $domain);
  }

}

our subset GODataVectorValAncestry is export of Mu
  where GODataVectorVal | GODataVectorAncestry;

class GOffice::Data::Vector::Val is GOffice::Data::Vector {
  has GODataVectorVal $!gdvv is implementor;

  submethod BUILD ( :$goffice-vector-val ) {
    self.setGODataVectorVal($goffice-vector-val) if $goffice-vector-val
  }

  method setGODataVectorVal (GODataVectorValAncestry $_) {
    my $to-parent;

    $!gdvv = do {
      when GODataVectorVal {
        $to-parent = cast(GODataVector, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODataVectorVal, $_);
      }
    }
    self.setGODataVector($to-parent);
  }

  method GOffice::Raw::Definitions::GODataVectorVal
  { $!gdvv }

  multi method new (
    $goffice-vector-val where * ~~ GODataVectorValAncestry,

    :$ref = True
  ) {
    return unless $goffice-vector-val;

    my $o = self.bless( :$goffice-vector-val );
    $o.ref if $ref;
    $o;
  }

  multi method new (@vals) {
    samewith( ArrayToCArray(gdouble, @vals), @vals.elems );
  }
  multi method new (
    CArray[gdouble] $val,
    Int()           $nn,
                    &notify = Callable
  ) {
    my guint $n = $nn;

    my $goffice-vector-val = go_data_vector_val_new($val, $n, &notify);

    $goffice-vector-val ?? self.bless( :$goffice-vector-val ) !! Nil;
  }

  proto method new_copy (|)
    is also<new-copy>
  { * }

  multi method new_copy (@vals) {
    samewith( ArrayToCArray(num64, @vals) );
  }
  multi method new_copy (CArray[num64] $vals) {
    my $goffice-vector-val = go_data_vector_val_new_copy($vals);

    $goffice-vector-val ?? self.bless( :$goffice-vector-val ) !! Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_data_vector_val_get_type, $n, $t );
  }

}
