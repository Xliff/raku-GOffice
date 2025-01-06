use v6.c;

use Method::Also;

use Cairo;
use GOffice::Raw::Types;
use GOffice::Raw::Style;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GOStyleAncestry is export of Mu
  where GOStyle | GObject;

class GOffice::Style {
  also does GLib::Roles::Object;

  has GOStyle $!gs is implementor handles<
    font
    line
    marker
    interesting-fields
    interesting_fields
    flags
    disable-theming
    disable_theming
    text-layout
    text_layout
  >;

  submethod BUILD ( :$goffice-style ) {
    self.setGOStyle($goffice-style) if $goffice-style
  }

  method setGOStyle (GOStyleAncestry $_) {
    my $to-parent;

    $!gs = do {
      when GOStyle {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GOStyle, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Structs::GOStyle
    is also<GOStyle>
  { $!gs }

  multi method new (
    $goffice-style where * ~~ GOStyleAncestry,

    :$ref = True
  ) {
    return unless $goffice-style;

    my $o = self.bless( :$goffice-style );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $goffice-style = go_style_new();

    $goffice-style ?? self.bless( :$goffice-style ) !! Nil
  }

  method apply_theme (GOStyle() $src, Int() $fields) is also<apply-theme> {
    my GOStyleFlag $f = $fields;

    go_style_apply_theme($!gs, $src, $f);
  }

  method assign (GOStyle() $src) {
    go_style_assign($!gs, $src);
  }

  method clear_auto is also<clear-auto> {
    go_style_clear_auto($!gs);
  }

  method dup ( :$raw = False ) {
    propReturnObject(
      go_style_dup($!gs),
      $raw,
      |self.getTypePair
    );
  }

  multi method fill {
    $!gs.fill;
  }
  multi method fill (cairo_t() $cr, Int() $preserve) {
    my gboolean $p = $preserve.so.Int;

    go_style_fill($!gs, $cr, $p);
  }

  method force_auto is also<force-auto> {
    go_style_force_auto($!gs);
  }

  method get_editor (
    GOStyle()      $default_style,
    GOCmdContext() $cc,
    GObject()      $object_with_style
  )
    is also<get-editor>
  {
    go_style_get_editor($!gs, $default_style, $cc, $object_with_style);
  }

  method get_marker ( :$raw = False ) is also<get-marker> {
    propReturnObject(
      go_style_get_marker($!gs),
      $raw,
      |GOffice::Marker.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_style_get_type, $n, $t );
  }

  method is_auto is also<is-auto> {
    so go_style_is_auto($!gs);
  }

  method is_different_size (GOStyle() $b) is also<is-different-size> {
    go_style_is_different_size($!gs, $b);
  }

  method is_fill_visible is also<is-fill-visible> {
    so go_style_is_fill_visible($!gs);
  }

  method is_line_visible is also<is-line-visible> {
    so go_style_is_line_visible($!gs);
  }

  method is_marker_visible is also<is-marker-visible> {
    so go_style_is_marker_visible($!gs);
  }

  method is_outline_visible is also<is-outline-visible> {
    so go_style_is_outline_visible($!gs);
  }

  method populate_editor (
    GOEditor()     $editor,
    GOStyle()      $default_style,
    GOCmdContext() $cc,
    GObject()      $object_with_style,
    Int()          $watch_for_external_change
  )
    is also<populate-editor>
  {
    my gboolean $w = $watch_for_external_change.so.Int;

    go_style_populate_editor(
      $!gs,
      $editor,
      $default_style,
      $cc,
      $object_with_style,
      $w
    );
  }

  method set_cairo_line (cairo_t() $cr) is also<set-cairo-line> {
    go_style_set_cairo_line($!gs, $cr);
  }

  method set_fill_brightness (Num() $brightness)
    is also<set-fill-brightness>
  {
    my gdouble $b = $brightness;

    go_style_set_fill_brightness($!gs, $b);
  }

  method set_font (GOFont() $font) is also<set-font> {
    go_style_set_font($!gs, $font);
  }

  method set_font_desc (PangoFontDescription() $desc)
    is also<set-font-desc>
  {
    go_style_set_font_desc($!gs, $desc);
  }

  method set_marker (GOMarker() $marker) is also<set-marker> {
    go_style_set_marker($!gs, $marker);
  }

  method set_text_angle (Num() $angle) is also<set-text-angle> {
    my gdouble $a = $angle;

    go_style_set_text_angle($!gs, $angle);
  }

}
