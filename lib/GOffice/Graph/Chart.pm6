use v6.c;

use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Chart;

use GLib::GSList;
use Pango::AttrList;
#use GOffice::Graph::Grid;
#use GOffice::Graph::Plot;
#use GOffice::Graph::View::Allocation;

use GOffice::Graph::OutlinedObject;

our subset GogChartAncestry is export of Mu
  where GogChart | GogOutlinedObjectAncestry;

class GOffice::Graph::Chart is GOffice::Graph::OutlinedObject {
  has GogChart $!ggc is implementor;

  submethod BUILD ( :$goffice-graph-chart ) {
    self.setGogChart($goffice-graph-chart) if $goffice-graph-chart
  }

  method setGogChart (GogChartAncestry $_) {
    my $to-parent;

    $!ggc = do {
      when GogChart {
        $to-parent = cast(GogOutlinedObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogChart, $_);
      }
    }
    self.setGogOutlinedObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogChart
    is also<GogChart>
  { $!ggc }

  multi method new (
    $goffice-graph-chart where * ~~ GogChartAncestry,

    :$ref = True
  ) {
    return unless $goffice-graph-chart;

    my $o = self.bless( :$goffice-graph-chart );
    $o.ref if $ref;
    $o;
  }

  has $!ggc-axis;
  has $!ggc-view;

  method axis_set is also<axis-set> {
    unless $!ggc-axis {
      my \T = class :: {
        has $!ggc is built;

        method assign (Int() $type) {
          my GogAxisSet $t = $type;

          gog_chart_axis_set_assign($!ggc, $t);
        }

        method get {
          $!ggc.get_axis_set;
        }

        method is_valid (Int() $type) is also<is-valid> {
          my GogAxisSet $t = $type;

          gog_chart_axis_set_is_valid($!ggc, $t);
        }
      }

      $!ggc-axis = T.new( ggc => $!ggc );
    }
    $!ggc-axis;
  }

  method foreach_elem (
    Int()     $only_visible,
              &handler,
    gpointer  $data          = gpointer,
             :$raw           = False
  )
    is also<foreach-elem>
  {
    my gboolean $ov = $only_visible.so.Int;

    my &my-handler = &handler;

    # (guint32, gpointer, Str, PangoAttrList, gpointer),
    unless $raw {
      &my-handler = SUB {
        @*ARGS[3] = Pango::AttrList.new(@*ARGS[3]);

        &handler( |@*ARGS );
      }
    }

    gog_chart_foreach_elem($!ggc, $ov, &my-handler, $data);
  }

  method get_axes (Int() $target, :$raw = False, :glist(:$gslist) = False )
    is also<get-axes>
  {
    my GogAxisType $t = $target;

    returnGSList(
      gog_chart_get_axes($!ggc, $t),
      $raw,
      $gslist,
      |GOffice::Graph::Axis.getTypePair
    );
  }

  method get_axis_set is also<get-axis-set> {
    gog_chart_get_axis_set($!ggc);
  }

  proto method get_cardinality (|)
    is also<get-cardinality>
  { * }

  multi method get_cardinality ($chart) {
    samewith($chart, $, $);
  }
  multi method get_cardinality (
    GogChart() $chart,
               $full    is rw,
               $visible is rw
  ) {
    my guint32 ($f, $v) = 0 xx 2;

    gog_chart_get_cardinality($!ggc, $f, $v);
    ($full, $visible) = ($f, $v).map( *.so );
  }

  method get_grid ( :$raw = False ) is also<get-grid> {
    propReturnObject(
      gog_chart_get_grid($!ggc),
      $raw,
      |GOffice::Graph::Grid.getTypePair
    );
  }

  method get_plot_area (GogViewAllocation() $plot_area)
    is also<get-plot-area>
  {
    gog_chart_get_plot_area($!ggc, $plot_area);
  }

  method get_plots ( :$raw = False, :glist(:$gslist) ) is also<get-plots> {
    returnGSList(
      gog_chart_get_plots($!ggc),
      $raw,
      $gslist,
      |GOffice::Graph::Plot.getTypePair
    );
  }

  proto method get_position (|)
    is also<get-position>
  { * }

  multi method get_position {
    samewith($, $, $, $);
  }
  multi method get_position ($x is rw, $y is rw, $cols is rw, $rows is rw) {
    my guint32 ($xx, $yy, $c, $r) = 0 xx 4;

    gog_chart_get_position($!ggc, $xx, $yy, $c, $r);
    ($x, $y, $cols, $rows) = ($xx, $yy, $c, $r);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &gog_chart_get_type, $n, $t );
  }

  method is_3d is also<is-3d> {
    so gog_chart_is_3d($!ggc);
  }

  method request_cardinality_update is also<request-cardinality-update> {
    gog_chart_request_cardinality_update($!ggc);
  }

  method set_plot_area (GogViewAllocation() $plot_area)
    is also<set-plot-area>
  {
    gog_chart_set_plot_area($!ggc, $plot_area);
  }

  method set_position (Int() $x, Int() $y, Int() $cols, Int() $rows)
    is also<set-position>
  {
    my gint ($xx, $yy, $c, $r) = ($x, $y, $cols, $rows);

    gog_chart_set_position($!ggc, $xx, $yy, $c, $r);
  }

  method view {
    unless $!ggc-view {
      my \T = class :: {
        has $!ggc is built;

        method get_plot_area ( :$raw = False ) is also<get-plot-area> {
          propReturnObject(
            gog_chart_view_get_plot_area($!ggc),
            $raw,
            |GOffice::Graph::View::Allocation.getTypePair
          );
        }
      }

      $!ggc-view = T.new( ggc => $!ggc );
    }

    $!ggc-view;
  }

}


# method gog_axis_set_from_str is also<gog-axis-set-from-str> {
#   gog_axis_set_from_str($!ggc);
# }
