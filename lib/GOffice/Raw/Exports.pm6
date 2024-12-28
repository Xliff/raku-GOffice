use v6.c;

unit package GOffice::Raw::Exports;

our @goffice-exports is export;

BEGIN {
  @goffice-exports = <
    GOffice::Raw::Compat
    GOffice::Raw::Definitions
    GOffice::Raw::Enums
    GOffice::Raw::Structs
  >;
}
