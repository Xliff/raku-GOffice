use v6.c;

use Method::Also;

use GOffice::Raw::Types;
use GOffice::Raw::StyledObject;

use GOffice::Style;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

role GOffice::Roles::StyledObject {
  has GOStyledObject $!gso is implementor;

  method roleInit-GOStyledObject is also<roleInit_GOStyledObject> {
    return if $!gso;

    my \i = findProperImplementor( self.^attributes );
    my \v = i.get_value(self);

    say "GSO-V: { +v.p }";

    $!gso = cast( GOStyledObject, v );
  }

  method apply_theme (GOStyle() $style) is also<apply-theme> {
    go_styled_object_apply_theme($!gso, $style);
  }

  method fill (cairo_t() $cr, Int() $preserve) {
    my gboolean $p= $preserve.so.Int;

    go_styled_object_fill($!gso, $cr, $preserve);
  }

  method get_auto_style is also<get-auto-style> {
    go_styled_object_get_auto_style($!gso);
  }

  method get_document ( :$raw = False ) is also<get-document> {
    propReturnObject(
      go_styled_object_get_document($!gso),
      $raw,
      |GOffice::Doc.getTypePair
    );
  }

  method get_style ( :$raw = False ) is also<get-style> {
    propReturnObject(
      go_styled_object_get_style($!gso),
      $raw,
      |GOffice::Style.getTypePair
    )
  }

  method gostyledobject_get_type is also<gostyledobject-get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_styled_object_get_type, $n, $t );
  }

  method set_cairo_line (cairo_t() $cr) is also<set-cairo-line> {
    go_styled_object_set_cairo_line($!gso, $cr);
  }

  method set_style (GOStyle() $style) is also<set-style> {
    go_styled_object_set_style($!gso, $style);
  }

  method style_changed is also<style-changed> {
    go_styled_object_style_changed($!gso);
  }

}

our subset GOStyledObjectAncestry is export of Mu
  where GOStyledObject | GObject;

class GOffice::StyledObject {
  also does GLib::Roles::Object;
  also does GOffice::Roles::StyledObject;

  submethod BUILD ( :$goffice-styledobj ) {
    self.setGOStyledObject($goffice-styledobj) if $goffice-styledobj
  }

  method setGOStyledObject (GOStyledObjectAncestry $_) {
    my $to-parent;

    $!gso = do {
      when GOStyledObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GOStyledObject, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Definitions::GOStyledObject
    is also<GOStyledObject>
  { $!gso }

  multi method new (
    $goffice-styledobj where * ~~ GOStyledObjectAncestry,

    :$ref = True
  ) {
    return unless $goffice-styledobj;

    my $o = self.bless( :$goffice-styledobj );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    self.gostyledobject_get_type
  }

}
