use v6.c;

use NativeCall;

use GLib::Roles::Pointers;

unit package GOffice::Raw::Compat;

constant GFreeFunc is export := Pointer;
constant xmlChar   is export := uint8;

class GsfInput       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfXMLIn       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfXMLOut      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfDocMetaData is repr<CPointer> does GLib::Roles::Pointers is export { }
