use v6.c;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Types;

use GOffice::Graph::Object;

class GOffice::Graph::Plot is GOffice::Graph::Object {
  has GogPlot $!ggp is implementor;

  has $!ggp-axis;

  # Type: uint
  method bubble-axis is rw  is g-property {
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
  method circ-axis is rw  is g-property {
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
  method color-axis is rw  is g-property {
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
  method guru-hints is rw  is g-property {
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
  method plot-group is rw  is g-property {
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
  method pseudo-3d-axis is rw  is g-property {
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
  method radial-axis is rw  is g-property {
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
  method vary-style-by-element is rw  is g-property {
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
  method x-axis is rw  is g-property {
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
  method y-axis is rw  is g-property {
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
  method z-axis is rw  is g-property {
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

  method axis_set {

    method axis_clear (GogAxisSet $filter) {
      gog_plot_axis_clear($!ggp, $filter);
    }

    method axis_set_assign (GogAxisSet $type) {
      gog_plot_axis_set_assign($!ggp, $type);
    }

    method axis_set_is_valid (GogAxisSet $type) {
      gog_plot_axis_set_is_valid($!ggp, $type);
    }

    method axis_set_pref {
      gog_plot_axis_set_pref($!ggp);
    }
  }

  method clear_series {
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
  ) {
    gog_plot_foreach_elem($!ggp, $only_visible, &handler, $data);
  }

  method get_axis (GogAxisType $type) {
    gog_plot_get_axis($!ggp, $type);
  }

  method get_axis_bounds (
    GogAxisType      $axis,
    GogPlotBoundInfo $bounds
  ) {
    gog_plot_get_axis_bounds($!ggp, $axis, $bounds);
  }

  proto method get_cardinality (|)
  { * }

  multi method get_cardinality {
    samewith($, $);
  }
  multi method get_cardinality ($full is rw, $visible is rw) {
    my guint ($f, $v) = 0 xx 2;

    gog_plot_get_cardinality($!ggp, $f, $v);
    ($full, $visible) = ($f, $v);
  }

  method get_percent_value {
    gog_plot_get_percent_value($!ggp);
  }

  method get_series ( :$raw = False ) {
    propReturnObject(
      gog_plot_get_series($!ggp),
      $raw,
      |GOffice::Graph::Series.getTypePair
    );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_plot_get_type, $n, $t );
  }

  method guru_helper {
    gog_plot_guru_helper($!ggp);
  }

  method new_by_name (

  ) {
    gog_plot_new_by_name($!ggp, $id);
  }

  method new_by_type (GogPlotType $type) {
    gog_plot_new_by_type($!ggp, $type);
  }

  method new_series {
    gog_plot_new_series($!ggp, $plot);
  }

  method request_cardinality_update {
    gog_plot_request_cardinality_update($!ggp);
  }

  method set_axis (GogAxis() $axis) {
    gog_plot_set_axis($!ggp, $axis);
  }

  method supports_vary_style_by_element {
    gog_plot_supports_vary_style_by_element($!ggp);
  }

  method update_3d {
    gog_plot_update_3d($!ggp);
  }

  method update_cardinality (
    gint    $index_num
  ) {
    gog_plot_update_cardinality($!ggp, $index_num);
  }

  method view_get_data_at_point (
    GogPlotView       $view,
    gdouble           $x,
    gdouble           $y,
    CArray[GogSeries] $series
  ) {
    gog_plot_view_get_data_at_point($!ggp, $x, $y, $series);
  }

}s
