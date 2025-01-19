use v6.c;

use NativeCall;

use GOffice::Raw::Types;

use Pango::FontDescription;

class GOffice::Graph::Label is GOffice::Graph::Object {
  has GogLabel $!ggl is implementor;

  method new (Str() $label, *%a) {
    my $goffice-graph-label = self.new-object-ptr(self.get_type);

    my $o = $goffice-graph-label
      ?? self.bless( :$goffice-graph-label )
      !! Nil
    $o.setAttributes(%a) if $o && +%a;
    return $o unless $label;

    my $d = GOffice::data::Scalar::Str.new($label, False);
    $o.set_dim(0, $d);
    $o;
  }

  method setAttributes (%a) {
    %a<font-description> //= %a<font_description>:delete;
    with %a<font-description> {
      when Str {
        $_ = Pango::FontDescription.from-string($_);
        proceed;
      }

      when Pango::FontPangoFontDescription {
        my $s = self.get_style;
        $s.set_font_desc($_);
      }
      %a<font-description>:delete;
    }
    callsame if +%a;
  }

  method get_type {
    state ($n, $t);

    gog_label_get_type();
  }

}

class GOffice::Graph::Equation is GOffice::Graph::Object {
  has GogRegEqn $!gge is implementor;

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_reg_eqn_get_type, $n, $t );
  }

}


class GOffice::Graph::Text is GOffice::Graph::Object {
  has GogText $!ggt is implementor;

  method get_markup {
    gog_text_get_markup($!ggt);
  }

  method get_str {
    gog_text_get_str($!ggt);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_text_get_type, $n, $t );
  }
}

### /usr/src/goffice/goffice/graph/gog-label.h

sub gog_label_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_reg_eqn_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_text_get_markup (GogText $text)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub gog_text_get_str (GogText $text)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub gog_text_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }
