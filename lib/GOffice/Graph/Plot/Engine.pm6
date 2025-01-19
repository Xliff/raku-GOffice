use v6.c;

use GOffice::Raw::Types;
use GOffice::Raw::Graph::Plot::Engine;

use GLib::HashTable;

use GLib::Roles::StaticClass;

class GOffice::Graph::Plot::Engine {
  also does GLib::Roles::StaticClass;

  method families ( :$raw = False ) {
    propReturnObject(
      gog_plot_families(),
      $raw,
      |GLib::HashTable.getTypePair
    );
  }

  has $!ggpe-f;

  method family {
    unless $!ggpe-f {
      my \T = class :: {

        method by_name (Str() $name) {
          gog_plot_family_by_name($name);
        }

        method register (
          Str() $name,
          Str() $sample_image_file,
          Int() $priority,
          Int() $axis_set
        ) {
          my gint       $p = $priority;
          my GogAxisSet $a = $axis_set;

          gog_plot_family_register(
            $name,
            $sample_image_file,
            $p,
            $a
          );
        }

        method unregister (GogPlotFamily() $family) {
          gog_plot_family_unregister($family);
        }

      }

      $!ggpe-f = T.new;
    }
    $!ggpe-f;
  }

  has $!ggpe-t;

  method type {
    unless $!ggpe-t {
      my \T = class :: {
        method register (
          GogPlotFamily() $family,
          Int()           $col,
          Int()           $row,
          Str()           $name,
          Str()           $sample_image_file,
          Str()           $description,
          Str()           $engine
        ) {
          my gint ($c, $r) = ($col, $row);

          gog_plot_type_register(
            $family,
            $c,
            $r,
            $name,
            $sample_image_file,
            $description,
            $engine
          );
        }
      }

      $!ggpe-t = T.new;

    }

    $!ggpe-t;
  }

  method trend_line_types ( :$raw = False ) {
    propReturnObject(
      gog_trend_line_types(),
      $raw,
      |GLib::HashTable.getTypePair
    );
  }

}
