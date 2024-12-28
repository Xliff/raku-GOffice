use v6.c;

use NativeCall;

use GLib::Roles::Pointers;

unit package GOffice::Raw::Compat;

constant GFreeFunc is export := Pointer;
constant xmlChar   is export := uint8;

class cairo_matrix_t is repr<CPointer> does GLib::Roles::Pointers is export { }

class GsfInput       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfOutput      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfXMLIn       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfXMLOut      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GsfDocMetaData is repr<CPointer> does GLib::Roles::Pointers is export { }

class LsmDomView     is repr<CPointer> does GLib::Roles::Pointers is export { }
