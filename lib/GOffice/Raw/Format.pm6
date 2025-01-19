use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Format;

### /usr/src/goffice/goffice/utils/go-format.h

# sub _go_format_builtins (GOFormatFamily $fam)
#   returns Str
#   is      native(goffice)
#   is      export
# { * }
#
# sub _go_format_currencies
#   returns GOFormatCurrency
#   is      native(goffice)
#   is      export
# { * }
#
# sub _go_currency_date_format_init
#   is      native(goffice)
#   is      export
# { * }
#
# sub _go_currency_date_format_shutdown
#   is      native(goffice)
#   is      export
# { * }
#
# sub _go_number_format_init
#   is      native(goffice)
#   is      export
# { * }
#
# sub _go_number_format_shutdown
#   is      native(goffice)
#   is      export
# { * }

sub go_format_allow_ee_markup
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_allow_pi_slash
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_allow_si
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_as_XL (GOFormat $fmt)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_currency_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_format_dec_precision (GOFormat $fmt)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_accounting
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_date
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_date_time
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_money
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_percentage
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_default_time
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_details_finalize (GOFormatDetails $details)
  is      native(goffice)
  is      export
{ * }

sub go_format_details_free (GOFormatDetails $details)
  is      native(goffice)
  is      export
{ * }

sub go_format_details_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_format_details_init (
  GOFormatDetails $details,
  GOFormatFamily  $family
)
  is      native(goffice)
  is      export
{ * }

sub go_format_details_new (GOFormatFamily $family)
  returns GOFormatDetails
  is      native(goffice)
  is      export
{ * }

sub go_format_empty
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_eq (
  GOFormat $a,
  GOFormat $b
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_foreach (
  GHFunc   $func,
  gpointer $user_data
)
  is      native(goffice)
  is      export
{ * }

sub go_format_general
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_generate_number_str (
  GString  $dst,
  gint     $min_digits,
  gint     $num_decimals,
  gboolean $thousands_sep,
  gboolean $negative_red,
  gboolean $negative_paren,
  Str      $prefix,
  Str      $postfix
)
  is      native(goffice)
  is      export
{ * }

sub go_format_generate_str (
  GString         $dst,
  GOFormatDetails $details
)
  is      native(goffice)
  is      export
{ * }

sub go_format_get_details (
  GOFormat        $fmt,
  GOFormatDetails $dst,
  gboolean        $exact
)
  is      native(goffice)
  is      export
{ * }

sub go_format_get_family (GOFormat $fmt)
  returns GOFormatFamily
  is      native(goffice)
  is      export
{ * }

sub go_format_get_magic (GOFormat $fmt)
  returns GOFormatMagic
  is      native(goffice)
  is      export
{ * }

sub go_format_get_markup (GOFormat $fmt)
  returns PangoAttrList
  is      native(goffice)
  is      export
{ * }

sub go_format_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_render_general (
  PangoLayout     $layout,
  GString         $str,
  GOFormatMeasure $measure,
  GOFontMetrics   $metrics,
  gdouble         $val,
  gint            $col_width,
  gboolean        $unicode_minus,
  guint           $numeral_shape,
  guint           $custom_shape_flags
)
  is      native(goffice)
  is      export
{ * }

sub go_render_generalD (
  PangoLayout     $layout,
  GString         $str,
  GOFormatMeasure $measure,
  GOFontMetrics   $metrics,
  Decimal64       $val,
  gint            $col_width,
  gboolean        $unicode_minus,
  guint           $numeral_shape,
  guint           $custom_shape_flags
)
  is      native(goffice)
  is      export
{ * }

sub go_render_generall (
  PangoLayout     $layout,
  GString         $str,
  GOFormatMeasure $measure,
  GOFontMetrics   $metrics,
  gdouble         $val,
  gint            $col_width,
  gboolean        $unicode_minus,
  guint           $numeral_shape,
  guint           $custom_shape_flags
)
  is      native(goffice)
  is      export
{ * }

sub go_format_has_day (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_has_hour (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_has_minute (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_has_month (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_has_year (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_inc_precision (GOFormat $fmt)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_is_date (GOFormat $fmt)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_is_general (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_is_invalid (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_is_markup (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_is_simple (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_is_text (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_is_time (GOFormat $fmt)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_is_var_width (GOFormat $fmt)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_locale_currency
  returns GOFormatCurrency
  is      native(goffice)
  is      export
{ * }

sub go_format_measure_pango (
  GString     $str,
  PangoLayout $layout
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_measure_strlen (
  GString     $str,
  PangoLayout $layout
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_measure_zero (
  GString     $str,
  PangoLayout $layout
)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_month_before_day (GOFormat $fmt)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_new_from_XL (Str $str)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_new_magic (GOFormatMagic $m)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_new_markup (
  PangoAttrList $markup,
  gboolean      $add_ref
)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_odf_style_map (
  GOFormat $fmt,
  gint     $cond_part
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_output_to_odf (
  GsfXMLOut $xout,
  GOFormat  $fmt,
  gint      $cond_part,
  Str       $name,
  gboolean  $with_extension
)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_format_palette_color_of_index (gint $i)
  returns GOColor
  is      native(goffice)
  is      export
{ * }

sub go_format_palette_index_from_color (GOColor $c)
  returns gint
  is      native(goffice)
  is      export
{ * }

sub go_format_palette_name_of_index (gint $i)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_ref (GOFormat $fmt)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_specialize (
  GOFormat $fmt,
  gdouble  $val,
  Str      $type,
  gboolean $inhibit_minus
)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_specializeD (
  GOFormat   $fmt,
  Decimal64  $val,
  Str        $type,
  gboolean   $inhibit_minus
)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_specializel (
  GOFormat $fmt,
  gdouble  $val,
  Str      $type,
  gboolean $inhibit_minus
)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_str_delocalize (Str $str)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_str_localize (Str $str)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_toggle_1000sep (GOFormat $fmt)
  returns GOFormat
  is      native(goffice)
  is      export
{ * }

sub go_format_unref (GOFormat $fmt)
  is      native(goffice)
  is      export
{ * }

sub go_format_value (
  GOFormat $fmt,
  gdouble  $val
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_valueD (
  GOFormat  $fmt,
  Decimal64 $val
)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_format_value_gstring (
  PangoLayout       $layout,
  GString           $str,
  GOFormatMeasure   $measure,
  GOFontMetrics     $metrics,
  GOFormat          $fmt,
  gdouble           $val,
  Str               $type,
  Str               $sval,
  GOColor           $go_color,
  gint              $col_width,
  GODateConventions $date_conv,
  gboolean          $unicode_minus
)
  returns GOFormatNumberError
  is      native(goffice)
  is      export
{ * }

sub go_format_value_gstringD (
  PangoLayout       $layout,
  GString           $str,
  GOFormatMeasure   $measure,
  GOFontMetrics     $metrics,
  GOFormat          $fmt,
  Decimal64         $val,
  Str               $type,
  Str               $sval,
  GOColor           $go_color,
  gint              $col_width,
  GODateConventions $date_conv,
  gboolean          $unicode_minus
)
  returns GOFormatNumberError
  is      native(goffice)
  is      export
{ * }

sub go_format_value_gstringl (
  PangoLayout       $layout,
  GString           $str,
  GOFormatMeasure   $measure,
  GOFontMetrics     $metrics,
  GOFormat          $fmt,
  gdouble           $val,
  Str               $type,
  Str               $sval,
  GOColor           $go_color,
  gint              $col_width,
  GODateConventions $date_conv,
  gboolean          $unicode_minus
)
  returns GOFormatNumberError
  is      native(goffice)
  is      export
{ * }

sub go_format_valuel (
  GOFormat $fmt,
  gdouble  $val
)
  returns Str
  is      native(goffice)
  is      export
{ * }
