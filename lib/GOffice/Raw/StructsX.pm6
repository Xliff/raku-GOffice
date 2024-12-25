use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Structs;
use GOffice::Raw::Definitions;

unit package GOffice::Raw::Structs;

class GODoc is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject        $.base;
  has Str            $.uri;
  has GsfDocMetaData $.meta_data;
  has gboolean       $.modified;
  has gint64         $.first_modification_time;
  has gboolean       $.pristine;
  has GHashTable     $.images;
  has GDateTime      $.modtime;
  has gpointer       $!priv
}

class GODocControl is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject $.base;
  has GODoc   $.doc;
}

class GocCanvas is repr<CStruct> does GLib::Roles::Pointers is export {
	HAS GtkLayout    $.base;
	has gdouble      $.scroll-x1
  has gdouble      $.scroll-y1;
	has gdouble      $.pixels_per_unit;
	has gint         $.width;
  has gint         $.height;
	has GocGroup     $.root;
	has GocItem      $.grabbed_item;
	has GocItem	     $.last_item;
	has GODoc        $.document;
  has GdkEvent     $.cur_event;
	has GocDirection $.direction;
	has gpointer     $!priv;
}

class GocItem is repr<CStruct> does GLib::Roles::Pointers is export {
	HAS GObject			     $.base;

	has GocCanvas		     $.canvas;
	has GocGroup		     $.parent;
	has gboolean		     $.cached_bounds;
	has gboolean		     $.visible;
	has gboolean		     $.realized;
	has gdouble			     $.x0;
  has gdouble          $.y0;
  has gdouble          $.x1;
  has gdouble          $.y1;
	has cairo_operator_t $.op;
	HAS cairo_matrix_t	 $.transform; # unused for now
	has gboolean		     $.transformed;

	has gpointer		     $!priv;
}
