use v6.c;

use NativeCall;

use CompUnit::Util :re-export;

use GLib::Raw::Definitions;
use GOffice::Raw::Compat;

use GLib::Roles::Pointers;

unit package GOffice::Raw::Definitions;

constant goffice is export = 'goffice-0.10',v10;

constant Decimal64 is export := num64;

constant GORegoff              is export := gint;
constant GODistance            is export := int64;
constant GOFileOpenerProbeFunc is export := Pointer;
constant GOFileOpenerOpenFunc  is export := Pointer;
constant GOUndoBinaryFunc      is export := Pointer;
constant GOUndoUnaryFunc       is export := Pointer;

class GoMathEditor         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboStack   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboColor   is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboText    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboPixmaps is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOColor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOCmdContext         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataCacheSource    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODrawingAnchor      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOMarker             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPersist            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPlugin             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPluginMethod       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOProgressHelper     is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOLocaleSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPath               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOString             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOStrmapSel          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOVal                is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValArray           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValBucketer        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GocGroup             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogAxis              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogDataset           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogRenderer          is repr<CPointer> does GLib::Roles::Pointers is export { }

class GogSeries            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogSeriesDesc        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogTheme             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogTool              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogView              is repr<CPointer> does GLib::Roles::Pointers is export { }

BEGIN re-export('GOffice::Raw::Compat');
