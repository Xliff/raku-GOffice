use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Graph::Widget;

use GTK::Layout;
use GOffice::Graph;
use GOffice::Graph::Chart;

our subset GOGraphWidgetAncestry is export of Mu
  where GOGraphWidget | GtkLayoutAncestry;

class GOffice::Graph::Widget is GTK::Layout {
  has GOGraphWidget $!ggw is implementor;

  submethod BUILD ( :$goffice-graph-widget ) {
    self.setGOGraphWidget($goffice-graph-widget) if $goffice-graph-widget
  }

  method setGOGraphWidget (GOGraphWidgetAncestry $_) {
    my $to-parent;

    $!ggw = do {
      when GOGraphWidget {
        $to-parent = cast(GtkLayout, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GOGraphWidget, $_);
      }
    }
    self.setGtkLayout($to-parent);
  }

  method GOffice::Raw::Definitions::GOGraphWidget
    is also<GOGraphWidget>
  { $!ggw }

  proto method new (|)
  { * }

  multi method new (
    $goffice-graph-widget where * ~~ GOGraphWidgetAncestry ,

    :$ref = True
   ) {
    return unless $goffice-graph-widget;

    my $o = self.bless( :$goffice-graph-widget );
    $o.ref if $ref;
    $o;
  }
  multi method new ( GogGraph() $graph = GogGraph, *%a ) {
    my $goffice-graph-widget = go_graph_widget_new($graph);

    my $o = $goffice-graph-widget
      ?? self.bless( :$goffice-graph-widget )
      !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  # Type: double
  method aspect-ratio is rw  is g-property is also<aspect_ratio> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('aspect-ratio', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('aspect-ratio', $gv);
      }
    );
  }

  # Type: GogGraph ()
  method graph ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Graph.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('graph', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Graph.getTypePair
        );
      },
      STORE => -> $, GogGraph() $val is copy {
        $gv.object = $val;
        self.prop_set('graph', $gv);
      }
    );
  }

  # Type: double
  method hres is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('hres', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('hres', $gv);
      }
    );
  }

  # Type: double
  method vres is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('vres', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('vres', $gv);
      }
    );
  }

  method get_chart ( :$raw = False ) is also<get-chart> {
    propReturnObject(
      go_graph_widget_get_chart($!ggw),
      $raw,
      |GOffice::Graph::Chart.getTypePair
    )
  }

  method get_graph ( :$raw = False ) is also<get-graph> {
    propReturnObject(
      go_graph_widget_get_graph($!ggw),
      $raw,
      |GOffice::Graph.getTypePair
    )
  }

  method get_renderer ( :$raw = False ) is also<get-renderer> {
    propReturnObject(
      go_graph_widget_get_renderer($!ggw),
      $raw,
      |GOffice::Graph::Renderer.getTypePair
    )
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_graph_widget_get_type, $n, $t );
  }

  method set_size_mode (Int() $size_mode, Int() $width, Int() $height) is also<set-size-mode> {
    my GOGraphWidgetSizeMode  $s      =  $size_mode;
    my gint                  ($w, $h) = ($width, $height);

    go_graph_widget_set_size_mode($!ggw, $size_mode, $w, $h);
  }

}
