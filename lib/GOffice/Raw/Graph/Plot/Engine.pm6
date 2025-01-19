use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::Engine;

### /usr/src/goffice/goffice/graph/gog-plot-engine.h

sub gog_plot_families
  returns GHashTable
  is      native(goffice)
  is      export
{ * }

sub gog_plot_family_by_name (Str $name)
  returns GogPlotFamily
  is      native(goffice)
  is      export
{ * }

sub gog_plot_family_register (
  Str        $name,
  Str        $sample_image_file,
  gint       $priority,
  GogAxisSet $axis_set
)
  returns GogPlotFamily
  is      native(goffice)
  is      export
{ * }

sub gog_plot_family_unregister (GogPlotFamily $family)
  is      native(goffice)
  is      export
{ * }

sub gog_plot_type_register (
  GogPlotFamily $family,
  gint          $col,
  gint          $row,
  Str           $name,
  Str           $sample_image_file,
  Str           $description,
  Str           $engine
)
  returns GogPlotType
  is      native(goffice)
  is      export
{ * }

sub gog_trend_line_types
  returns GHashTable
  is      native(goffice)
  is      export
{ * }
