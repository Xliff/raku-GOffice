use v6.c;

use NativeCall;
use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Dataset;

use GLib::Roles::Object;

role GOffice::Roles::Graph::Dataset {
  has GogDataset $!ggd is implementor;

  method GOffice::Raw::Definitions::GogDataset
    is also<GogDataset>
  { $!ggd }

  method roleInit-GogDataset is also<roleInit_GogDataset> {
    return if $!ggd;

    my \i = findProperImplementor( self.^attributes );
    my \v = i.get_value(self);

    $!ggd = cast( GogDataset, i.get_value(self) );
  }

  method dims ($first is rw, $last is rw) {
    my gint ($f, $l) = 0 xx 2;

    gog_dataset_dims($!ggd, $f, $l);
    ($first, $last) = ($f, $l);
  }

  method dup_to_simple (GogDataset() $dst, :$raw = False)
    is also<dup-to-simple>
  {
    propReturnObject(
      gog_dataset_dup_to_simple($!ggd, $dst);
      $raw,
      |self.getTypePair
    );
  }

  method finalize {
    gog_dataset_finalize($!ggd);
  }

  method get-dim ($dim_i, :$raw = False) {
    self.get_dim($dim_i, :$raw);
  }
  method get_dim (Int() $dim_i, :$raw = False) {
    my gint $d = $dim_i;

    propReturnObject(
      gog_dataset_get_dim($!ggd, $dim_i),
      $raw,
      |GOffice::Data.getTypePair
    );
  }

  method get-elem ($dim_i) {
    self.get_dim($dim_i);
  }
  method get_elem (Int() $dim_i) {
    my gint $d = $dim_i;

    gog_dataset_get_elem($!ggd, $dim_i);
  }

  method gogdataset_get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_dataset_get_type, $n, $t );
  }

  method parent_changed (Int() $was_set) is also<parent-changed> {
    my gboolean $w = $was_set.so.Int;

    gog_dataset_parent_changed($!ggd, $w);
  }

  method set-dim ($dim_i, $val, $err = gerror) {
    self.set_dim($dim_i, $val, $err);
  }
  method set_dim (
    Int()                   $dim_i,
    GOData()                $val,
    CArray[Pointer[GError]] $err    = gerror
  ) {
    my gint $d = $dim_i;

    clear_error;
    gog_dataset_set_dim($!ggd, $d, $val, $err);
    set_error($err);
  }

  # method set_dim_internal (
  #   gint       $dim_i,
  #   GOData     $val,
  #   GogGraph   $graph
  # ) {
  #   gog_dataset_set_dim_internal($!ggd, $dim_i, $val, $graph);
  # }

}

our subset GogDatasetAncestry is export of Mu
  where GogDataset | GObject;

class GOffice::Graph::Dataset {
  also does GLib::Roles::Object;
  also does GOffice::Roles::Graph::Dataset;

  submethod BUILD ( :$goffice-graph-dataset ) {
    self.setGogDataset($goffice-graph-dataset) if $goffice-graph-dataset
  }

  method setGogDataset (GogDatasetAncestry $_) {
    my $to-parent;

    $!ggd = do {
      when GogDataset {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogDataset, $_);
      }
    }
    self!setObject($to-parent);
  }

  multi method new (
    $goffice-graph-dataset where * ~~ GogDatasetAncestry,

    :$ref = True
  ) {
    return unless $goffice-graph-dataset;

    my $o = self.bless( :$goffice-graph-dataset );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    $.gogdataset_get_type
  }
}
