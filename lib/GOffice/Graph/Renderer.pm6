use v6.c;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Renderer;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class GOffice::Graph::Renderer::Draw {
  has $!ggr is built;

  method circle (Num() $x, Num() $y, Num() $r) {
    my gdouble ($xx, $yy, $rr) = ($x, $y, $r);

    gog_renderer_draw_circle($!ggr, $xx, $yy, $rr);
  }

  method color_map (
    GogAxisColorMap   $map,
    gint              $discrete,
    gboolean          $horizontal,
    GogViewAllocation $rect
  ) {
    gog_renderer_draw_color_map($!ggr, $map, $discrete, $horizontal, $rect);
  }

  method data_label (
    GogSeriesLabelElt $elt,
    GogViewAllocation $pos,
    GOAnchorType      $anchor,
    GOStyle           $legend_style
  ) {
    gog_renderer_draw_data_label($!ggr, $elt, $pos, $anchor, $legend_style);
  }

  method equation (
    LsmDomView() $mathml_view,
    Num()        $x,
    Num()        $y
  ) {
    my gdouble ($xx, $yy) = ($x, $y);

    gog_renderer_draw_equation($!ggr, $mathml_view, $xx, $yy);
  }

  method gostring (
    GOString          $str,
    GogViewAllocation $pos,
    GOAnchorType      $anchor,
    GoJustification   $justification,
    gdouble           $width
  ) {
    gog_renderer_draw_gostring($!ggr, $str, $pos, $anchor, $justification, $width);
  }

  method grip (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    gog_renderer_draw_grip($!ggr, $xx, $yy);
  }

  method marker (Num() $x, Num() $y) {
    my gdouble ($xx, $yy) = ($x, $y);

    gog_renderer_draw_marker($!ggr, $xx, $yy);
  }

  method rectangle (GogViewAllocation() $rect) {
    gog_renderer_draw_rectangle($!ggr, $rect);
  }

  method rotated_rectangle (GogViewAllocation $rect, Int() $rotate_bg) {
    my gboolean $r = $rotate_bg.so.Int;

    gog_renderer_draw_rotated_rectangle($!ggr, $rect, $r);
  }

  method selection_rectangle (GogViewAllocation() $rectangle) {
    gog_renderer_draw_selection_rectangle($!ggr, $rectangle);
  }

  method shape (GOPath() $path) {
    gog_renderer_draw_shape($!ggr, $path);
  }

  method text (
    Str               $text,
    GogViewAllocation $pos,
    GOAnchorType      $anchor,
    gboolean          $use_markup,
    GoJustification   $justification,
    gdouble           $width
  ) {
    gog_renderer_draw_text($!ggr, $text, $pos, $anchor, $use_markup, $justification, $width);
  }
}

class GOffice::Graph::Renderer {
  also does GLib::Roles::Object;

  has GogRenderer $!ggr is implementor;

  has $!ggr-draw;

  multi method new (GogGraph() $graph) {
    my $goffice-renderer = gog_renderer_new($graph);

    $goffice-renderer ?? self.bless( :$goffice-renderer ) !! Nil
  }

  method draw {
    $!ggr-draw = GOffice::Graph::Renderer::Draw.new( ggr => $!ggr )
      unless $!ggr-draw;
    $!ggr-draw;
  }

  method export_image (
    Int()       $format,
    GsfOutput() $output,
    Num()       $x_dpi,
    Num()       $y_dpi
  ) {
    my gdouble       ($x, $y) = ($x_dpi, $y_dpi);
    my GOImageFormat  $f      =  $format;

    gog_renderer_export_image($!ggr, $f, $output, $x, $y);
  }

  method fill_circle (Num() $x, Num() $y, Num() $r) {
    my gdouble ($xx, $yy, $rr) = ($x, $y, $r);

    gog_renderer_fill_circle($!ggr, $xx, $yy, $rr);
  }

  method fill_rectangle (GogViewAllocation() $rect) {
    gog_renderer_fill_rectangle($!ggr, $rect);
  }

  method fill_serie (GOPath() $path, GOPath() $close_path) {
    gog_renderer_fill_serie($!ggr, $path, $close_path);
  }

  method fill_shape (GOPath() $path) {
    gog_renderer_fill_shape($!ggr, $path);
  }

  method get_cairo_surface ( :$raw= False ) {
    gog_renderer_get_cairo_surface($!ggr);
  }

  method get_gostring_AABR (
    GOString()       $str,
    GOGeometryAABR() $aabr,
    Num()            $max_width
  ) {
    my gdouble $m = $max_width;

    gog_renderer_get_gostring_AABR($!ggr, $str, $aabr, $m);
  }

  method get_gostring_OBR (
    GOString()      $str,
    GOGeometryOBR() $obr,
    Num()           $max_width
  ) {
    my gdouble $m = $max_width;

    gog_renderer_get_gostring_OBR($!ggr, $str, $obr, $m);
  }

  method get_hairline_width_pts {
    gog_renderer_get_hairline_width_pts($!ggr);
  }

  method get_pixbuf ( :$raw = False ) {
    propReturnObject(
      gog_renderer_get_pixbuf($!ggr),
      $raw,
      |GDK::Pixbuf.getTypePair
    );
  }

  method get_scale {
    gog_renderer_get_scale($!ggr);
  }

  method get_text_AABR (
    Str()            $text,
    Int()            $use_markup,
    GOGeometryAABR() $aabr,
    Num()            $max_width
  ) {
    my gdouble  $m = $max_width;
    my gboolean $u = $use_markup.so.Int;

    gog_renderer_get_text_AABR($!ggr, $text, $u, $aabr, $m);
  }

  method get_text_OBR (
    Str()           $text,
    Int()           $use_markup,
    GOGeometryOBR() $obr,
    Num()           $max_width
  ) {
    my gdouble  $m = $max_width;
    my gboolean $u = $use_markup.so.Int;

    gog_renderer_get_text_OBR($!ggr, $text, $u, $obr, $m);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_renderer_get_type, $n, $t );
  }

  method line_size (Num() $width) {
    my gdouble $w = $width;

    gog_renderer_line_size($!ggr, $w);
  }

  method pop_clip {
    gog_renderer_pop_clip($!ggr);
  }

  method pop_style {
    gog_renderer_pop_style($!ggr);
  }

  method pt2r (Num() $d) {
    my gdouble $dd = $d;

    gog_renderer_pt2r($!ggr, $dd);
  }

  method pt2r_x (Num() $d) {
    my gdouble $dd = $d;

    gog_renderer_pt2r_x($!ggr, $dd);
  }

  method pt2r_y (Num() $d) {
    my gdouble $dd = $d;

    gog_renderer_pt2r_y($!ggr, $dd);
  }

  method push_clip (GOPath() $path) {
    gog_renderer_push_clip($!ggr, $path);
  }

  method push_clip_rectangle (Num() $x, Num() $y, Num() $w, Num() $h) {
    my gdouble ($xx, $yy, $ww, $hh) = ($x, $y, $w, $h);

    gog_renderer_push_clip_rectangle($!ggr, $xx, $yy, $ww, $hh);
  }

  method push_style (GOStyle() $style) {
    gog_renderer_push_style($!ggr, $style);
  }

  method render_to_cairo (
    cairo_t() $cairo,
    Num()     $width,
    Num()     $height
  ) {
    my gdouble ($ww, $hh) = ($width, $height);

    gog_renderer_render_to_cairo($!ggr, $cairo, $ww, $hh);
  }

  method request_update {
    gog_renderer_request_update($!ggr);
  }

  method stroke_circle (Num() $x, Num() $y, Num() $r) {
    my gdouble ($xx, $yy, $rr) = ($x, $y, $r);

    gog_renderer_stroke_circle($!ggr, $xx, $yy, $rr);
  }

  method stroke_rectangle (GogViewAllocation() $rect) {
    gog_renderer_stroke_rectangle($!ggr, $rect);
  }

  method stroke_serie (GOPath() $path) {
    gog_renderer_stroke_serie($!ggr, $path);
  }

  method stroke_shape (GOPath() $path) {
    gog_renderer_stroke_shape($!ggr, $path);
  }

  method update (Num() $w, Num() $h) {
    my gdouble ($ww, $hh) = ($w, $h);

    gog_renderer_update($!ggr, $ww, $hh);
  }
}
