  method _builtins {
    _go_format_builtins($!gf);
  }

  method _currencies {
    _go_format_currencies($!gf);
  }

  method _go_currency_date_format_init {
    _go_currency_date_format_init($!gf);
  }

  method _go_currency_date_format_shutdown {
    _go_currency_date_format_shutdown($!gf);
  }

  method _go_number_format_init {
    _go_number_format_init($!gf);
  }

  method _go_number_format_shutdown {
    _go_number_format_shutdown($!gf);
  }

  method allow_ee_markup {
    go_format_allow_ee_markup($!gf);
  }

  method allow_pi_slash {
    go_format_allow_pi_slash($!gf);
  }

  method allow_si {
    go_format_allow_si($!gf);
  }

  method as_XL {
    go_format_as_XL($!gf);
  }

  method currency_get_type {
    go_format_currency_get_type();
  }

  method dec_precision {
    go_format_dec_precision($!gf);
  }

  method default_accounting {
    go_format_default_accounting($!gf);
  }

  method default_date {
    go_format_default_date($!gf);
  }

  method default_date_time {
    go_format_default_date_time($!gf);
  }

  method default_money {
    go_format_default_money($!gf);
  }

  method default_percentage {
    go_format_default_percentage($!gf);
  }

  method default_time {
    go_format_default_time($!gf);
  }

  method details_finalize {
    go_format_details_finalize($!gf);
  }

  method details_free {
    go_format_details_free($!gf);
  }

  method details_get_type {
    go_format_details_get_type();
  }

  method details_init (
    GOFormatDetails $details,
    GOFormatFamily  $family
  ) {
    go_format_details_init($!gf, $family);
  }

  method details_new {
    go_format_details_new();
  }

  method empty {
    go_format_empty($!gf);
  }

  method eq (
    GOFormat $a,
    GOFormat $b
  ) {
    go_format_eq($!gf, $b);
  }

  method foreach (gpointer $user_data) {
    go_format_foreach($!gf, $user_data);
  }

  method general {
    go_format_general($!gf);
  }

  method generate_number_str (
    GString  $dst,
    gint     $min_digits,
    gint     $num_decimals,
    gboolean $thousands_sep,
    gboolean $negative_red,
    gboolean $negative_paren,
    Str      $prefix,
    Str      $postfix
  ) {
    go_format_generate_number_str($!gf, $min_digits, $num_decimals, $thousands_sep, $negative_red, $negative_paren, $prefix, $postfix);
  }

  method generate_str (
    GString         $dst,
    GOFormatDetails $details
  ) {
    go_format_generate_str($!gf, $details);
  }

  method get_details (
    GOFormat        $fmt,
    GOFormatDetails $dst,
    gboolean        $exact
  ) {
    go_format_get_details($!gf, $dst, $exact);
  }

  method get_family {
    go_format_get_family($!gf);
  }

  method get_magic {
    go_format_get_magic($!gf);
  }

  method get_markup {
    go_format_get_markup($!gf);
  }

  method get_type {
    go_format_get_type();
  }

  method go_render_general (
    PangoLayout     $layout,
    GString         $str,
    GOFormatMeasure $measure,
    GOFontMetrics   $metrics,
    gdouble         $val,
    gint            $col_width,
    gboolean        $unicode_minus,
    guint           $numeral_shape,
    guint           $custom_shape_flags
  ) {
    go_render_general($!gf, $str, $measure, $metrics, $val, $col_width, $unicode_minus, $numeral_shape, $custom_shape_flags);
  }

  method go_render_generalD (
    PangoLayout     $layout,
    GString         $str,
    GOFormatMeasure $measure,
    GOFontMetrics   $metrics,
    _Decimal64      $val,
    gint            $col_width,
    gboolean        $unicode_minus,
    guint           $numeral_shape,
    guint           $custom_shape_flags
  ) {
    go_render_generalD($!gf, $str, $measure, $metrics, $val, $col_width, $unicode_minus, $numeral_shape, $custom_shape_flags);
  }

  method go_render_generall (
    PangoLayout     $layout,
    GString         $str,
    GOFormatMeasure $measure,
    GOFontMetrics   $metrics,
    gdouble         $val,
    gint            $col_width,
    gboolean        $unicode_minus,
    guint           $numeral_shape,
    guint           $custom_shape_flags
  ) {
    go_render_generall($!gf, $str, $measure, $metrics, $val, $col_width, $unicode_minus, $numeral_shape, $custom_shape_flags);
  }

  method has_day {
    go_format_has_day($!gf);
  }

  method has_hour {
    go_format_has_hour($!gf);
  }

  method has_minute {
    go_format_has_minute($!gf);
  }

  method has_month {
    go_format_has_month($!gf);
  }

  method has_year {
    go_format_has_year($!gf);
  }

  method inc_precision {
    go_format_inc_precision($!gf);
  }

  method is_date {
    go_format_is_date($!gf);
  }

  method is_general {
    go_format_is_general($!gf);
  }

  method is_invalid {
    go_format_is_invalid($!gf);
  }

  method is_markup {
    go_format_is_markup($!gf);
  }

  method is_simple {
    go_format_is_simple($!gf);
  }

  method is_text {
    go_format_is_text($!gf);
  }

  method is_time {
    go_format_is_time($!gf);
  }

  method is_var_width {
    go_format_is_var_width($!gf);
  }

  method locale_currency {
    go_format_locale_currency($!gf);
  }

  method measure_pango (
    GString     $str,
    PangoLayout $layout
  ) {
    go_format_measure_pango($!gf, $layout);
  }

  method measure_strlen (
    GString     $str,
    PangoLayout $layout
  ) {
    go_format_measure_strlen($!gf, $layout);
  }

  method measure_zero (
    GString     $str,
    PangoLayout $layout
  ) {
    go_format_measure_zero($!gf, $layout);
  }

  method month_before_day {
    go_format_month_before_day($!gf);
  }

  method new_from_XL (Str $str) {
    go_format_new_from_XL($!gf, $str);
  }

  method new_magic (GOFormatMagic $m) {
    go_format_new_magic($!gf, $m);
  }

  method new_markup (
    PangoAttrList $markup,
    gboolean      $add_ref
  ) {
    go_format_new_markup($!gf, $markup, $add_ref);
  }

  method odf_style_map (
    GOFormat $fmt,
    gint     $cond_part
  ) {
    go_format_odf_style_map($!gf, $cond_part);
  }

  method output_to_odf (
    GsfXMLOut $xout,
    GOFormat  $fmt,
    gint      $cond_part,
    Str       $name,
    gboolean  $with_extension
  ) {
    go_format_output_to_odf($!gf, $fmt, $cond_part, $name, $with_extension);
  }

  method palette_color_of_index {
    go_format_palette_color_of_index($!gf);
  }

  method palette_index_from_color {
    go_format_palette_index_from_color($!gf);
  }

  method palette_name_of_index {
    go_format_palette_name_of_index($!gf);
  }

  method ref {
    go_format_ref($!gf);
  }

  method specialize (
    GOFormat $fmt,
    gdouble  $val,
    Str      $type,
    gboolean $inhibit_minus
  ) {
    go_format_specialize($!gf, $val, $type, $inhibit_minus);
  }

  method specializeD (
    GOFormat   $fmt,
    _Decimal64 $val,
    Str        $type,
    gboolean   $inhibit_minus
  ) {
    go_format_specializeD($!gf, $val, $type, $inhibit_minus);
  }

  method specializel (
    GOFormat $fmt,
    gdouble  $val,
    Str      $type,
    gboolean $inhibit_minus
  ) {
    go_format_specializel($!gf, $val, $type, $inhibit_minus);
  }

  method str_delocalize {
    go_format_str_delocalize($!gf);
  }

  method str_localize {
    go_format_str_localize($!gf);
  }

  method toggle_1000sep {
    go_format_toggle_1000sep($!gf);
  }

  method unref {
    go_format_unref($!gf);
  }

  method value (
    GOFormat $fmt,
    gdouble  $val
  ) {
    go_format_value($!gf, $val);
  }

  method valueD (
    GOFormat   $fmt,
    _Decimal64 $val
  ) {
    go_format_valueD($!gf, $val);
  }

  method value_gstring (
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
  ) {
    go_format_value_gstring($!gf, $str, $measure, $metrics, $fmt, $val, $type, $sval, $go_color, $col_width, $date_conv, $unicode_minus);
  }

  method value_gstringD (
    PangoLayout       $layout,
    GString           $str,
    GOFormatMeasure   $measure,
    GOFontMetrics     $metrics,
    GOFormat          $fmt,
    _Decimal64        $val,
    Str               $type,
    Str               $sval,
    GOColor           $go_color,
    gint              $col_width,
    GODateConventions $date_conv,
    gboolean          $unicode_minus
  ) {
    go_format_value_gstringD($!gf, $str, $measure, $metrics, $fmt, $val, $type, $sval, $go_color, $col_width, $date_conv, $unicode_minus);
  }

  method value_gstringl (
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
  ) {
    go_format_value_gstringl($!gf, $str, $measure, $metrics, $fmt, $val, $type, $sval, $go_color, $col_width, $date_conv, $unicode_minus);
  }

  method valuel (
    GOFormat $fmt,
    gdouble  $val
  ) {
    go_format_valuel($!gf, $val);
  }

