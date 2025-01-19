use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use GOffice::Raw::Types;
use GOffice::Raw::Graph;

use GLib::GSList;
use GOffice::Doc;
use GOffice::Graph::OutlinedObject;

use GLib::Roles::Implementor;

our subset GogGraphAncestry is export of Mu
  where GogGraph | GogOutlinedObjectAncestry;

class GOffice::Graph is GOffice::Graph::OutlinedObject {
  has GogGraph $!gg is implementor;

  submethod BUILD ( :$goffice-graph-oo ) {
    self.setGogGraph($goffice-graph-oo) if $goffice-graph-oo
  }

  method setGogGraph (GogGraphAncestry $_) {
    my $to-parent;

    $!gg = do {
      when GogGraph {
        $to-parent = cast(GogOutlinedObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogGraph, $_);
      }
    }
    self.setGogOutlinedObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogGraph
    is also<GogGraph>
  { $!gg }

  multi method new (
    $goffice-graph-oo where * ~~ GogGraphAncestry ,

    :$ref = True
  ) {
    return unless $goffice-graph-oo;

    my $o = self.bless( :$goffice-graph-oo );
    $o.ref if $ref;
    $o;
  }

  # Type: GODoc
  method document ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Doc.get-type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('document', $gv);
        propReturnObject(
          $gv.object,
          |GOffice::Doc.getTypePair
        );
      },
      STORE => -> $, GODoc() $val is copy {
        $gv.object = $val;
        self.prop_set('document', $gv);
      }
    );
  }

  # Type: double
  method height-pts is rw  is g-property is also<height_pts> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height-pts', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height-pts', $gv);
      }
    );
  }

  # Type: GogRenderer
  method renderer is rw  is g-property {
    my $gv = GLib::Value.new( Goffice::Graph::Renderer.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'renderer does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, GogRenderer() $val is copy {
        $gv.object = $val;
        self.prop_set('renderer', $gv);
      }
    );
  }

  # Type: GogTheme
  method theme ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Graph::Theme.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('theme', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Theme.getTypePair
        );
      },
      STORE => -> $, GogTheme() $val is copy {
        $gv.object = $val;
        self.prop_set('theme', $gv);
      }
    );
  }

  # Type: string
  method theme-name is rw  is g-property is also<theme_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('theme-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('theme-name', $gv);
      }
    );
  }

  # Type: double
  method width-pts is rw  is g-property is also<width_pts> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width-pts', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width-pts', $gv);
      }
    );
  }

  method dup ( :$raw = False ) {
    propReturnObject(
      gog_graph_dup($!gg),
      $raw,
      |self.getTypePair
    );
  }

  method export_image (
    Int()       $format,
    GsfOutput() $output,
    Num()       $x_dpi,
    Num()       $y_dpi
  )
    is also<export-image>
  {
    my GOImageFormat  $f      =  $format;
    my gdouble       ($x, $y) = ($x_dpi, $y_dpi);

    gog_graph_export_image($!gg, $f, $output, $x_dpi, $y_dpi);
  }

  method get_data ( :$raw = False ) is also<get-data> {
    propReturnObject(
      gog_graph_get_data($!gg),
      $raw,
      |self.getTypePair
    );
  }

  method get_document ( :$raw = False ) is also<get-document> {
    propReturnObject(
      gog_graph_get_document($!gg),
      $raw,
      |self.getTypePair
    );
  }

  proto method get_size (|)
    is also<get-size>
  { * }

  multi method get_size {
    samewith($, $);
  }
  multi method get_size ($width is rw, $height is rw) {
    my gdouble ($ww, $hh) = 0e0 xx 2;

    gog_graph_get_size($!gg, $ww, $hh);
    ($ww, $hh) = ($width, $height);
  }

  method get_supported_image_formats (
    :$raw            = False,
    :gslist(:$glist) = False
  )
    is static
    is also<get-supported-image-formats>
  {
    returnGSList(
      gog_graph_get_supported_image_formats(),
      $raw,
      $glist,
      |GOffice::ImageFormat.getTypePair
    )
  }

  method get_theme ( :$raw = False ) is also<get-theme> {
    propReturnObject(
      gog_graph_get_theme($!gg),
      $raw,
      |GOffice::Graph::Theme.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_graph_get_type, $n, $t );
  }

  method num_cols is also<num-cols> {
    gog_graph_num_cols($!gg);
  }

  method num_rows is also<num-rows> {
    gog_graph_num_rows($!gg);
  }

  method ref_data (GOData() $dat) is also<ref-data> {
    gog_graph_ref_data($!gg, $dat);
  }

  method render_to_cairo (cairo_t() $cairo, Num() $w, Num() $h)
    is also<render-to-cairo> {
    my gdouble ($ww, $hh) = ($w, $h);

    gog_graph_render_to_cairo($!gg, $cairo, $w, $h);
  }

  method set_size (Num() $width, Num() $height) is also<set-size> {
    my gdouble ($w, $h) = ($width, $height);

    gog_graph_set_size($!gg, $w, $h);
  }

  method set_theme (GogTheme() $theme) is also<set-theme> {
    gog_graph_set_theme($!gg, $theme);
  }

  method unref_data (GOData() $dat) is also<unref-data> {
    gog_graph_unref_data($!gg, $dat);
  }

  method validate_chart_layout is also<validate-chart-layout> {
    so gog_graph_validate_chart_layout($!gg);
  }

}


our subset GogGraphViewAncestry is export of Mu
  where GogGraphView | GogOutlinedObjectAncestry;

class GOffice::Graph::View {
  has GogGraphView $!ggv is implementor;

  submethod BUILD ( :$goffice-graph-oo ) {
    self.setGogGraphView($goffice-graph-oo)
      if $goffice-graph-oo
  }

  method setGogGraphView (GogGraphViewAncestry $_) {
    my $to-parent;

    $!ggv = do {
      when GogGraphView {
        $to-parent = cast(GogOutlinedObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogGraphView, $_);
      }
    }
    self.setGogOutlinedObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogGraphView
  { $!ggv }

  multi method new (
    $goffice-graph-oo where * ~~ GogGraphViewAncestry ,

    :$ref = True
  ) {
    return unless $goffice-graph-oo;

    my $o = self.bless( :$goffice-graph-oo );
    $o.ref if $ref;
    $o;
  }

  method get_selection ( :$raw = False ) is also<get-selection> {
    propReturnObject(
      gog_graph_view_get_selection($!ggv),
      $raw,
      |GOffice::Graph::View.getTypePair
    )
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_graph_view_get_type, $n, $t );
  }

  method handle_event (
    GdkEvent() $event,
    Num()      $x_offset,
    Num()      $y_offset
  )
    is also<handle-event>
  {
    my gdouble ($x, $y) = ($x_offset, $y_offset);

    gog_graph_view_handle_event($!ggv, $event, $x, $y);
  }

  method set_selection (GogObject() $gobj) is also<set-selection> {
    gog_graph_view_set_selection($!ggv, $gobj);
  }

}
