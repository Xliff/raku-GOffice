use v6.c;

use NativeCall;

use Cairo;
use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GLib::Raw::Subs;
use Pango::Raw::Definitions;
use Pango::Raw::Structs;
use GDK::Raw::Definitions;
use GDK::Raw::Structs;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;

use GLib::Roles::Pointers;

unit package GOffice::Raw::Structs;

class GOArrow is repr<CStruct> is export {
	has GOArrowType $.typ is rw;
	has gdouble     $.a   is rw;
	has gdouble     $.b   is rw;
	has gdouble     $.c   is rw;
}

class GOColorGroup is repr<CStruct> is export {
	HAS GObject  $!parent ;
	has Str      $!name   ;
	has gpointer $!context;
	HAS GOColor  @!history[8] is CArray;
}

class GOComboBox is repr<CStruct> is export {
	HAS GtkBox   $!hbox;
	has gpointer $!priv;
}

class GOComplex is repr<CStruct> is export {
	has gdouble $!re;
	has gdouble $!im;
}

#| Skip Struct
class GOComplexD is repr<CStruct> is export {
	has Decimal64 $!re;
	has Decimal64 $!im;
}

class GOComplexl is repr<CStruct> is export {
	has num64 $!re-a;
	has num64 $!re-b;
	has num64 $!im-a;
	has num64 $!im-b;
}

class GOData is repr<CStruct> is export {
	HAS GObject $!base ;
	has gint32  $.flags is rw;
}

class GODataMatrixSize is repr<CStruct> is export {
  has int32 $.rows;
  has int32 $.columns;
}

class GODataMatrix is repr<CStruct> is export {
	HAS GOData           $!base   ;
	has GODataMatrixSize $!size   ;
	has gdouble           $!values ;
	has gdouble           $!minimum;
	has gdouble           $!maximum;
}

class GODataScalar is repr<CStruct> is export {
	HAS GOData $!base ;
	has gdouble $!value;
}

class GODataVector is repr<CStruct> is export {
	HAS GOData $!base   ;
	has gint    $.len     is rw;
	has gdouble $!values ;
	has gdouble $!minimum;
	has gdouble $!maximum;
}

class GODateConventions is repr<CStruct> is export {
	has gboolean $!use_1904;
}

class GODoc is repr<CStruct> is export {
	HAS GObject        $!base                   ;
	has Str            $!uri                    ;
	has GsfDocMetaData $!meta_data              ;
	has gboolean       $!modified               ;
	has gint64         $.first_modification_time is rw;
	has gboolean       $!pristine               ;
	has GHashTable     $!images                 ;
	has GDateTime      $!modtime                ;
	has gpointer       $!priv                   ;
}

class GODocControl is repr<CStruct> is export {
	HAS GObject $!base;
	has GODoc   $!doc ;
}

# class GODocControlClass is repr<CStruct> is export {
# 	has GObjectClass $!base;
# }

#| Skip Struct
class GOFileOpener is repr<CStruct> is export {
	HAS GObject               $!parent            ;
	has Str                   $!id                ;
	has Str                   $!description       ;
	has GSList                $!suffixes          ;
	has GSList                $!mimes             ;
	has gboolean              $!encoding_dependent;
	has gboolean              $!interactive_only  ;
	has GOFileOpenerProbeFunc $!probe_func        ;
	has GOFileOpenerOpenFunc  $!open_func         ;
}

class GOFilePermissions is repr<CStruct> is export {
	has gboolean $!owner_read    ;
	has gboolean $!owner_write   ;
	has gboolean $!owner_execute ;
	has gboolean $!group_read    ;
	has gboolean $!group_write   ;
	has gboolean $!group_execute ;
	has gboolean $!others_read   ;
	has gboolean $!others_write  ;
	has gboolean $!others_execute;
}

class GOFont is repr<CStruct> is export {
	has gint                  $!ref_count          ;
	has gint                  $.font_index    is rw;
	has PangoFontDescription  $!desc               ;
	has gint                  $.underline     is rw;
	has gboolean              $.strikethrough is rw;
	has GOColor               $.color         is rw;

	method desc is rw {
		Proxy.new:
			FETCH => -> $                            { $!desc      },
			STORE => -> $, PangoFontDescription() \v { $!desc := v }
	}

}

class GOFontMetrics is repr<CStruct> is export {
	HAS gint      @.digit_widths[10] is CArray;
	has gint      $.min_digit_width           ;
	has gint      $.max_digit_width           ;
	has gint      $.avg_digit_width           ;
	has gint      $.hyphen_width              ;
	has gint      $.minus_width               ;
	has gint      $.plus_width                ;
	has gint      $.E_width                   ;
	has gint      $.hash_width                ;
	has gint      $.space_width               ;
	has gunichar  $.thin_space                ;
	has gint      $.thin_space_width          ;

	method digit-widths     { @!digit_widths     }
	method min-digit-width  { $!min_digit_width  }
	method max-digit-width  { $!max_digit_width  }
	method avg-digit-width  { $!avg_digit_width  }
	method hyphen-width     { $!hyphen_width     }
	method minus-width      { $!minus_width      }
	method plus-width       { $!plus_width       }
	method E-width          { $!E_width          }
	method hash-width       { $!hash_width       }
	method space-width      { $!space_width      }
	method thin-space       { $!thin_space       }
	method thin-space-width { $!thin_space_width }
}

class GOGeometryOBR is repr<CStruct> is export {
	has gdouble $!x    ;
	has gdouble $!y    ;
	has gdouble $!w    ;
	has gdouble $!h    ;
	has gdouble $!alpha;
}

class GOProgressHelper-V-Mem is repr<CStruct> {
	has Str   $.start;
	has int32 $.size;
}

class GOProgressHelper-V-Count is repr<CStruct> {
	has int32 $.total;
	has int32 $.last;
	has int32 $.current;
	has int32 $.step;
}

class GOProgressHelper-V-Value is repr<CStruct> {
	has int32 $.total;
	has int32 $.last;
	has int32 $.step;
}

class GOProgressHelper-V-Workbook is repr<CStruct> {
	has int32 $.n-elements;
	has int32 $.last;
	has int32 $.current;
	has int32 $.step;
}

class GOProgressHelper-V is repr<CUnion> {
	HAS GOProgressHelper-V-Mem       $.mem;
	HAS GOProgressHelper-V-Count     $.count;
	HAS GOProgressHelper-V-Value     $.value;
	HAS GOProgressHelper-V-Workbook  $.workbook;
}

#| Skip Struct
class GOProgressHelper is repr<CStruct> is export {
	has GOProgressHelperType $.helper-type;
	HAS GOProgressHelper-V   $.v;
}

class GOIOContext is repr<CStruct> is export {
	HAS GObject          $!base            ;
	has GOCmdContext     $!impl            ;
	has GSList           $!info            ;
	has gboolean         $!error_occurred  ;
	has gboolean         $!warning_occurred;
	has GList            $!progress_ranges ;
	has gdouble           $!progress_min    ;
	has gdouble           $!prGOFontogress_max    ;
	has gdouble          $!last_progress   ;
	has gdouble          $!last_time       ;
	HAS GOProgressHelper $!helper          ;
	has gboolean         $!exec_main_loop  ;
}

class GOImage is repr<CStruct> is export {
	HAS GObject   $!parent     ;
	has guint8    $.data        is rw;
	has gdouble    $!width      ;
	has gdouble    $!height     ;
	has GdkPixbuf $!thumbnail  ;
	has GdkPixbuf $!pixbuf     ;
	has Str      $!name       ;
	has gsize     $!data_length;
}

class GOImageFormatInfo is repr<CStruct> is export {
	has GOImageFormat $!format          ;
	has Str          $!name            ;
	has Str          $!desc            ;
	has Str          $!ext             ;
	has gboolean      $!has_pixbuf_saver;
	has gboolean      $!is_dpi_useful   ;
	has gboolean      $!alpha_support   ;
}

class GOLineDashSequence is repr<CStruct> is export {
	has gdouble $!offset   ;
	has gint    $.n_dash    is rw;
	has gdouble $!dash     ;
	has gint    $.ref_count is rw;
}

class GOMimeType is repr<CStruct> is export {
	has GOMimePriority $!priority           ;
	has Str           $!component_type_name;
	has gboolean       $!support_clipboard  ;
}

class GOOptionMenu is repr<CStruct> is export {
	HAS GtkButtonStruct $!button      ;
	has GtkMenuShell    $!menu        ;
	has GtkMenuItem     $!selected    ;
	has GtkLabel        $!button_label;
	has gboolean        $!active      ;
}

class GOPalette is repr<CStruct> is export {
	HAS GtkMenuStruct $!parent;
	has gpointer      $!priv  ;
}

class GOPangoAttrSubscript is repr<CStruct> is export {
	HAS PangoAttribute $!attr;
	has gboolean       $!val ;
}

class GOPangoAttrSuperscript is repr<CStruct> is export {
	HAS PangoAttribute $!attr;
	has gboolean       $!val ;
}

class GOPathPoint is repr<CStruct> is export {
	has gdouble $!x;
	has gdouble $!y;
}

class GOPattern is repr<CStruct> is export {
	has GOColor $!fore   ;
	has GOColor $!back   ;
	has gint     $.pattern is rw;
}

class GOPluginLoaderModule is repr<CStruct> is export {
	HAS GObject   $!base            ;
	has Str       $!module_file_name;
	has GModule   $!handle          ;
	has gpointer  $!plugin_init     ; #= (GOPlugin *plugin, GOCmdContext *cc)
	has gpointer  $!plugin_shutdown ; #= (GOPlugin *plugin, GOCmdContext *cc)
}

class GOPluginService is repr<CStruct> is export {
	HAS GObject  $!g_object         ;
	has Str     $!id               ;
	has GOPlugin $!plugin           ;
	has gboolean $!is_loaded        ;
	has gpointer $!cbs_ptr          ;
	has gboolean $!is_active        ;
	has Str     $!saved_description;
}

class GOPluginServiceGObjectLoader is repr<CStruct> is export {
	HAS GOPluginService $!plugin_service;
}

# class GOPluginServiceGObjectLoaderClass is repr<CStruct> is export {
# 	has GOPluginServiceClass $!plugin_service_class;
# 	has GHashTable           $!pending             ;
# }

class GOPluginServiceSimple is repr<CStruct> is export {
	HAS GOPluginService $!plugin_service;
}

# class GOPluginServiceSimpleClass is repr<CStruct> is export {
# 	has GOPluginServiceClass $!plugin_service_class;
# }

class GOPoint is repr<CStruct> is export {
	has GODistance $.x is rw;
	has GODistance $.y is rw;

	method set (Num() $x, Num() $y) {
		($!x, $!y) = ($x, $y);
	}
}

class GocPoint is repr<CStruct> is export {
  has gdouble $.x is rw;
	has gdouble $.y is rw;

	method set (Num() $x, Num() $y) {
		($!x, $!y) = ($x, $y);
	}
}

class GocPoints is repr<CStruct> is export {
	has guint    $!n;
	has guint    $!refs;
	has gpointer $!points; #= [GocPoint]

	method points {
		GLib::Roles::TypedBuffer[GocPoint].new( $!points, size => $!n );
	}

	method elems {
		$!n
	}
}


class GOProgressRange is repr<CStruct> is export {
	has gdouble $.min is rw;
	has gdouble $.max is rw;
}

class GOQuad is repr<CStruct> is export {
	has gdouble $.h is rw;
	has gdouble $.l is rw;
};

#| Skip Struct
class GOQuadD is repr<CStruct> is export {
	has Decimal64 $.h is rw;
	has Decimal64 $.l is rw;
}

#| Skip Struct
class GOQuadMatrixD is repr<CStruct> is export {
	has CArray[gpointer] $!data       ;  # [[GOQuad]]
	has gint             $.m     is rw;
	has gint             $.n     is rw;

	method data {
		my ($m, $n) = ($!m, $!n);

		my \T = class :: {
			method elems { $m }

			method AT-POS (Int() \k) {
				return Nil unless k ~~ 0 .. $.elems;

				GLib::Roles::TypedBuffer[GOQuadD].new(size => $n);
			}
	  }
		T.new;
  }
}

class GOQuadMatrix is repr<CStruct> is export {
	has GOQuad $.data;
	has gint   $.m     is rw;
	has gint   $.n     is rw;

	method data {
		my ($m, $n) = ($!m, $!n);

		my \T = class :: {
			method elems { $m }

			method AT-POS (Int() \k) {
				return Nil unless k ~~ 0 .. $.elems;

				GLib::Roles::TypedBuffer[GOQuad].new(size => $n);
			}
	  }
		T.new;
  }
}

# class GOQuadMatrixl is repr<CStruct> is export {
# 	has GOQuadl $!data;
# 	has gint     $.m    is rw;
# 	has gint     $.n    is rw;
# }

class GORect is repr<CStruct> is export {
	has GODistance $!top   ;
	has GODistance $!left  ;
	has GODistance $!bottom;
	has GODistance $!right ;
}

class GORegexp is repr<CStruct> is export {
	has size_t   $!re_nsub;
	has gboolean $!nosub  ;
	has gpointer $!ppcre  ;
}

class GORegmatch is repr<CStruct> is export {
	has GORegoff $!rm_so;
	has GORegoff $!rm_eo;
}

class GOSearchReplace is repr<CStruct> is export {
	HAS GObject  $!base         ;
	has Str     $!search_text  ;
	has Str     $!replace_text ;
	has GORegexp $!comp_search  ;
	has gboolean $!is_regexp    ;
	has gboolean $!ignore_case  ;
	has gboolean $!preserve_case;
	has gboolean $!match_words  ;
	has gboolean $!plain_replace;
}

# class GOSearchReplaceClass is repr<CStruct> is export {
# 	has GObjectClass $!g_object_class;
# }

class GOSelector is repr<CStruct> is export {
	HAS GtkBox   $!parent;
	has gpointer $!priv  ;
}

#| Skip Struct
class GOService is repr<CStruct> is export {
	HAS GObject  $!base  ;
	has GOPlugin $!plugin;
}

#| Skip Struct
class GOServiceSimple is repr<CStruct> is export {
	HAS GOService $!base;
}

class GOStyleLine is repr<CStruct> is export {
	has gdouble                  $!width      ;
	has GOLineDashType           $!dash_type  ;
	has gboolean                 $!auto_dash  ;
	has GOColor                  $!color      ;
	has GOColor                  $!fore       ;
	has gboolean                 $!auto_color ;
	has gboolean                 $!auto_fore  ;
	has gboolean                 $!auto_width ;
	has GOPatternType            $!pattern    ;
	has Cairo::cairo_line_cap_t  $!cap        ;
	has Cairo::cairo_line_join_t $!join       ;
	has gdouble                  $!miter_limit;
}

#| Skip Struct
class GOStyleInnerFillGradient is repr<CStruct> {
	has GOGradientDirection $.dir;
	has gdouble             $.brightness;
	has gboolean            $.auto_dir;
	has gboolean            $.auto_brightness;
}

#| Skip Struct
class GOStyleInnerFillImage is repr<CStruct> {
	has GOImageType $.type;
	has GOImage     $.image;
}

#| Skip Struct
class GOStyleInnerFill is repr<CStruct> {
	has GOStyleFill              $.type;
	has gboolean                 $.auto_type;
	has gboolean                 $.auto_fore;
	has gboolean                 $.auto_back;
	has gboolean                 $.auto_pattern;
	has gboolean                 $.invert_if_negative;
	has GOPattern                $.pattern;
	HAS GOStyleInnerFillGradient $.gradient;
	HAS GOStyleInnerFillImage    $.image;
	has guint64                  $!why;     #= Needs padding for some unknown reason.
}

class GOStyleMark is repr<CStruct> is export {
	has GOMarker $!mark              ;
	has gboolean $!auto_shape        ;
	has gboolean $!auto_outline_color;
	has gboolean $!auto_fill_color   ;
}

#| Skip Struct
class GOStyleFont is repr<CStruct> {
	has GOColor  $.color        is rw;
	has GOFont   $!font;
	has gboolean $.auto_scale;
	has gboolean $.auto_color;
	has gboolean $.auto_font;

	method font is rw {
		Proxy.new:
			FETCH => -> $              { $!font      },
			STORE => -> $, GOFont() \v { $!font := v }
  }
}

#| Skip Struct
class GOStyleTextLayout is repr<CStruct> {
  has gdouble   $.angle;
  has gboolean  $.auto_angle;
}

class GOStyle is repr<CStruct> is export {
  HAS GObject           $.base;
  has GOStyleFlag       $.interesting_fields is rw;
  has GOStyleFlag       $.disable_theming    is rw;
  HAS GOStyleLine       $.line;
  HAS GOStyleInnerFill  $.fill;
  HAS GOStyleMark       $.marker;
  HAS GOStyleFont       $.font;
  HAS GOStyleTextLayout $.text_layout;

	method interesting-fields is rw { $.interesting_fields }
	method flags              is rw { $.interesting_fields }
	method disable-theming    is rw { $.disable_theming    }
	method text-layout        is rw { $.text_layout        }
}

class GOUndo is repr<CStruct> is export {
	HAS GObject $!base;
}

class GOUndoBinary is repr<CStruct> is export {
	HAS GOUndo           $!base    ;
	has gpointer         $!a       ;
	has gpointer         $!b       ;
	has GOUndoBinaryFunc $!undo    ;
	has GFreeFunc        $!disposea;
	has GFreeFunc        $!disposeb;
}

# class GOUndoBinaryClass is repr<CStruct> is export {
# 	has GOUndoClass $!base;
# }

class GOUndoGroup is repr<CStruct> is export {
	HAS GOUndo    $!base ;
	has GPtrArray $!undos;
}

# class GOUndoGroupClass is repr<CStruct> is export {
# 	has GOUndoClass $!base;
# }

class GOUndoUnary is repr<CStruct> is export {
	HAS GOUndo          $!base    ;
	has gpointer        $!a       ;
	has GOUndoUnaryFunc $!undo    ;
	has GFreeFunc       $!disposea;
}

# class GOUndoUnaryClass is repr<CStruct> is export {
# 	has GOUndoClass $!base;
# }

class GoView is repr<CStruct> is export {
	has GObject $!base;
}

class GocItem is repr<CStruct> is export { ... }

class GocCanvas is repr<CStruct> is export {
	HAS GtkLayout    $!base           ;
	has gdouble      $!scroll_x1      ;
	has gdouble      $!scroll_y1      ;
	has gdouble      $!pixels_per_unit;
	has gint         $.width           is rw;
	has gint         $.height          is rw;
	has GocGroup     $!root           ;
	has GocItem      $!grabbed_item   ;
	has GocItem      $!last_item      ;
	has GODoc        $!document       ;
	has GdkEvent     $!cur_event      ;
	has GocDirection $!direction      ;
	has gpointer     $!priv           ;
}


class GocItem {
	HAS GObject                 $!base         ;
	has GocCanvas               $!canvas       ;
	has GocGroup                $!parent       ;
	has gboolean                $!cached_bounds;
	has gboolean                $!visible      ;
	has gboolean                $!realized     ;
	has gdouble                 $!x0           ;
	has gdouble                 $!y0           ;
	has gdouble                 $!x1           ;
	has gdouble                 $!y1           ;
	has Cairo::cairo_operator_t $!op           ;
	HAS Cairo::cairo_matrix_t   $!transform    ;
	has gboolean                $!transformed  ;
	has gpointer                $!priv         ;
}

class GocStyledItem is repr<CStruct> is export {
	HAS GocItem  $!base            ;
	has GOStyle  $!style           ;
	has gboolean $!scale_line_width;
	has gpointer $!priv            ;
}

class GocArc is repr<CStruct> is export {
	HAS GocStyledItem $!base       ;
	has gdouble        $!rotation   ;
	has gdouble        $!xc         ;
	has gdouble        $!yc         ;
	has gdouble        $!xr         ;
	has gdouble        $!yr         ;
	has gdouble        $!ang1       ;
	has gdouble        $!ang2       ;
	has gint32         $.type        is rw;
	HAS GOArrow        $!start_arrow;
	HAS GOArrow        $!end_arrow  ;
	has gpointer       $!priv       ;
}

class GocCircle is repr<CStruct> is export {
	HAS GocStyledItem $!base  ;
	has gdouble        $!x     ;
	has gdouble        $!y     ;
	has gdouble        $!radius;
	has gpointer      $!priv  ;
}

class GocEllipse is repr<CStruct> is export {
	HAS GocStyledItem $!base    ;
	has gdouble        $!rotation;
	has gdouble        $!x       ;
	has gdouble        $!y       ;
	has gdouble        $!width   ;
	has gdouble        $!height  ;
	has gpointer      $!priv    ;
}

class GocImage is repr<CStruct> is export {
	HAS GocItem  $!base       ;
	has gdouble   $!x          ;
	has gdouble   $!y          ;
	has gdouble   $!width      ;
	has gdouble   $!height     ;
	has gdouble   $!rotation   ;
	has gdouble   $!crop_left  ;
	has gdouble   $!crop_right ;
	has gdouble   $!crop_top   ;
	has gdouble   $!crop_bottom;
	has GOImage  $!image      ;
	has gpointer $!priv       ;
}

class GocIntArray is repr<CStruct> is export {
	has gint         $.refs is rw;
	has gint         $.n    is rw;
	has CArray[gint] $!vals      ;

	method vals {
		$!vals[ ^$!n ]
	}
}

class GocLine is repr<CStruct> is export {
	HAS GocStyledItem $!base       ;
	has gdouble        $!startx     ;
	has gdouble        $!starty     ;
	has gdouble        $!endx       ;
	has gdouble        $!endy       ;
	HAS GOArrow       $!start_arrow;
	HAS GOArrow       $!end_arrow  ;
	has gpointer      $!priv       ;
}

class GocPath is repr<CStruct> is export {
	HAS GocStyledItem $!base     ;
	has gdouble        $!rotation ;
	has gdouble        $!x        ;
	has gdouble        $!y        ;
	has gboolean      $!closed   ;
	has gboolean      $!fill_rule;
	has GOPath        $!path     ;
	has gpointer      $!priv     ;
}

class GocPixbuf is repr<CStruct> is export {
	HAS GocItem   $!base    ;
	has gdouble    $!x       ;
	has gdouble    $!y       ;
	has gdouble    $!width   ;
	has gdouble    $!height  ;
	has gdouble    $!rotation;
	has GdkPixbuf $!pixbuf  ;
	has gpointer  $!priv    ;
}

class GocPolygon is repr<CStruct> is export {
	HAS GocStyledItem $!base      ;
	has GocPoint      $.points     is rw;
	has gint           $.nb_points  is rw;
	has gboolean      $!use_spline;
	has gboolean      $!fill_rule ;
	has gint           $.nb_sizes   is rw;
	has gint           $.sizes      is rw;
	has gpointer      $!priv      ;
}

class GocPolyline is repr<CStruct> is export {
	HAS GocStyledItem $!base      ;
	has GocPoint      $.points     is rw;
	has gint           $.nb_points  is rw;
	has gboolean      $!use_spline;
	has gpointer      $!priv      ;
}

class GocRect is repr<CStruct> is export {
	has gdouble $!x     ;
	has gdouble $!y     ;
	has gdouble $!width ;
	has gdouble $!height;
}

class GocRectangle is repr<CStruct> is export {
	HAS GocStyledItem $!base    ;
	has gdouble        $!rotation;
	has gdouble        $!x       ;
	has gdouble        $!y       ;
	has gdouble        $!width   ;
	has gdouble        $!height  ;
	has gint           $.type     is rw;
	has gdouble        $!rx      ;
	has gdouble        $!ry      ;
	has gpointer      $!priv    ;
}

class GocText is repr<CStruct> does GLib::Roles::Pointers is export {
	HAS GocStyledItem $!base       ;
	has gdouble       $!rotation   ;
	has gdouble       $!x          ;
	has gdouble       $!y          ;
	has gdouble       $!w          ;
	has gdouble       $!h          ;
	has gboolean      $!clipped    ;
	has gdouble       $!clip_width ;
	has gdouble       $!clip_height;
	has gdouble       $!wrap_width ;
	has Str           $!text       ;
	has GOAnchorType  $!anchor     ;
	has PangoAttrList $!attributes ;
	has gpointer      $!priv       ;
}

class GogViewAllocation is repr<CStruct> is export {
	has gdouble $.w is rw;
	has gdouble $.h is rw;
	has gdouble $.x is rw;
	has gdouble $.y is rw;
}

#| Skip Struct
constant GOGeometryAABR is export = GogViewAllocation;

class GogObjectRoleUser is repr<CUnion> {
	has gint		 $.i;
	has gpointer $.p;
}

class GogObjectRole is repr<CStruct> is export {
	has Str                 $.id;
	has Str                 $.is_a_typename;
	has guint               $.priority;

	has guint32		  	      $.allowable_positions;
	has GogObjectPosition 	$.default_position;
	has GogObjectNamingConv	$.naming_conv;
	has gpointer            $.can_add;              #= gboolean   (*can_add)	  (GogObject const *parent);
	has gpointer            $.can_remove;           #= gboolean   (*can_remove)  (GogObject const *child);
	has gpointer            $.allocate;             #= GogObject *(*allocate)    (GogObject *parent);
	has gpointer            $.post_add;             #= void	   (*post_add)    (GogObject *parent, GogObject *child);
	has gpointer            $.pre_remove;           #= void       (*pre_remove)  (GogObject *parent, GogObject *child);
	has gpointer            $.post_remove;          #= void       (*post_remove) (GogObject *parent, GogObject *child);
	HAS GogObjectRoleUser   $.user
};


class GogObject is repr<CStruct> is export {
	HAS GObject		        $.base;
	has guint	            $.id;
	has Str		            $.user_name;
	has Str		            $.auto_name;
	has GogObjectRole     $.role;
	has GogObject	        $.parent;
	has GSList		        $.children;
	has GogObjectPosition $.position;
 	HAS GogViewAllocation $.manual_position;

	# unsigned needs_update : 1;
	# unsigned being_updated : 1;
	# unsigned explicitly_typed_role : 1;
	# unsigned invisible : 1;
	has guint8         $.flags;
	has gpointer       $!priv;
}

class GogPlotFamily is repr<CStruct> is export {
	has Str        $.name;
	has Str        $.sample-image-file;
	has gint32     $.priority            is rw;
	has GogAxisSet $.axis-set            is rw;
	has GHashTable $!types;

	method types ( :$raw = False ) {
		Proxy.new:
			FETCH => -> $ {
				use GLib::HashTable;

				return $!types if $raw;
				GLib::HashTable.new($!types);
		  },
			STORE => -> $, GHashTable() $v {
				self.^attributes.tail.set_value(self, $v);
		  }
  }

	method plot-types {
		$.types.map( |*.keys );
  }
}

class GogPlotType is repr<CStruct> is export {
	has GogPlotFamily $.family;
	has Str           $.engine;
	has Str           $.name;
	has Str           $.sample-image-file;
	has Str           $.description;
	has gint32        $.col;
	has gint32        $.row;
	has GHashTable    $.properties;
}

class GogStyledObject is repr<CStruct> is export {
	HAS GogObject $!base ;
	has GOStyle   $!style;
}

class GogOutlinedObject is repr<CStruct> is export {
	HAS GogStyledObject $!base       ;
	has gdouble          $!padding_pts;
}

class GogTrendLine is repr<CStruct> is export {
	HAS GogStyledObject $!base;
}

class GogChart is repr<CStruct> is export {
	HAS GogOutlinedObject $!base                      ;
	has GSList            $!plots                     ;
	has gint              $.full_cardinality     is rw;
	has gint              $.visible_cardinality  is rw;
	has gboolean          $.cardinality_valid         ;
	has gint              $.x_pos                is rw;
	has gint              $.y_pos                is rw;
	has gint              $.cols                 is rw;
	has gint              $.rows                 is rw;
	has gint              $.x_pos_actual         is rw;
	has gint              $.y_pos_actual         is rw;
	has GogObject         $.grid                      ;
	has GSList            $.axes                      ;
	has GogAxisSet        $.axis_set                  ;
	HAS GogViewAllocation $.plot_area                 ;
	has gboolean          $.is_plot_area_manual       ;
}

class GogDatasetElement is repr<CStruct> is export {
  has GOData     $.data;
  has GogDataset $.set;
  has gint       $.dim_i;
  has gulong     $.handler;
}

class GogAxisTick is repr<CStruct> is export {
	has gdouble          $!position;
	has GogAxisTickTypes $!type    ;
	has GOString         $!str     ;
}

#| Skip Struct
class GogAxisTickProperties is repr<CStruct> is export {
  has gboolean $.tick_in  is rw;
	has gboolean $.tick_out is rw;
  has gint     $.size_pts is rw;
}

class GogAxis is repr<CStruct> is export does StructActualName['_GogAxis']
{ ... }

class GogSeriesDimDesc is repr<CStruct> is export {
  has Str               $.name;
  has GogSeriesPriority $.priority;
  has gboolean          $.is_shared;
  has GogDimType        $.val_type;
  has GogMSDimType      $.ms_type;
}

class GogSeriesDesc is repr<CStruct> is export {
	has guint32          $.style_fields;
	has guint32          $.num-dim;
  has GogSeriesDimDesc $.dim;
}

class GogPlotDesc is repr<CStruct> is export {
	has gint          $.num_series_max is rw;
	HAS GogSeriesDesc $.dim                 ;
}

class GogPlot is repr<CStruct> is export {
	HAS GogObject             $.base                           ;
	has GSList                $.series                         ;
	has guint32               $.full_cardinality               ;
	has guint32               $.visible_cardinality            ;
	has gboolean              $!cardinality_valid              ;
	has guint32               $.index_num                      ;
	has gboolean              $.vary_style_by_element          ;
	has GogPlotRenderingOrder $.rendering_order                ;
	has Str                   $.plot_group                     ;
	has Str                   $.guru_hints                     ;
	has GOLineInterpolation   $.interpolation                  ;
	HAS gpointer              @.axis[GOG_AXIS_TYPES]  is CArray; #= [GogAxis]
	HAS GogPlotDesc           $.desc                           ;
}

class GogAxisBase is repr<CStruct> is export {
	HAS GogStyledObject       $!base              ;
	has GogChart              $!chart             ;
	has GogAxis               $!axis              ;
	has GogAxisPosition       $!position          ;
	has gint                  $.crossed_axis_id   ;
	HAS GogDatasetElement     $!cross_location    ;
	has gint                  $.padding           ;
	has GogAxisTickProperties $!major             ;
	has GogAxisTickProperties $!minor             ;
	has gboolean              $!major_tick_labeled;
}

class GogAxis {
  HAS GogAxisBase       $.base                                           ;
  has GogAxisType       $.type                                           ;
  has GSList            $.contributors                                   ;
  HAS GogDatasetElement @.source[GOG_AXIS_ELEM_CROSS_POINT]     is CArray;
  HAS gdouble           @.auto_bound[GOG_AXIS_ELEM_CROSS_POINT] is CArray;
  has gboolean          $.inverted                                       ;
  has gdouble           $.min_val                                        ;
	has gdouble           $.max_val                                        ;
  has gdouble           $.logical_min_val                                ;
	has gdouble           $.logical_max_val                                ;
  has GogObject         $.min_contrib                                    ;
	has GogObject         $.max_contrib                                    ;
  has gboolean          $.is_discrete                                    ;
  has gboolean          $.center_on_ticks                                ;
  has GOData            $.labels                                         ;
  has GogPlot           $.plot_that_supplied_labels                      ;
  has GOFormat          $.format                                         ;
	has GOFormat          $.assigned_format                                ;
  has GogAxisMapDesc    $.map_desc                                       ;
  has GogAxisMapDesc    $.actual_map_desc                                ;
  has GODateConventions $.date_conv                                      ;
  has GogAxisPolarUnit  $.polar_unit                                     ;
  has gdouble           $.circular_rotation                              ;
  has GogAxisTick       $.ticks                                          ;
  has guint32           $.tick_nbr                                       ;
  has gdouble           $.span_start                                     ;
	has gdouble           $.span_end                                       ;
  has GogAxisColorMap   $.color_map                                      ;
  has gboolean          $.auto_color_map                                 ;
  has GogColorScale     $.color_scale                                    ;
  has GogAxisMetrics    $.metrics                                        ;
  has GogAxis           $.ref_axis                                       ;
  has GSList            $.refering_axes                                  ;
  has gdouble           $.metrics_ratio                                  ;
  has GoUnitId          $.unit                                           ;
  has gdouble           $.display_factor                                 ;
}

class GOFormatCurrency is repr<CStruct> is export {
  has Str      $.symbol           ;
  has Str      $.description      ;
  has gboolean $.precedes    is rw;
  has gboolean $.has_space   is rw;
}

class GogView is repr<CStruct> is export {
	HAS GObject           $.base;
	has GogObject         $.model;
	has GogRenderer       $.renderer;
	has GogView           $.parent;
	has GSList            $.children;
	HAS GogViewAllocation $.allocation;
	HAS GogViewAllocation $.residual;

	has guint8            $.bit-fields;
	# unsigned allocation_valid: 1;
	# unsigned child_allocations_valid: 1;
	# unsigned being_updated: 1;

	has GSList            $.toolkit;
	has gpointer          $!priv;
}

class GogAxisBaseView is repr<CStruct> is export {
	HAS GogView $!base   ;
	has gdouble  $!x_start;
	has gdouble  $!y_start;
	has gdouble  $!x_stop ;
	has gdouble  $!y_stop ;
}

class GogChartMapPolarData is repr<CStruct> is export {
	has gdouble $!cx ;
	has gdouble $!cy ;
	has gdouble $!rx ;
	has gdouble $!ry ;
	has gdouble $!th0;
	has gdouble $!th1;
}

class GogSeriesLabelElt is repr<CStruct> is export {
	has GOString  $!str       ;
	has gint      $.legend_pos is rw;
	has GogObject $!point     ;
}

class GogDataLabel is repr<CStruct> is export {
	HAS GogOutlinedObject  $!base                       ;
	has gint               $.index            is rw     ;
	has GogSeriesLabelsPos $!position                   ;
	has GogSeriesLabelsPos $!default_pos                ;
	has gint               $.allowed_pos      is rw     ;
	has gint               $.offset           is rw     ;
	has Str                $!format                     ;
	has Str                $!separator                  ;
	HAS GogDatasetElement  @!custom_label[2]  is CArray ;
	HAS GogSeriesLabelElt  $!element                    ;
	has gboolean           $!supports_percent           ;
}

class GogErrorBar is repr<CStruct> is export {
	HAS GObject            $!base         ;
	has GogErrorBarType    $!type         ;
	has GogSeries          $!series       ;
	has gint               $.dim_i   is rw;
	has gint               $.error_i is rw;
	has GogErrorBarDisplay $!display      ;
	has gdouble            $!width        ;
	has GOStyle            $!style        ;
}

class GogGraph is repr<CStruct> is export {
	HAS GogOutlinedObject $!base        ;
	has GogTheme          $!theme       ;
	has GSList            $!charts      ;
	has GSList            $!data        ;
	has gint              $.num_cols     is rw;
	has gint              $.num_rows     is rw;
	has gdouble           $!width       ;
	has gdouble           $!height      ;
	has guint             $.idle_handler is rw;
	has GHashTable        $!data_refs   ;
	has GODoc             $!doc         ;
}

class GogOutlinedView is repr<CStruct> is export {
	HAS GogView $!base;
}

class GogPlotView is repr<CStruct> is export {
	HAS GogView $!base;
}

class GogRegCurve is repr<CStruct> is export {
	HAS GogTrendLine             $!base          ;
	has gboolean                 $!weighted      ;
	has GogDatasetElement        $!bounds        ;
	has gboolean                 $!skip_invalid  ;
	has gint                     $.ninterp        is rw;
	has gdouble                  $!a             ;
	has gdouble                  $!R2            ;
	has Str                      $!equation      ;
	has GogRegCurveDrawingBounds $!drawing_bounds;
	has gpointer                 $!priv          ;
}

class GogSeriesElement is repr<CStruct> is export {
	HAS GogStyledObject $.base       ;
	has gint            $.index is rw;
}

class GogSeriesLabels is repr<CStruct> is export {
	HAS GogOutlinedObject  $.base                      ;
	has GogSeriesLabelsPos $.position                  ;
	has GogSeriesLabelsPos $.default_pos               ;
	has gint               $.allowed_pos      is rw    ;
	has gint               $.offset           is rw    ;
	has Str                $.format                    ;
	has Str                $.separator                 ;
	HAS GogDatasetElement  @.custom_labels[2] is CArray;
	has gint               $.n_elts           is rw    ;
	has GogSeriesLabelElt  $.elements                  ;
	has GList              $.overrides                 ;
	has gboolean           $.supports_percent          ;
}

# class GogSmoothedCurveClass is repr<CStruct> is export {
# 	HAS GogTrendLineClass $!base   ;
# 	has gint               $.max_dim is rw;
# }


class GogText is repr<CStruct> is export {
	HAS GogOutlinedObject $!base        ;
	has gboolean          $!allow_markup;
	has gboolean          $!rotate_frame;
	has gboolean          $!rotate_bg   ;
	has gboolean          $!allow_wrap  ;
}

class GogToolAction is repr<CStruct> is export {
	has gdouble  $.start_x        ;
	has gdouble  $.start_y        ;
	has GogView  $.view           ;
	has GogTool  $.tool           ;
	has gpointer $.data           ;
	has gint     $.ref_count is rw;
}

class GogTrendLineType is repr<CStruct> is export {
	has Str        $.engine     ;
	has Str        $.name       ;
	has Str        $.description;
	has GHashTable $.properties ;
}

class GogViewPadding is repr<CStruct> is export {
	has gdouble $.swr is rw;
	has gdouble $.shb is rw;
	has gdouble $.swl is rw;
	has gdouble $.sht is rw;
}

class GogViewRequisition is repr<CStruct> is export {
	has gdouble $.w is rw;
	has gdouble $.h is rw;
}

class coords is repr<CStruct> is export {
	has guint  $.timer_id is rw;
	has gdouble $!x       ;
	has gdouble $!y       ;
}

class count is repr<CStruct> is export {
	has gint $.total   is rw;
	has gint $.last    is rw;
	has gint $.current is rw;
	has gint $.step    is rw;
}

class go_regression_stat_t is repr<CStruct> is export {
	has gdouble $!se       ;
	has gdouble $!t        ;
	has gdouble $!sqr_r    ;
	has gdouble $!adj_sqr_r;
	has gdouble $!se_y     ;
	has gdouble $!F        ;
	has gint    $.df_reg    is rw;
	has gint    $.df_resid  is rw;
	has gint    $.df_total  is rw;
	has gdouble $!ss_reg   ;
	has gdouble $!ss_resid ;
	has gdouble $!ss_total ;
	has gdouble $!ms_reg   ;
	has gdouble $!ms_resid ;
	has gdouble $!ybar     ;
	has gdouble $!xbar     ;
	has gdouble $!var      ;
	has gint    $.ref_count is rw;
}

class go_regression_stat_tD is repr<CStruct> is export {
	has Decimal64 $!se       ;
	has Decimal64 $!t        ;
	has Decimal64 $!sqr_r    ;
	has Decimal64 $!adj_sqr_r;
	has Decimal64 $!se_y     ;
	has Decimal64 $!F        ;
	has gint        $.df_reg    is rw;
	has gint        $.df_resid  is rw;
	has gint        $.df_total  is rw;
	has Decimal64 $!ss_reg   ;
	has Decimal64 $!ss_resid ;
	has Decimal64 $!ss_total ;
	has Decimal64 $!ms_reg   ;
	has Decimal64 $!ms_resid ;
	has Decimal64 $!ybar     ;
	has Decimal64 $!xbar     ;
	has Decimal64 $!var      ;
	has gint        $.ref_count is rw;
}

class go_regression_stat_tl is repr<CStruct> is export {
	has gdouble $!se       ;
	has gdouble $!t        ;
	has gdouble $!sqr_r    ;
	has gdouble $!adj_sqr_r;
	has gdouble $!se_y     ;
	has gdouble $!F        ;
	has gint    $.df_reg    is rw;
	has gint    $.df_resid  is rw;
	has gint    $.df_total  is rw;
	has gdouble $!ss_reg   ;
	has gdouble $!ss_resid ;
	has gdouble $!ss_total ;
	has gdouble $!ms_reg   ;
	has gdouble $!ms_resid ;
	has gdouble $!ybar     ;
	has gdouble $!xbar     ;
	has gdouble $!var      ;
	has gint    $.ref_count is rw;
}

class gradient is repr<CStruct> is export {
	has GOGradientDirection $!dir            ;
	has gdouble              $!brightness     ;
	has gboolean            $!auto_dir       ;
	has gboolean            $!auto_brightness;
}

class image is repr<CStruct> is export {
	has GOImageType $!type ;
	has GOImage     $!image;
}

class mem is repr<CStruct> is export {
	has Str  $!start;
	has gint $.size  is rw;
}

class text_layout is repr<CStruct> is export {
	has gdouble   $!angle     ;
	has gboolean $!auto_angle;
}

class value is repr<CStruct> is export {
	has gint $.total is rw;
	has gint $.last  is rw;
	has gint $.step  is rw;
}

class workbook is repr<CStruct> is export {
	has gint $.n_elements is rw;
	has gint $.last       is rw;
	has gint $.current    is rw;
	has gint $.step       is rw;
}
