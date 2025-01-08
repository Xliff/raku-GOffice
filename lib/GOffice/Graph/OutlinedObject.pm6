use v6.c;

use Method::Also;
use NativeCall;

use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;

use GOffice::Graph::StyledObject;

our subset GogOutlinedObjectAncestry is export of Mu
  where GogOutlinedObject | GogStyledObjectAncestry;

class GOffice::Graph::OutlinedObject is GOffice::Graph::StyledObject {
  has GogOutlinedObject $!ggoo is implementor;

  submethod BUILD ( :$goffice-outlined-obj ) {
    self.setGOutlinedObject($goffice-outlined-obj) if $goffice-outlined-obj
  }

  method setGogOutlinedObject (GogOutlinedObjectAncestry $_) {
    my $to-parent;

    $!ggoo = do {
      when GogOutlinedObject {
        $to-parent = cast(GogStyledObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GogOutlinedObject, $_);
      }
    }
    self.setGogStyledObject($to-parent);
  }

  method GOffice::Raw::Definitions::GogOutlinedObject
    is also<GogOutlinedObject>
  { $!ggoo }

  multi method new (
    $goffice-outlined-obj where * ~~ GogOutlinedObjectAncestry,

    :$ref = True
  ) {
    return unless $goffice-outlined-obj;

    my $o = self.bless( :$goffice-outlined-obj );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method padding-pts is rw  is g-property is also<padding_pts> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('padding-pts', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('padding-pts', $gv);
      }
    );
  }

  method get_pad is also<get-pad> {
    gog_outlined_object_get_pad($!ggoo);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_outlined_object_get_type, $n, $t );
  }

}

class GOffice::Graph::OutlinedView {

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_outlined_view_get_type, $n, $t );
  }

}

### /usr/src/goffice/goffice/graph/gog-outlined-object.h

sub gog_outlined_object_get_pad (GogOutlinedObject $goo)
  returns gdouble
  is      native(goffice)
  is      export
{ * }

sub gog_outlined_object_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_outlined_view_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }
