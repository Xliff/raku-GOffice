use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

unit package GOffice::Raw::Enums;

constant GOActionComboTextSearchDir is export := guint32;
our enum GOActionComboTextSearchDirEnum is export <
  GO_ACTION_COMBO_SEARCH_FROM_TOP
  GO_ACTION_COMBO_SEARCH_CURRENT
  GO_ACTION_COMBO_SEARCH_NEXT
>;

constant GOAnchorType is export := guint32;
our enum GOAnchorTypeEnum is export <
  GO_ANCHOR_CENTER
  GO_ANCHOR_NORTH
  GO_ANCHOR_NORTH_WEST
  GO_ANCHOR_NORTH_EAST
  GO_ANCHOR_SOUTH
  GO_ANCHOR_SOUTH_WEST
  GO_ANCHOR_SOUTH_EAST
  GO_ANCHOR_WEST
  GO_ANCHOR_EAST
  GO_ANCHOR_BASELINE_CENTER
  GO_ANCHOR_BASELINE_WEST
  GO_ANCHOR_BASELINE_EAST
  GO_ANCHOR_N
  GO_ANCHOR_NW
  GO_ANCHOR_NE
  GO_ANCHOR_S
  GO_ANCHOR_SW
  GO_ANCHOR_SE
  GO_ANCHOR_W
  GO_ANCHOR_E
  GO_ANCHOR_B
  GO_ANCHOR_BW
  GO_ANCHOR_BE
>;

constant GocArcType is export := guint32;
our enum GocArcTypeEnum is export <
  ARC_TYPE_ARC
  ARC_TYPE_CHORD
  ARC_TYPE_PIE
>;

constant GOArrowType is export := guint32;
our enum GOArrowTypeEnum is export <
  GO_ARROW_NONE
  GO_ARROW_KITE
  GO_ARROW_OVAL
>;

constant GOBasisType is export := guint32;
our enum GOBasisTypeEnum is export <
  GO_BASIS_MSRB_30_360
  GO_BASIS_ACT_ACT
  GO_BASIS_ACT_360
  GO_BASIS_ACT_365
  GO_BASIS_30E_360
  GO_BASIS_30Ep_360
  GO_BASIS_MSRB_30_360_SYM
>;

constant GOCSplineType is export := guint32;
our enum GOCSplineTypeEnum is export <
  GO_CSPLINE_NATURAL
  GO_CSPLINE_PARABOLIC
  GO_CSPLINE_CUBIC
  GO_CSPLINE_CLAMPED
  GO_CSPLINE_MAX
>;

constant GOCharmapSelTestDirection is export := guint32;
our enum GOCharmapSelTestDirectionEnum is export <
  GO_CHARMAP_SEL_TO_UTF8
  GO_CHARMAP_SEL_FROM_UTF8
>;

constant GODataFlags is export := guint32;
our enum GODataFlagsEnum is export <
  GO_DATA_CACHE_IS_VALID
  GO_DATA_IS_EDITABLE
  GO_DATA_SIZE_CACHED
  GO_DATA_HAS_VALUE
>;

constant GODirection is export := guint32;
our enum GODirectionEnum is export <
  GO_DIRECTION_UP
  GO_DIRECTION_DOWN
  GO_DIRECTION_LEFT
  GO_DIRECTION_RIGHT
  GO_DIRECTION_NONE
>;

constant GODistributionType is export := gint32;
our enum GODistributionTypeEnum is export <
  GO_DISTRIBUTION_INVALID
  GO_DISTRIBUTION_NORMAL
  GO_DISTRIBUTION_UNIFORM
  GO_DISTRIBUTION_CAUCHY
  GO_DISTRIBUTION_WEIBULL
  GO_DISTRIBUTION_LOGNORMAL
  GO_DISTRIBUTION_MAX
>;

constant GODocControlState is export := guint32;
our enum GODocControlStateEnum is export <
  GO_DOC_CONTROL_STATE_NORMAL
  GO_DOC_CONTROL_STATE_FULLSCREEN
  GO_DOC_CONTROL_STATE_MAX
>;

constant GODotDot is export := guint32;
our enum GODotDotEnum is export <
  GO_DOTDOT_SYNTACTIC
  GO_DOTDOT_TEST
  GO_DOTDOT_LEAVE
>;

constant GODrawingAnchorDir is export := guint32;
our enum GODrawingAnchorDirEnum is export <
  GOD_ANCHOR_DIR_UNKNOWN
  GOD_ANCHOR_DIR_UP_LEFT
  GOD_ANCHOR_DIR_UP_RIGHT
  GOD_ANCHOR_DIR_DOWN_LEFT
  GOD_ANCHOR_DIR_DOWN_RIGHT
  GOD_ANCHOR_DIR_NONE_MASK
  GOD_ANCHOR_DIR_H_MASK
  GOD_ANCHOR_DIR_RIGHT
  GOD_ANCHOR_DIR_V_MASK
  GOD_ANCHOR_DIR_DOWN
>;

constant GOFileFormatLevel is export := guint32;
our enum GOFileFormatLevelEnum is export <
  GO_FILE_FL_NONE
  GO_FILE_FL_WRITE_ONLY
  GO_FILE_FL_NEW
  GO_FILE_FL_MANUAL
  GO_FILE_FL_MANUAL_REMEMBER
  GO_FILE_FL_AUTO
  GO_FILE_FL_LAST
>;

constant GOFileProbeLevel is export := guint32;
our enum GOFileProbeLevelEnum is export <
  GO_FILE_PROBE_FILE_NAME
  GO_FILE_PROBE_CONTENT
  GO_FILE_PROBE_LAST
>;

constant GOFileSaveScope is export := guint32;
our enum GOFileSaveScopeEnum is export <
  GO_FILE_SAVE_WORKBOOK
  GO_FILE_SAVE_SHEET
  GO_FILE_SAVE_RANGE
  GO_FILE_SAVE_LAST
>;

constant GOFontScript is export := gint32;
our enum GOFontScriptEnum is export <
  GO_FONT_SCRIPT_SUB
  GO_FONT_SCRIPT_STANDARD
  GO_FONT_SCRIPT_SUPER
>;

constant GOFormatFamily is export := gint32;
our enum GOFormatFamilyEnum is export <
  GO_FORMAT_UNKNOWN
  GO_FORMAT_GENERAL
  GO_FORMAT_NUMBER
  GO_FORMAT_CURRENCY
  GO_FORMAT_ACCOUNTING
  GO_FORMAT_DATE
  GO_FORMAT_TIME
  GO_FORMAT_PERCENTAGE
  GO_FORMAT_FRACTION
  GO_FORMAT_SCIENTIFIC
  GO_FORMAT_TEXT
  GO_FORMAT_SPECIAL
  GO_FORMAT_MARKUP
>;

constant GOFormatMagic is export := guint32;
our enum GOFormatMagicEnum is export <
  GO_FORMAT_MAGIC_NONE
  GO_FORMAT_MAGIC_LONG_DATE
  GO_FORMAT_MAGIC_MEDIUM_DATE
  GO_FORMAT_MAGIC_SHORT_DATE
  GO_FORMAT_MAGIC_SHORT_DATETIME
  GO_FORMAT_MAGIC_LONG_TIME
  GO_FORMAT_MAGIC_MEDIUM_TIME
  GO_FORMAT_MAGIC_SHORT_TIME
>;

constant GOFormatNumberError is export := guint32;
our enum GOFormatNumberErrorEnum is export <
  GO_FORMAT_NUMBER_OK
  GO_FORMAT_NUMBER_INVALID_FORMAT
  GO_FORMAT_NUMBER_DATE_ERROR
>;

constant GOGeometryRotationType is export := guint32;
our enum GOGeometryRotationTypeEnum is export <
  GO_ROTATE_NONE
  GO_ROTATE_COUNTERCLOCKWISE
  GO_ROTATE_UPSIDEDOWN
  GO_ROTATE_CLOCKWISE
  GO_ROTATE_FREE
>;

constant GOGeometrySide is export := guint32;
our enum GOGeometrySideEnum is export <
  GO_SIDE_LEFT
  GO_SIDE_RIGHT
  GO_SIDE_LEFT_RIGHT
  GO_SIDE_TOP
  GO_SIDE_BOTTOM
  GO_SIDE_TOP_BOTTOM
  GO_SIDE_AUTO
>;

constant GOGradientDirection is export := guint32;
our enum GOGradientDirectionEnum is export <
  GO_GRADIENT_N_TO_S
  GO_GRADIENT_S_TO_N
  GO_GRADIENT_N_TO_S_MIRRORED
  GO_GRADIENT_S_TO_N_MIRRORED
  GO_GRADIENT_W_TO_E
  GO_GRADIENT_E_TO_W
  GO_GRADIENT_W_TO_E_MIRRORED
  GO_GRADIENT_E_TO_W_MIRRORED
  GO_GRADIENT_NW_TO_SE
  GO_GRADIENT_SE_TO_NW
  GO_GRADIENT_NW_TO_SE_MIRRORED
  GO_GRADIENT_SE_TO_NW_MIRRORED
  GO_GRADIENT_NE_TO_SW
  GO_GRADIENT_SW_TO_NE
  GO_GRADIENT_SW_TO_NE_MIRRORED
  GO_GRADIENT_NE_TO_SW_MIRRORED
  GO_GRADIENT_MAX
>;

constant GogObjectPosition is export := guint32;
our enum GogObjectPositionEnum is export (
  GOG_POSITION_AUTO            => 0,
  GOG_POSITION_N               => 1,
  GOG_POSITION_S               => 1 +< 1,
  GOG_POSITION_E               => 1 +< 2,
  GOG_POSITION_W               => 1 +< 3,
  GOG_POSITION_COMPASS         => 0x0f,
  GOG_POSITION_ALIGN_FILL      => 0 +< 4,
  GOG_POSITION_ALIGN_START     => 1 +< 4,
  GOG_POSITION_ALIGN_END       => 2 +< 4,
  GOG_POSITION_ALIGN_CENTER    => 3 +< 4,
  GOG_POSITION_ALIGNMENT       => 0x30,
  GOG_POSITION_SPECIAL         => 1 +< 6,
  GOG_POSITION_MANUAL          => 1 +< 7,
  GOG_POSITION_MANUAL_X_ABS    => 1 +< 8,
  GOG_POSITION_MANUAL_Y_ABS    => 1 +< 9,
  GOG_POSITION_MANUAL_X_END    => 1 +< 10,
  GOG_POSITION_MANUAL_Y_END    => 1 +< 11,
  GOG_POSITION_ANCHOR_NW       => 0 +< 12,
  GOG_POSITION_ANCHOR_N        => 1 +< 12,
  GOG_POSITION_ANCHOR_NE       => 2 +< 12,
  GOG_POSITION_ANCHOR_E        => 3 +< 12,
  GOG_POSITION_ANCHOR_SE       => 4 +< 12,
  GOG_POSITION_ANCHOR_S        => 5 +< 12,
  GOG_POSITION_ANCHOR_SW       => 6 +< 12,
  GOG_POSITION_ANCHOR_W        => 7 +< 12,
  GOG_POSITION_ANCHOR_CENTER   => 8 +< 12,
  GOG_POSITION_ANCHOR          => 0x1f000,
  GOG_POSITION_ANY_MANUAL      => 0x1ff80,
  GOG_POSITION_PADDING         => 1 +< 16,
  GOG_POSITION_MANUAL_W        => 1 +< 21,
  GOG_POSITION_MANUAL_W_ABS    => 1 +< 22,
  GOG_POSITION_MANUAL_H        => 1 +< 23,
  GOG_POSITION_MANUAL_H_ABS    => 1 +< 24,
  GOG_POSITION_ANY_MANUAL_SIZE => 0x1e00000,
  GOG_POSITION_HEXPAND         => 1 +< 25,
  GOG_POSITION_VEXPAND         => 1 +< 26,
  GOG_POSITION_EXPAND          => (1 +< 25) +| (1 +< 26) #= GOG_POSITION_HEXPAND | GOG_POSITION_VEXPAND
);

constant GOGraphWidgetSizeMode is export := guint32;
our enum GOGraphWidgetSizeModeEnum is export <
  GO_GRAPH_WIDGET_SIZE_MODE_FIT
  GO_GRAPH_WIDGET_SIZE_MODE_FIT_WIDTH
  GO_GRAPH_WIDGET_SIZE_MODE_FIT_HEIGHT
  GO_GRAPH_WIDGET_SIZE_MODE_FIXED_SIZE
>;

constant GOImageFormat is export := guint32;
our enum GOImageFormatEnum is export <
  GO_IMAGE_FORMAT_SVG
  GO_IMAGE_FORMAT_PNG
  GO_IMAGE_FORMAT_JPG
  GO_IMAGE_FORMAT_PDF
  GO_IMAGE_FORMAT_PS
  GO_IMAGE_FORMAT_EMF
  GO_IMAGE_FORMAT_WMF
  GO_IMAGE_FORMAT_EPS
  GO_IMAGE_FORMAT_UNKNOWN
>;

constant GOImageType is export := guint32;
our enum GOImageTypeEnum is export <
  GO_IMAGE_STRETCHED
  GO_IMAGE_WALLPAPER
  GO_IMAGE_CENTERED
  GO_IMAGE_CENTERED_WALLPAPER
>;

constant GOLineDashType is export := guint32;
our enum GOLineDashTypeEnum is export <
  GO_LINE_NONE
  GO_LINE_SOLID
  GO_LINE_S_DOT
  GO_LINE_S_DASH_DOT
  GO_LINE_S_DASH_DOT_DOT
  GO_LINE_DASH_DOT_DOT_DOT
  GO_LINE_DOT
  GO_LINE_S_DASH
  GO_LINE_DASH
  GO_LINE_LONG_DASH
  GO_LINE_DASH_DOT
  GO_LINE_DASH_DOT_DOT
  GO_LINE_MAX
>;

constant GOLineInterpolation is export := guint32;
our enum GOLineInterpolationEnum is export <
  GO_LINE_INTERPOLATION_LINEAR
  GO_LINE_INTERPOLATION_SPLINE
  GO_LINE_INTERPOLATION_CLOSED_SPLINE
  GO_LINE_INTERPOLATION_CUBIC_SPLINE
  GO_LINE_INTERPOLATION_PARABOLIC_CUBIC_SPLINE
  GO_LINE_INTERPOLATION_CUBIC_CUBIC_SPLINE
  GO_LINE_INTERPOLATION_CLAMPED_CUBIC_SPLINE
  GO_LINE_INTERPOLATION_STEP_START
  GO_LINE_INTERPOLATION_STEP_END
  GO_LINE_INTERPOLATION_STEP_CENTER_X
  GO_LINE_INTERPOLATION_STEP_CENTER_Y
  GO_LINE_INTERPOLATION_ODF_SPLINE
  GO_LINE_INTERPOLATION_MAX
>;

constant GOMarkerShape is export := guint32;
our enum GOMarkerShapeEnum is export <
  GO_MARKER_NONE
  GO_MARKER_SQUARE
  GO_MARKER_DIAMOND
  GO_MARKER_TRIANGLE_DOWN
  GO_MARKER_TRIANGLE_UP
  GO_MARKER_TRIANGLE_RIGHT
  GO_MARKER_TRIANGLE_LEFT
  GO_MARKER_CIRCLE
  GO_MARKER_X
  GO_MARKER_CROSS
  GO_MARKER_ASTERISK
  GO_MARKER_BAR
  GO_MARKER_HALF_BAR
  GO_MARKER_BUTTERFLY
  GO_MARKER_HOURGLASS
  GO_MARKER_LEFT_HALF_BAR
  GO_MARKER_MAX
>;

constant GOMimePriority is export := gint32;
our enum GOMimePriorityEnum is export <
  GO_MIME_PRIORITY_INVALID
  GO_MIME_PRIORITY_DISPLAY
  GO_MIME_PRIORITY_PRINT
  GO_MIME_PRIORITY_PARTIAL
  GO_MIME_PRIORITY_FULL
  GO_MIME_PRIORITY_NATIVE
>;

constant GOPathDirection is export := guint32;
our enum GOPathDirectionEnum is export <
  GO_PATH_DIRECTION_FORWARD
  GO_PATH_DIRECTION_BACKWARD
>;

constant GOPathOptions is export := guint32;
our enum GOPathOptionsEnum is export <
  GO_PATH_OPTIONS_SNAP_COORDINATES
  GO_PATH_OPTIONS_SNAP_WIDTH
  GO_PATH_OPTIONS_SHARP
>;

constant GOPatternType is export := guint32;
our enum GOPatternTypeEnum is export <
  GO_PATTERN_SOLID
  GO_PATTERN_GREY75
  GO_PATTERN_GREY50
  GO_PATTERN_GREY25
  GO_PATTERN_GREY125
  GO_PATTERN_GREY625
  GO_PATTERN_HORIZ
  GO_PATTERN_VERT
  GO_PATTERN_REV_DIAG
  GO_PATTERN_DIAG
  GO_PATTERN_DIAG_CROSS
  GO_PATTERN_THICK_DIAG_CROSS
  GO_PATTERN_THIN_HORIZ
  GO_PATTERN_THIN_VERT
  GO_PATTERN_THIN_REV_DIAG
  GO_PATTERN_THIN_DIAG
  GO_PATTERN_THIN_HORIZ_CROSS
  GO_PATTERN_THIN_DIAG_CROSS
  GO_PATTERN_FOREGROUND_SOLID
  GO_PATTERN_SMALL_CIRCLES
  GO_PATTERN_SEMI_CIRCLES
  GO_PATTERN_THATCH
  GO_PATTERN_LARGE_CIRCLES
  GO_PATTERN_BRICKS
  GO_PATTERN_MAX
>;

constant GOProgressHelperType is export := guint32;
our enum GOProgressHelperTypeEnum is export <
  GO_PROGRESS_HELPER_NONE
  GO_PROGRESS_HELPER_COUNT
  GO_PROGRESS_HELPER_VALUE
  GO_PROGRESS_HELPER_LAST
>;

constant GORegressionResult is export := guint32;
our enum GORegressionResultEnum is export <
  GO_REG_ok
  GO_REG_invalid_dimensions
  GO_REG_invalid_data
  GO_REG_not_enough_data
  GO_REG_near_singular_good
  GO_REG_near_singular_bad
  GO_REG_singular
>;

constant GOSeverity is export := guint32;
our enum GOSeverityEnum is export <
  GO_WARNING
  GO_ERROR
>;

constant GOSnapshotType is export := guint32;
our enum GOSnapshotTypeEnum is export <
  GO_SNAPSHOT_NONE
  GO_SNAPSHOT_SVG
  GO_SNAPSHOT_PNG
  GO_SNAPSHOT_MAX
>;

constant GOStyleFill is export := guint32;
our enum GOStyleFillEnum is export <
  GO_STYLE_FILL_NONE
  GO_STYLE_FILL_PATTERN
  GO_STYLE_FILL_GRADIENT
  GO_STYLE_FILL_IMAGE
>;

constant GOStyleFlag is export := guint32;
our enum GOStyleFlagEnum is export <
  GO_STYLE_OUTLINE
  GO_STYLE_FILL
  GO_STYLE_LINE
  GO_STYLE_MARKER
  GO_STYLE_FONT
  GO_STYLE_TEXT_LAYOUT
  GO_STYLE_INTERPOLATION
  GO_STYLE_MARKER_NO_COLOR
  GO_STYLE_ALL
>;

constant GoJustification is export := guint32;
our enum GoJustificationEnum is export <
  GO_JUSTIFY_LEFT
  GO_JUSTIFY_RIGHT
  GO_JUSTIFY_CENTER
  GO_JUSTIFY_FILL
>;

constant GoResourceType is export := guint32;
our enum GoResourceTypeEnum is export <
  GO_RESOURCE_NATIVE
  GO_RESOURCE_RO
  GO_RESOURCE_RW
  GO_RESOURCE_CHILD
  GO_RESOURCE_EXTERNAL
  GO_RESOURCE_GENERATED
  GO_RESOURCE_INVALID
>;

constant GoUnitId is export := gint32;
our enum GoUnitIdEnum is export <
  GO_UNIT_UNKNOWN
  GO_UNIT_METER
  GO_UNIT_CENTIMETER
  GO_UNIT_INCH
  GO_UNIT_POINT
  GO_UNIT_MAX
>;

constant GocDirection is export := guint32;
our enum GocDirectionEnum is export <
  GOC_DIRECTION_LTR
  GOC_DIRECTION_RTL
  GOC_DIRECTION_MAX
>;

constant GogAxisElemType is export := guint32;
our enum GogAxisElemTypeEnum is export <
  GOG_AXIS_ELEM_MIN
  GOG_AXIS_ELEM_MAX
  GOG_AXIS_ELEM_MAJOR_TICK
  GOG_AXIS_ELEM_MINOR_TICK
  GOG_AXIS_ELEM_CROSS_POINT
  GOG_AXIS_ELEM_MAX_ENTRY
>;

constant GogAxisMetrics is export := gint32;
our enum GogAxisMetricsEnum is export <
  GOG_AXIS_METRICS_INVALID
  GOG_AXIS_METRICS_DEFAULT
  GOG_AXIS_METRICS_ABSOLUTE
  GOG_AXIS_METRICS_RELATIVE
  GOG_AXIS_METRICS_RELATIVE_TICKS
  GOG_AXIS_METRICS_MAX
>;

constant GogAxisPolarUnit is export := guint32;
our enum GogAxisPolarUnitEnum is export <
  GOG_AXIS_POLAR_UNIT_DEGREES
  GOG_AXIS_POLAR_UNIT_RADIANS
  GOG_AXIS_POLAR_UNIT_GRADS
  GOG_AXIS_POLAR_UNIT_MAX
>;

constant GogAxisPosition is export := guint32;
our enum GogAxisPositionEnum is export <
  GOG_AXIS_AT_LOW
  GOG_AXIS_CROSS
  GOG_AXIS_AT_HIGH
  GOG_AXIS_AUTO
>;

constant GogAxisTickTypes is export := guint32;
our enum GogAxisTickTypesEnum is export <
  GOG_AXIS_TICK_NONE
  GOG_AXIS_TICK_MAJOR
  GOG_AXIS_TICK_MINOR
>;

constant GogAxisType is export := gint32;
our enum GogAxisTypeEnum is export <
  GOG_AXIS_UNKNOWN
  GOG_AXIS_X
  GOG_AXIS_Y
  GOG_AXIS_Z
  GOG_AXIS_CIRCULAR
  GOG_AXIS_RADIAL
  GOG_AXIS_VIRTUAL
  GOG_AXIS_PSEUDO_3D
  GOG_AXIS_COLOR
  GOG_AXIS_BUBBLE
  GOG_AXIS_TYPES
>;

constant GogDataType is export := guint32;
our enum GogDataTypeEnum is export <
  GOG_DATA_SCALAR
  GOG_DATA_VECTOR
  GOG_DATA_MATRIX
>;

constant GogDimType is export := gint32;
our enum GogDimTypeEnum is export <
  GOG_DIM_INVALID
  GOG_DIM_LABEL
  GOG_DIM_INDEX
  GOG_DIM_VALUE
  GOG_DIM_MATRIX
  GOG_DIM_TYPES
>;

constant GogErrorBarDirection is export := guint32;
our enum GogErrorBarDirectionEnum is export <
  GOG_ERROR_BAR_DIRECTION_HORIZONTAL
  GOG_ERROR_BAR_DIRECTION_VERTICAL
  GOG_ERROR_BAR_DIRECTION_ANGULAR
  GOG_ERROR_BAR_DIRECTION_RADIAL
>;

constant GogErrorBarDisplay is export := guint32;
our enum GogErrorBarDisplayEnum is export <
  GOG_ERROR_BAR_DISPLAY_NONE
  GOG_ERROR_BAR_DISPLAY_POSITIVE
  GOG_ERROR_BAR_DISPLAY_NEGATIVE
  GOG_ERROR_BAR_DISPLAY_BOTH
>;

constant GogErrorBarType is export := guint32;
our enum GogErrorBarTypeEnum is export <
  GOG_ERROR_BAR_TYPE_NONE
  GOG_ERROR_BAR_TYPE_ABSOLUTE
  GOG_ERROR_BAR_TYPE_RELATIVE
  GOG_ERROR_BAR_TYPE_PERCENT
>;

constant GogGridType is export := gint32;
our enum GogGridTypeEnum is export <
  GOG_GRID_UNKNOWN
  GOG_GRID_XY
  GOG_GRID_YZ
  GOG_GRID_ZX
  GOG_GRID_TYPES
>;

constant GogMSDimType is export := guint32;
our enum GogMSDimTypeEnum is export <
  GOG_MS_DIM_LABELS
  GOG_MS_DIM_VALUES
  GOG_MS_DIM_CATEGORIES
  GOG_MS_DIM_BUBBLES
  GOG_MS_DIM_TYPES
  GOG_MS_DIM_ERR_plus1
  GOG_MS_DIM_ERR_minus1
  GOG_MS_DIM_ERR_plus2
  GOG_MS_DIM_ERR_minus2
  GOG_MS_DIM_START
  GOG_MS_DIM_END
  GOG_MS_DIM_LOW
  GOG_MS_DIM_HIGH
  GOG_MS_DIM_EXTRA1
  GOG_MS_DIM_EXTRA2
>;

constant GogManualSizeMode is export := guint32;
our enum GogManualSizeModeEnum is export <
  GOG_MANUAL_SIZE_AUTO
  GOG_MANUAL_SIZE_WIDTH
  GOG_MANUAL_SIZE_HEIGHT
  GOG_MANUAL_SIZE_FULL
>;

constant GogObjectNamingConv is export := guint32;
our enum GogObjectNamingConvEnum is export <
  GOG_OBJECT_NAME_BY_ROLE
  GOG_OBJECT_NAME_BY_TYPE
  GOG_OBJECT_NAME_MANUALLY
>;

constant GogPlotRenderingOrder is export := guint32;
our enum GogPlotRenderingOrderEnum is export <
  GOG_PLOT_RENDERING_LAST
  GOG_PLOT_RENDERING_BEFORE_AXIS
  GOG_PLOT_RENDERING_BEFORE_GRID
>;

constant GogRegCurveDrawingBounds is export := guint32;
our enum GogRegCurveDrawingBoundsEnum is export <
  GOG_REG_CURVE_DRAWING_BOUNDS_NONE
  GOG_REG_CURVE_DRAWING_BOUNDS_ABSOLUTE
  GOG_REG_CURVE_DRAWING_BOUNDS_RELATIVE
>;

constant GogSeriesFillType is export := guint32;
our enum GogSeriesFillTypeEnum is export <
  GOG_SERIES_FILL_TYPE_Y_ORIGIN
  GOG_SERIES_FILL_TYPE_X_ORIGIN
  GOG_SERIES_FILL_TYPE_BOTTOM
  GOG_SERIES_FILL_TYPE_LEFT
  GOG_SERIES_FILL_TYPE_TOP
  GOG_SERIES_FILL_TYPE_RIGHT
  GOG_SERIES_FILL_TYPE_ORIGIN
  GOG_SERIES_FILL_TYPE_CENTER
  GOG_SERIES_FILL_TYPE_EDGE
  GOG_SERIES_FILL_TYPE_SELF
  GOG_SERIES_FILL_TYPE_NEXT
  GOG_SERIES_FILL_TYPE_X_AXIS_MIN
  GOG_SERIES_FILL_TYPE_X_AXIS_MAX
  GOG_SERIES_FILL_TYPE_Y_AXIS_MIN
  GOG_SERIES_FILL_TYPE_Y_AXIS_MAX
  GOG_SERIES_FILL_TYPE_INVALID
>;

constant GogSeriesLabelsPos is export := guint32;
our enum GogSeriesLabelsPosEnum is export <
  GOG_SERIES_LABELS_DEFAULT_POS
  GOG_SERIES_LABELS_CENTERED
  GOG_SERIES_LABELS_TOP
  GOG_SERIES_LABELS_BOTTOM
  GOG_SERIES_LABELS_LEFT
  GOG_SERIES_LABELS_RIGHT
  GOG_SERIES_LABELS_OUTSIDE
  GOG_SERIES_LABELS_INSIDE
  GOG_SERIES_LABELS_NEAR_ORIGIN
>;

constant GogSeriesPriority is export := guint32;
our enum GogSeriesPriorityEnum is export <
  GOG_SERIES_REQUIRED
  GOG_SERIES_SUGGESTED
  GOG_SERIES_OPTIONAL
  GOG_SERIES_ERRORS
>;

constant GogAxisSet is export := guint32;
our enum GogAxisSetEnum is export (
  GOG_AXIS_SET_UNKNOWN      => -1,
  GOG_AXIS_SET_NONE         => 0,
  GOG_AXIS_SET_X            => (1  +< GOG_AXIS_X),
  GOG_AXIS_SET_XY           => (1  +< GOG_AXIS_X) +| (1 +< GOG_AXIS_Y),
  GOG_AXIS_SET_XY_pseudo_3d => (1  +< GOG_AXIS_X) +| (1 +< GOG_AXIS_Y) +| (1 +< GOG_AXIS_PSEUDO_3D),
  GOG_AXIS_SET_XY_COLOR     => (1  +< GOG_AXIS_X) +| (1 +< GOG_AXIS_Y) +| (1 +< GOG_AXIS_COLOR),
  GOG_AXIS_SET_XY_BUBBLE    => (1  +< GOG_AXIS_X) +| (1 +< GOG_AXIS_Y) +| (1 +< GOG_AXIS_BUBBLE),
  GOG_AXIS_SET_XYZ          => (1  +< GOG_AXIS_X) +| (1 +< GOG_AXIS_Y) +| (1 +< GOG_AXIS_Z),
  GOG_AXIS_SET_RADAR        => (1  +< GOG_AXIS_CIRCULAR) +| (1 +< GOG_AXIS_RADIAL),
  GOG_AXIS_SET_FUNDAMENTAL  => (1 +< GOG_AXIS_VIRTUAL) - 1,
  GOG_AXIS_SET_ALL          => (1 +< GOG_AXIS_TYPES) - 1
);
