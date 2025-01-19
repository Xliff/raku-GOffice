use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;

use Pango::FontDescription;
use GOffice::Graph::Object;
use GOffice::Data::Simple;

use GOffice::Roles::StyledObject;
use GOffice::Roles::Graph::Dataset;

our subset GogTextAncestry is export of Mu
  where GogText | GOStyledObject | GogObjectAncestry;

class GOffice::Graph::Text is GOffice::Graph::Object {
  also does GOffice::Roles::StyledObject;

  has GogText $!ggt is implementor;

  submethod BUILD ( :$gobject-graph-label ) {
    self.setGogText($gobject-graph-label) if $gobject-graph-label
  }

  method setGogText (GogTextAncestry $_) {
    my $to-parent;

    $!ggt = do {
      when GogText {
        $to-parent = cast(GogObject, $_);
        $_;
      }

      when GOStyledObject {
        $!gso      = $_;
        $to-parent = cast(GogObject, $_);
        cast(GogText, $_);
      }

      default {
        $to-parent = $_;
        cast(GogText, $_);
      }
    }
    self.setGogObject($to-parent);
    self.roleInit-GOStyledObject;
  }

  method GOffice::Raw::Definitions::GogText
    is also<GogText>
  { $!ggt }

  multi method new (
    $gobject-graph-label where * ~~ GogTextAncestry,

    :$ref = True
  ) {
    return unless $gobject-graph-label;

    my $o = self.bless( :$gobject-graph-label );
    $o.ref if $ref;
    $o;
  }

  method get_markup is also<get-markup> {
    gog_text_get_markup($!ggt);
  }

  method get_str is also<get-str> {
    gog_text_get_str($!ggt);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_text_get_type, $n, $t );
  }
}

our subset GogLabelAncestry is export of Mu
  where GogLabel | GogDataset | GogTextAncestry;

class GOffice::Graph::Label is GOffice::Graph::Text {
  also does GOffice::Roles::Graph::Dataset;

  has GogLabel $!ggl is implementor;

  submethod BUILD ( :$goffice-graph-label ) {
    self.setGogLabel($goffice-graph-label) if $goffice-graph-label
  }

  method setGogLabel (GogLabelAncestry $_) {
    my $to-parent;

    $!ggl = do {
      when GogLabel {
        $to-parent = cast(GogText, $_);
        $_;
      }

      when GogDataset {
        $!ggd = $_;
        $to-parent = cast(GObject, $_);
        cast(GogLabel, $_);
      }

      default {
        $to-parent = $_;
        cast(GogLabel, $_);
      }
    }
    self.setGogText($to-parent);
    self.roleInit-GogDataset;
  }

  method GOffice::Raw::Definitions::GogLabel
    is also<GogLabel>
  { $!ggl }

  multi method new (
    $goffice-graph-label where * ~~ GogLabelAncestry,

    :$ref = True
  ) {
    return unless $goffice-graph-label;

    my $o = self.bless( :$goffice-graph-label );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $label, :$copy, :$free, *%a) {
    my $goffice-graph-label = self.new-object-ptr(self.get_type);

    my $o = $goffice-graph-label
      ?? self.bless( :$goffice-graph-label )
      !! Nil;
    $o.setAttributes(%a) if $o && +%a;
    return $o unless $label;

    if $label {
      my $d = $copy ?? GOffice::Data::Scalar::Str.new-copy($label)
                    !! GOffice::Data::Scalar::Str.new($label, :$free);
      $o.set_dim(0, $d);
    }
    $o;
  }

  method setAttributes (%a) {
    %a<font-description> = [//](
      %a<font_description>,
      %a<font-desc>       ,
      %a<font_desc>
    ) unless %a<font-description>;

    with %a<font-description> {
      when Str {
        $_ = Pango::FontDescription.new-from-string($_);
        proceed;
      }

      when Pango::FontDescription {
        my $s = self.get_style;
        $s.set_font_desc($_);
      }
    }

    %a{$_}:delete for <
      font-description
      font_description
      font-desc
      font_desc
    >;

    callsame if +%a;
  }

  # Type: boolean
  method allow-markup is rw  is g-property is also<allow_markup> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $ {
        self.prop_get('allow-markup', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-markup', $gv);
      }
    );
  }

  # Type: boolean
  method allow-wrap is rw  is g-property is also<allow_wrap> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('allow-wrap', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('allow-wrap', $gv);
      }
    );
  }

  # Type: string
  method justification is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('justification', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('justification', $gv);
      }
    );
  }

  # Type: boolean
  method rotate-bg is rw  is g-property is also<rotate_bg> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('rotate-bg', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('rotate-bg', $gv);
      }
    );
  }

  # Type: boolean
  method rotate-frame is rw  is g-property is also<rotate_frame> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('rotate-frame', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('rotate-frame', $gv);
      }
    );
  }

  # Type: boolean
  method show-eq is rw  is g-property is also<show_eq> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('show-eq', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-eq', $gv);
      }
    );
  }

  # Type: boolean
  method show-r2 is rw  is g-property is also<show_r2> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => -> $  {
        self.prop_get('show-r2', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('show-r2', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    gog_label_get_type();
  }

}

our subset GogRegEqnAncestry is export of Mu
  where GogRegEqn | GogObjectAncestry;

class GOffice::Graph::Equation is GOffice::Graph::Object {
  has GogRegEqn $!gge is implementor;

  submethod BUILD ( :$gobject-graph-label ) {
    self.setGogRegEqn($gobject-graph-label)
      if $gobject-graph-label
  }

  method setGogRegEqn (GogRegEqnAncestry $_) {
    my $to-parent;

    $!gge = do {
      when GogRegEqn {
        $to-parent = cast(GogObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogRegEqn, $_);
      }
    }
    self.setGogObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogRegEqn
  { $!gge }

  multi method new (
    $gobject-graph-label where * ~~ GogRegEqnAncestry,

    :$ref = True
  ) {
    return unless $gobject-graph-label;

    my $o = self.bless( :$gobject-graph-label );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_reg_eqn_get_type, $n, $t );
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
