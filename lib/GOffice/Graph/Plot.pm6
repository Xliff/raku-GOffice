use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Graph::Plot;

use GOffice::Graph::Object;
use GOffice::Graph::Series;

our subset GogPlotAncestry is export of Mu
  where GogPlot | GObject;

class GOffice::Graph::Plot is GOffice::Graph::Object {
  has GogPlot $!ggp is implementor;

  submethod BUILD ( :$goffice-graph-plot ) {
    self.setGogPlot($goffice-graph-plot) if $goffice-graph-plot
  }

  method setGogPlot (GogPlotAncestry $_) {
    my $to-parent;

    $!ggp = do {
      when GogPlot {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogPlot, $_);
      }
    }
    self.setGogObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogPlot
  { $!ggp }

  multi method new (
    $goffice-graph-plot where * ~~ GogPlotAncestry,

    :$ref = True
  ) {
    return unless $goffice-graph-plot;

    my $o = self.bless( :$goffice-graph-plot );
    $o.ref if $ref;
    $o;
  }

  method new_by_name (Str() $name) is also<new-by-name> {
    my $goffice-graph-plot = gog_plot_new_by_name($name);

    $goffice-graph-plot ?? self.bless( :$goffice-graph-plot ) !! Nil
  }

  method new_by_type (GogPlotType $type) is also<new-by-type> {
    my $goffice-graph-plot = gog_plot_new_by_type($type);

    $goffice-graph-plot ?? self.bless( :$goffice-graph-plot ) !! Nil
  }

  has $!ggp-axis;

  # Type: uint
  method bubble-axis is rw  is g-property is also<bubble_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('bubble-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('bubble-axis', $gv);
      }
    );
  }

  # Type: uint
  method circ-axis is rw  is g-property is also<circ_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('circ-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('circ-axis', $gv);
      }
    );
  }

  # Type: uint
  method color-axis is rw  is g-property is also<color_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('color-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('color-axis', $gv);
      }
    );
  }

  # Type: string
  method guru-hints is rw  is g-property is also<guru_hints> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('guru-hints', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('guru-hints', $gv);
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

  # Type: string
  method plot-group is rw  is g-property is also<plot_group> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('plot-group', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('plot-group', $gv);
      }
    );
  }

  # Type: uint
  method pseudo_3d_axis is rw  is g-property is also<pseudo-3d-axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pseudo-3d-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('pseudo-3d-axis', $gv);
      }
    );
  }

  # Type: uint
  method radial-axis is rw  is g-property is also<radial_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('radial-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('radial-axis', $gv);
      }
    );
  }

  # Type: boolean
  method vary-style-by-element
    is rw
    is g-property
    is also<vary_style_by_element>
  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('vary-style-by-element', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('vary-style-by-element', $gv);
      }
    );
  }

  # Type: uint
  method x-axis is rw  is g-property is also<x_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('x-axis', $gv);
      }
    );
  }

  # Type: uint
  method y-axis is rw  is g-property is also<y_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('y-axis', $gv);
      }
    );
  }

  # Type: uint
  method z-axis is rw  is g-property is also<z_axis> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('z-axis', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('z-axis', $gv);
      }
    );
  }

  method axis_set is also<axis-set> {

    method axis_clear (GogAxisSet $filter) is also<axis-clear> {
      gog_plot_axis_clear($!ggp, $filter);
    }

    method axis_set_assign (GogAxisSet $type) is also<axis-set-assign> {
      gog_plot_axis_set_assign($!ggp, $type);
    }

    method axis_set_is_valid (GogAxisSet $type) is also<axis-set-is-valid> {
      gog_plot_axis_set_is_valid($!ggp, $type);
    }

    method axis_set_pref is also<axis-set-pref> {
      gog_plot_axis_set_pref($!ggp);
    }
  }

  method clear_series is also<clear-series> {
    gog_plot_clear_series($!ggp);
  }

  method description {
    gog_plot_description($!ggp);
  }

  method foreach_elem (
    gboolean  $only_visible,
              &handler,
    gpointer  $data,
             :$raw = False
  )
    is also<foreach-elem>
  {
    gog_plot_foreach_elem($!ggp, $only_visible, &handler, $data);
  }

  method get_axis (GogAxisType $type) is also<get-axis> {
    gog_plot_get_axis($!ggp, $type);
  }

  method get_axis_bounds (
    GogAxisType      $axis,
    GogPlotBoundInfo $bounds
  )
    is also<get-axis-bounds>
  {
    gog_plot_get_axis_bounds($!ggp, $axis, $bounds);
  }

  proto method get_cardinality (|)
    is also<get-cardinality>
  { * }

  multi method get_cardinality {
    samewith($, $);
  }
  multi method get_cardinality ($full is rw, $visible is rw) {
    my guint ($f, $v) = 0 xx 2;

    gog_plot_get_cardinality($!ggp, $f, $v);
    ($full, $visible) = ($f, $v);
  }

  method get_percent_value is also<get-percent-value> {
    gog_plot_get_percent_value($!ggp);
  }

  method get_series ( :$raw = False ) is also<get-series> {
    propReturnObject(
      gog_plot_get_series($!ggp),
      $raw,
      |GOffice::Graph::Series.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_plot_get_type, $n, $t );
  }

  method guru_helper is also<guru-helper> {
    gog_plot_guru_helper($!ggp);
  }

  method new_series ( :$raw = False ) is also<new-series> {
    propReturnObject(
      gog_plot_new_series($!ggp),
      $raw,
      |GOffice::Graph::Series.getTypePair
    );
  }

  method request_cardinality_update is also<request-cardinality-update> {
    gog_plot_request_cardinality_update($!ggp);
  }

  method set_axis (GogAxis() $axis) is also<set-axis> {
    gog_plot_set_axis($!ggp, $axis);
  }

  method supports_vary_style_by_element
    is also<supports-vary-style-by-element>
  {
    gog_plot_supports_vary_style_by_element($!ggp);
  }

  method update_3d is also<update-3d> {
    gog_plot_update_3d($!ggp);
  }

  method update_cardinality (Int() $index_num) is also<update-cardinality> {
    my gint $i = $index_num;

    gog_plot_update_cardinality($!ggp, $i);
  }

  method view_get_data_at_point (
    GogPlotView                $view,
    gdouble                    $x,
    gdouble                    $y,
    CArray[Pointer[GogSeries]] $series
  )
    is also<view-get-data-at-point>
  {
    gog_plot_view_get_data_at_point($view, $x, $y, $series);
  }

}
