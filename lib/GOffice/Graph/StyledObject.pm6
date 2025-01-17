use v6.c;

use Method::Also;
use NativeCall;

use NativeCall;

use GOffice::Raw::Types;

use GOffice::Graph::Object;

our subset GogStyledObjectAncestry is export of Mu
  where GogStyledObject | GOStyledObject | GogObjectAncestry;

class GOffice::Graph::StyledObject is GOffice::Graph::Object {
  also does GOffice::Roles::StyledObject;
  
  has GogStyledObject $!ggoo is implementor;

  submethod BUILD ( :$goffice-styled-obj ) {
    self.setGogStyledObject($goffice-styled-obj) if $goffice-styled-obj
  }

  method setGogStyledObject (GogStyledObjectAncestry $_) {
    my $to-parent;

    $!ggoo = do {
      when GogStyledObject {
        $to-parent = cast(GogStyledObject, $_);
        $_;
      }

      when GOStyledObject {
        $!gso = $_;
        $to-parent = cast(GogStyledObject, $_);
        cast(GogStyledObject, $_);
      }

      default {
        $to-parent = $_;
        cast(GogStyledObject, $_);
      }
    }
    self.setGogObject($to-parent);
    self.roleInit-GOStyledObject;
  }

  method GOffice::Raw::Definitions::GogStyledObject
    is also<GogStyledObject>
  { $!ggoo }

  method new (
    $goffice-styled-obj where * ~~ GogStyledObjectAncestry,

    :$ref = True
  ) {
    return unless $goffice-styled-obj;

    my $o = self.bless( :$goffice-styled-obj );
    $o.ref if $ref;
    $o;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gog_styled_object_get_type, $n, $t );
  }

}


### /usr/src/goffice/goffice/graph/gog-styled-object.h

sub gog_styled_object_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }
