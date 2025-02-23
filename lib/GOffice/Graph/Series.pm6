use v6.c;

use NativeCall;
use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Series;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GOffice::Roles::StyledObject;
use GOffice::Roles::Graph::Dataset;

our subset GogSeriesAncestry is export of Mu
  where GogSeries | GogDataset | GOStyledObject | GObject;

class GOffice::Graph::Series {
  also does GLib::Roles::Object;
  also does GOffice::Roles::StyledObject;
  also does GOffice::Roles::Graph::Dataset;

  has GogSeries $!ggs is implementor;

  submethod BUILD ( :$goffice-graph-series ) {
    self.setGogSeries($goffice-graph-series) if $goffice-graph-series
  }

  method setGogSeries (GogSeriesAncestry $_) {
    my $to-parent;

    $!ggs = do {
      when GogSeries {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when GogDataset {
        $!ggd = $_;
        $to-parent = cast(GObject, $_);
        cast(GogSeries, $_);
      }

      when GOStyledObject {
        $!gso = $_;
        $to-parent = cast(GObject, $_);
        cast(GogSeries, $_);
      }

      default {
        $to-parent = $_;
        cast(GogSeries, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GOStyledObject;
    self.roleInit-GogDataset;
  }

  method GOffice::Raw::Definitions::GogSeries
    is also<GogSeries>
  { $!ggs }

  multi method new (
    $goffice-graph-series where * ~~ GogSeriesAncestry ,

    :$ref = True
  ) {

    return unless $goffice-graph-series;

    my $o = self.bless( :$goffice-graph-series );
    $o.ref if $ref;
    $o;
  }

  # Type: string
  method fill-type is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fill-type', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('fill-type', $gv);
      }
    );
  }

  proto method has-legend (|)
    is also<has_legend>
  { * }

  # Type: boolean
  multi method has-legend is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('has-legend', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('has-legend', $gv);
      }
    );
  }

  # Type: int
  method index is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('index', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('index', $gv);
      }
    );
  }

  # Type: string
  method interpolation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('interpolation', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('interpolation', $gv);
      }
    );
  }

  # Type: boolean
  method interpolation-skip-invalid is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('interpolation-skip-invalid', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('interpolation-skip-invalid', $gv);
      }
    );
  }

  method get_fill_type is also<get-fill-type> {
    gog_series_get_fill_type($!ggs);
  }

  method get_fill_type_from_combo (GtkComboBox() $combo)
    is also<get-fill-type-from-combo>
  {
    gog_series_get_fill_type_from_combo($!ggs, $combo);
  }

  method get_interpolation_params ( :$raw = False )
    is also<get-interpolation-params>
  {
    propReturnObject(
      gog_series_get_interpolation_params($!ggs),
      $raw,
      |GOffice::Graph::Dataset.getTypePair
    );
  }

  method get_name is also<get-name> {
    gog_series_get_name($!ggs);
  }

  method get_overrides ( :$raw = False, :gslist(:$glist) = False )
    is also<get-overrides>
  {
    returnGList(
      gog_series_get_overrides($!ggs),
      $raw,
      $glist,
      |GOffice::Series::Element.getTypePair
    );
  }

  method get_plot ( :$raw = False ) is also<get-plot> {
    propReturnObject(
      gog_series_get_plot($!ggs),
      $raw,
      |GOffice::Graph::Plot.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_series_get_type, $n, $t );
  }

  proto method get_xy_data (|)
  { * }

  multi method get_xy_data {
    samewith(
      newCArray( CArray[gdouble] ),
      newCArray( CArray[gdouble] ),
    )
  }
  multi method get_xy_data (
    CArray[CArray[gdouble]] $x,
    CArray[CArray[gdouble]] $y
  )
    is also<get-xy-data>
  {
    my gdouble ($xx, $yy) = 0e0 xx 2;
    my gint     $n        = gog_series_get_xy_data($!ggs, $x, $y);

    ($xx, $yy) = ($x, $y).map({
      CArrayToArray( ppr($_), size => $n )
    });

    [Z]($xx, $yy);
  }

  proto method get_xyz_data (|)
  { * }

  multi method get_xyz_data {
    samewith(
      newCArray( CArray[gdouble] ),
      newCArray( CArray[gdouble] ),
      newCArray( CArray[gdouble] ),
    )
  }
  multi method get_xyz_data (
    CArray[CArray[gdouble]]  $x,
    CArray[CArray[gdouble]]  $y,
    CArray[CArray[gdouble]]  $z,
                            :$single        = False
  )
    is also<get-xyz-data>
  {
    my gdouble ($xx, $yy, $zz) = 0e0 xx 2;
    my guint    $n             = gog_series_get_xyz_data($!ggs, $x, $y, $z);

    return $n unless $single;

    ($xx, $yy, $zz) = ($x, $y, $z).map({
      CArrayToArray( ppr($_), size => $n )
    });

    [Z]($xx, $yy, $zz);
  }

  multi method has-legend ( :m(:$method) is required where *.so ) {
    so gog_series_has_legend($!ggs);
  }

  method is_valid is also<is-valid> {
    so gog_series_is_valid($!ggs);
  }

  method map_XL_dim (GogMSDimType $ms_type) is also<map-XL-dim> {
    gog_series_map_XL_dim($!ggs, $ms_type);
  }

  method num_elements
    is also<
      num-elements
      elems
    >
  {
    gog_series_num_elements($!ggs);
  }

  method populate_fill_type_combo (GtkComboBox() $combo)
    is also<populate-fill-type-combo>
  {
    gog_series_populate_fill_type_combo($!ggs, $combo);
  }

  proto method set_dim (|)
    is also<set-dim>
  { * }

  multi method set_dim (
    @data,
    :l(:label(:$labels)) is required
  ) {
    use GOffice::Data::Simple;

    my $d = GOffice::Data::Vector::Str.new(@data);
    samewith(0, $d);
  }
  multi method set_dim (
    @data,
    :d(:$data) where *.so = True
  ) {
    use GOffice::Data::Simple;

    my $d = GOffice::Data::Vector::Val.new(@data);
    samewith(1, $d);
  }
  multi method set_dim (
    Int()                   $dim_i,
    GOData()                $val,
    CArray[Pointer[GError]] $err    = gerror
  ) {
    my gint $d = $dim_i;

    clear_error;
    gog_series_set_dim($!ggs, $d, $val, $err);
    set_error($err);
  }

  method set_XL_dim (
    Int()                   $ms_type,
    GOData()                $val,
    CArray[Pointer[GError]] $err       = gerror
  )
    is also<set-XL-dim>
  {
    my GogMSDimType $m = $ms_type;

    clear_error;
    gog_series_set_XL_dim($!ggs, $m, $val, $err);
    set_error($err);
  }

  method set_fill_type (Int() $fill_type) is also<set-fill-type> {
    my GogSeriesFillType $f = $fill_type;

    gog_series_set_fill_type($!ggs, $f);
  }

  method set_index (Int() $ind, Int() $is_manual) is also<set-index> {
    my gint     $i = $ind;
    my gboolean $m = $is_manual.so.Int;

    gog_series_set_index($!ggs, $i, $m);
  }

  method set_name (
    GODataScalar()          $name_src,
    CArray[Pointer[GError]] $err       = gerror
  )
    is also<set-name>
  {
    clear_error;
    gog_series_set_name($!ggs, $name_src, $err);
    set_error($err);
  }

}


  # method element_get_type {
  #   gog_series_element_get_type();
  # }
