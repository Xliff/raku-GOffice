use v6.c;

use NativeCall;

use GOffice::Raw::Types;

use GLib::Roles::StaticClass;

class GOffice::ResourceManager {
  also does GLib::Roles::StaticClass;

  method lookup (Str() $name is copy, Int() $len, :$buf = True) {
    my size_t $l = $len;

    if $name ~~ / ^'res:' / -> $m {
      $name.substr-rw($m.from, $m.to - $m.from);
    }

    my $ca = go_rsm_lookup($name, $l);
    return $ca unless $buf;
    Buf.new( $ca[^$l] );
  }

  method register_file (
    Str()         $id,
    CArray[uint8] $data,
    Int()         $len
  ) {
    my size_t $l = $len;

    go_rsm_register_file($id, $data, $l);
  }

  method unregister_file (Str() $id) {
    go_rsm_unregister_file($id);
  }

}

### /usr/src/goffice/goffice/utils/go-rsm.h

sub go_rsm_lookup (
  Str    $id,
  size_t $len
)
  returns CArray[uint8]
  is      native(goffice)
  is      export
{ * }

sub go_rsm_register_file (
  Str           $id,
  gconstpointer $data,
  size_t        $len
)
  is      native(goffice)
  is      export
{ * }

sub go_rsm_unregister_file (Str $id)
  is      native(goffice)
  is      export
{ * }
