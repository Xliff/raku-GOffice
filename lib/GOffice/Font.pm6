use v6.c;

use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::Font;

use GLib::GList;
use GLib::GSList;

use GLib::Roles::Implementor;

class GOffice::Font {
  also does GLib::Roles::Implementor;

  has GOFont $!gf is implementor handles<
    strikethrough
    underline
    color
  >;

  submethod BUILD ( :goffice-font(:$!gf) )
  { }

  submethod GOffice::Raw::Structs::GOFont
  { $!gf }

  method new (GOFont $goffice-font, :$ref = True) {
    return Nil unless $goffice-font;

    my $o = self.bless( :$goffice-font );
    $o.ref if $ref;
    $o;
  }

  method new_by_desc (PangoFontDescription() $desc) is also<new-by-desc> {
    my $goffice-font = go_font_new_by_desc($desc);

    $goffice-font ?? self.bless( :$goffice-font ) !! Nil;
  }

  method new_by_index (Int() $i) is also<new-by-index> {
    my gint $ii           = $i;
    my      $goffice-font = go_font_new_by_index($ii);

    $goffice-font ?? self.bless( :$goffice-font ) !! Nil;
  }

  method new_by_name (Str() $str) is also<new-by-name> {
    my $goffice-font = go_font_new_by_name($str);

    $goffice-font ?? self.bless( :$goffice-font ) !! Nil;
  }

  method as_str is also<as-str> {
    go_font_as_str($!gf);
  }

  method cache_register (GClosure() $callback) is also<cache-register> {
    go_font_cache_register($callback);
  }

  method cache_unregister (GClosure() $callback) is also<cache-unregister> {
    go_font_cache_unregister($callback);
  }

  method eq (GOFont() $b) {
    so go_font_eq($!gf, $b);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_font_get_type, $n, $t );
  }

  method list_families (
    PangoContext()  $context,
                   :$raw              = False,
                   :glist( :$gslist ) = False
  )
    is also<list-families>
  {
    returnGSList(
      go_fonts_list_families($context),
      $raw,
      $gslist,
      Str
    );
  }

  method list_sizes (
    :$raw              = False,
    :glist( :$gslist ) = False
  )
    is also<list-sizes>
  {
    returnGList(
      go_fonts_list_sizes,
      $raw,
      $gslist,
      guint32
    );
  }

  method ref {
    go_font_ref($!gf);
    self
  }

  method unref {
    go_font_unref($!gf);
  }

}

class GOffice::Font::Metrics {
  also does GLib::Roles::Implementor;

  has GOFontMetrics $!gfm is implementor handles<
    avg_digit_width
    avg-digit-width
    digit_widths
    digit-widths
    E_width
    E-width
    hash_width
    hash-width
    hyphen_width
    hyphen-width
    max_digit_width
    max-digit-width
    min_digit_width
    min-digit-width
    minus_width
    minus-width
    plus_width
    plus-width
    space_width
    space-width
    thin_space
    thin_space_width
    thin-space
    thin-space-width
  >;

  multi method new (GOFontMetrics $goffice-font-metrics) {
    $goffice-font-metrics ?? self.bless( :$goffice-font-metrics ) !! Nil;
  }
  multi method new (PangoContext() $context, GOFont() $font) {
    my $goffice-font-metrics = go_font_metrics_new($context, $font);

    $goffice-font-metrics ?? self.bless( :$goffice-font-metrics ) !! Nil;
  }

  method free {
    go_font_metrics_free($!gfm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_font_metrics_get_type, $n, $t );
  }
}
