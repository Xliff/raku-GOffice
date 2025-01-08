use v6.c;

use NativeCall;

use GOffice::Raw::Types;

role GOffice::Roles::Signals::Graph::Object {
  has %!signals-ggo;

  #  GogObject *child --> void
  method connect-gogobject (
     $obj,
     $signal,
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-ggo{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-gogobject($obj, $signal,
        -> $, $go is copy {
          CATCH {
            default { 𝒮.note($_) }
          }

          $go = ::('GOffice::Graph::Object').new($go) unless $raw;

          𝒮.emit( [self, $go] );
        },
        Pointer, 0
      );
      [ self.create-signal-supply($signal, 𝒮), $obj, $hid ];
    };
    %!signals-ggo{$signal}[0].tap(&handler) with &handler;
    %!signals-ggo{$signal}[0];
  }
}

# GogObject *parent,  GogObject *child
sub g-connect-gogobject (
  Pointer $app,
  Str     $name,
          &handler (Pointer,  GogObject),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }
