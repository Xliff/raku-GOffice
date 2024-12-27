use v6.c;

use GOffice::Raw::Definitions;

use NativeCall;

unit package GOffice::Raw::Main;

# cw: We violate our general sizing rules in case these routines are to be
#     used without INIT phaser found in GOffice::Main

sub libgoffice_init
  is native(goffice)
  is export
{ * }

sub libgoffice_shutdown
  is native(goffice)
  is export
{ * }
