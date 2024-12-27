use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package GOffice::Raw::Definitions;

constant goffice is export = 'goffice-0.10',v10;

constant Decimal64 is export := num64;

class GoMathEditor         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboStack   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboColor   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboText    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboPixmaps is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOColor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOCmdContext         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataCacheSource    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODateConventions    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODrawingAnchor      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFileOpener         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFileSaver          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOIOContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOLocaleSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPath               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOString             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOStrmapSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOVal                is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValArray           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValBucketer        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOUndo               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GocGroup             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GocItem              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogRenderer          is repr<CPointer> does GLib::Roles::Pointers is export { }
