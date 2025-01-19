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
constant GOColor               is export := uint32;
constant GODistance            is export := int64;
constant GOFileOpenerProbeFunc is export := Pointer;
constant GOFileOpenerOpenFunc  is export := Pointer;
constant GOUndoBinaryFunc      is export := Pointer;
constant GOUndoUnaryFunc       is export := Pointer;

our $GOFFICE-AUTO-INIT-PLUGINS is export = True;
our $GOFFICE-INIT              is export = False;

class GoMathEditor          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboStack    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboColor    is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboText     is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOActionComboPixmaps  is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOCmdContext          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataCacheSource     is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODrawingAnchor       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataScalarVal       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataScalarStr       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataVectorVal       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataVectorStr       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GODataMatrixVal       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOEditor              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOErrorInfo           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFormat              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOFormatDetails       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOGraphWidget         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOMarker              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPersist             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPlugin              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPluginLoader        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPluginLoaderService is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPluginMethod        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOLocaleSel           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOPath                is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOString              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOStrmapSel           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOStyledObject        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOVal                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValArray            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GOValBucketer         is repr<CPointer> does GLib::Roles::Pointers is export { }

class GocGroup              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GocGraph              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GocWidget             is repr<CPointer> does GLib::Roles::Pointers is export { }

#class GogAxis               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogAxisMapDesc        is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogAxisColorMap       is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogColorScale         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogDataAllocator      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogDataset            is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogGraphView          is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogGrid               is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogLabel              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogRegEqn             is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogRenderer           is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogPlotBoundInfo      is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogSeries             is repr<CPointer> does GLib::Roles::Pointers is export { }
#class GogSeriesDesc         is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogTheme              is repr<CPointer> does GLib::Roles::Pointers is export { }
class GogTool               is repr<CPointer> does GLib::Roles::Pointers is export { }
#class GogView               is repr<CPointer> does GLib::Roles::Pointers is export { }

class GogStyle              is repr<CPointer> does GLib::Roles::Pointers is export {

  method new ( GogStyle:U: ) {
    sub gog_style_new
      returns GogStyle
      is      native(goffice)
      is      export
    { * }

    gog_style_new();
  }

}

# cw: To be provided separately, with ::Class package
# class GogObjectClass      is repr<CPointer> does GLib::Roles::Pointers is export {

BEGIN re-export('GOffice::Raw::Compat');
