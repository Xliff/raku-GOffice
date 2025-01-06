/*
  List created from the output of:
    ( find . -name \*.h -exec grep -Hn 'typedef struct'} \; 1>&2 ) 2>&1 | \
       cut -d\  -f 4 | grep -v \{
*/

/* Strategy provided by p6-XML-LibXML:author<FROGGS> */
#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif


#include <goffice/goffice.h>
#include <goffice/graph/goffice-graph.h>
#include "/usr/src/goffice/goffice/graph/gog-axis-line-impl.h"
#include "/usr/src/goffice/goffice/graph/gog-series-impl.h"

#define s(name)     DLLEXPORT int sizeof_ ## name () { return sizeof(name); }

typedef struct tm tm;

typedef gint gatomicrefcount;

typedef struct _GogAxis GogAxis;
typedef struct _GogAxisMapDesc GogAxisMapDesc;

struct _GogAxisMapDesc {
	double 		(*map) 		 (GogAxisMap *map, double value);
	double 		(*map_to_view)   (GogAxisMap *map, double value);
	double 		(*map_derivative_to_view)   (GogAxisMap *map, double value);
	double 		(*map_from_view) (GogAxisMap *map, double value);
	gboolean	(*map_finite)    (double value);
	double		(*map_baseline)  (GogAxisMap *map);
	void		(*map_bounds)	 (GogAxisMap *map, double *minimum, double *maximum);
	gboolean 	(*init) 	 (GogAxisMap *map, double offset, double length);
	void		(*destroy) 	 (GogAxisMap *map);

	/*
	 * Refine the description, for example by picking a new auto_bound
	 * method based on format.
	 */
	const GogAxisMapDesc* (*subclass) (GogAxis *axis, const GogAxisMapDesc *desc);

	/*
	 * Calculate graph bounds and tick sizes based on data minimum and
	 * maximum.
	 */
	void		(*auto_bound) 	 (GogAxis *axis,
					  double minimum, double maximum,
					  double *bound);

	void		(*calc_ticks) 	 (GogAxis *axis);

	GOFormat *      (*get_dim_format)(GogAxis *axis, unsigned dim);

	char const	*name;
	char const	*description;
};

// cw: From gog-axis.c
struct _GogAxis {
	GogAxisBase	 base;

	GogAxisType	 type;
	GSList		*contributors;

	GogDatasetElement source[GOG_AXIS_ELEM_CROSS_POINT];
	double		  auto_bound[GOG_AXIS_ELEM_CROSS_POINT];
	gboolean inverted; /* apply to all map type */

	double		min_val, max_val;
	double		logical_min_val, logical_max_val;
	GogObject	*min_contrib, *max_contrib; /* NULL means use the manual sources */
	gboolean	is_discrete;
	gboolean	center_on_ticks;
	GOData         *labels;
	GogPlot	       *plot_that_supplied_labels;
	GOFormat       *format, *assigned_format;

	GogAxisMapDesc const 	*map_desc;
	GogAxisMapDesc const 	*actual_map_desc;

	const GODateConventions *date_conv;

	GogAxisPolarUnit	 polar_unit;
	double			 circular_rotation;

	GogAxisTick	*ticks;
	unsigned	 tick_nbr;
	double span_start, span_end;    /* percent of used area */
	GogAxisColorMap const *color_map;		/* color map for color and pseudo-3d axis */
	gboolean auto_color_map;
	GogColorScale *color_scale;
	GogAxisMetrics metrics;
	GogAxis *ref_axis;
	GSList *refering_axes;
	double metrics_ratio;
	GoUnitId unit;
	double display_factor;
};

s(GOArrow)
s(GOColorGroup)
s(GOComboBox)
s(GOComplex)
//s(GOComplexD)
s(GOComplexl)
s(GOData)
s(GODataMatrix)
s(GODataMatrixSize)
s(GODataScalar)
s(GODataVector)
s(GODateConventions)
s(GODoc)
s(GODocControl)
s(GODocControlClass)
//s(GOFileOpener)
s(GOFilePermissions)
s(GOFont)
s(GOFontMetrics)
s(GOFormatCurrency)
s(GOGeometryOBR)
s(GOIOContext)
s(GOImage)
s(GOImageFormatInfo)
s(GOLineDashSequence)
s(GOMimeType)
s(GOOptionMenu)
s(GOPalette)
s(GOPangoAttrSubscript)
s(GOPangoAttrSuperscript)
s(GOPathPoint)
s(GOPattern)
s(GOPluginLoaderModule)
s(GOPluginService)
s(GOPluginServiceGObjectLoader)
//s(GOPluginServiceGObjectLoaderClass)
s(GOPluginServiceSimple)
//s(GOPluginServiceSimpleClass)
s(GOPoint)
s(GOProgressRange)
s(GOQuad)
//s(GOQuadD)
s(GOQuadMatrix)
//s(GOQuadMatrixD)
s(GOQuadMatrixl)
s(GORect)
s(GORegexp)
s(GORegmatch)
s(GOSearchReplace)
//s(GOSearchReplaceClass)
s(GOSelector)
//s(GOService)
//s(GOServiceSimple)
s(GOStyle)
//s(GOStyleFont)
//s(GOStyleInnerFill)
//s(GOStyleInnerFillGradient)
//s(GOStyleInnerFillImage)
s(GOStyleLine)
s(GOStyleMark)
//s(GOStyleTextLayout)
s(GOUndo)
s(GOUndoBinary)
//s(GOUndoBinaryClass)
s(GOUndoGroup)
//s(GOUndoGroupClass)
s(GOUndoUnary)
//s(GOUndoUnaryClass)
s(GoView)
s(GocArc)
s(GocCanvas)
s(GocCircle)
s(GocEllipse)
s(GocImage)
s(GocIntArray)
s(GocItem)
s(GocLine)
s(GocPath)
s(GocPixbuf)
s(GocPoint)
s(GocPoints)
s(GocPolygon)
s(GocPolyline)
s(GocRect)
s(GocRectangle)
s(GocStyledItem)
s(GocText)
s(GogAxis)
s(GogAxisBase)
s(GogAxisBaseView)
s(GogAxisMapDesc)
s(GogAxisTick)
//s(GogAxisTickProperties)
s(GogChart)
s(GogChartMapPolarData)
s(GogDataLabel)
s(GogDatasetElement)
s(GogErrorBar)
s(GogGraph)
s(GogObject)
s(GogObjectRole)
//s(GogObjectRoleUser)
s(GogOutlinedObject)
s(GogOutlinedView)
s(GogPlot)
s(GogPlotDesc)
s(GogPlotView)
s(GogRegCurve)
s(GogSeriesDesc)
s(GogSeriesDimDesc)
s(GogSeriesElement)
s(GogSeriesLabelElt)
s(GogSeriesLabels)
s(GogSmoothedCurveClass)
s(GogStyledObject)
s(GogText)
s(GogToolAction)
s(GogTrendLine)
s(GogTrendLineType)
s(GogView)
s(GogViewAllocation)
s(GogViewPadding)
s(GogViewRequisition)
//s(coords)
//s(count)
//s(go_regression_stat_t)
//s(go_regression_stat_tD)
//s(go_regression_stat_tl)
//s(gradient)
//s(image)
//s(mem)
//s(text_layout)
//s(value)
//s(workbook)

int getAxisTypes (void) {
  return GOG_AXIS_TYPES;
}
