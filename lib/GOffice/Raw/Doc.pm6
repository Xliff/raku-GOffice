use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Enums;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Doc;

### /usr/src/goffice/goffice/app/go-doc.h

sub go_doc_add_image (
  GODoc   $doc,
  Str     $id,
  GOImage $image
)
  returns GOImage
  is      native(goffice)
  is      export
{ * }

sub go_doc_bump_state (GODoc $doc)
  is      native(goffice)
  is      export
{ * }

sub go_doc_end_read (GODoc $doc)
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_dirty_time (GODoc $doc)
  returns gint64
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_image (GODoc $doc, Str $id)
  returns GOImage
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_images (GODoc $doc)
  returns GHashTable
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_meta_data (GODoc $doc)
  returns GsfDocMetaData
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_modtime (GODoc $doc)
  returns GDateTime
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_saved_state (GODoc $doc)
  returns guint64
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_state (GODoc $doc)
  returns guint64
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub go_doc_get_uri (GODoc $doc)
  returns Str
  is      native(goffice)
  is      export
{ * }

sub go_doc_image_fetch (
  GODoc $doc,
  Str   $id,
  GType $type
)
  returns GOImage
  is      native(goffice)
  is      export
{ * }

sub go_doc_init_read (
  GODoc    $doc,
  GsfInput $input
)
  is      native(goffice)
  is      export
{ * }

sub go_doc_init_write (
  GODoc     $doc,
  GsfXMLOut $output
)
  is      native(goffice)
  is      export
{ * }

sub go_doc_is_dirty (GODoc $doc)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_doc_is_pristine (GODoc $doc)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_doc_read (
  GODoc           $doc,
  GsfXMLIn        $xin,
  CArray[xmlChar] $attrs
)
  is      native(goffice)
  is      export
{ * }

sub go_doc_save_image (GODoc $doc, Str $id)
  is      native(goffice)
  is      export
{ * }

sub go_doc_save_resource (GODoc $doc, GOPersist $gp)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_dirty (GODoc $doc, gboolean $is_dirty)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_dirty_time (GODoc $doc, gint64 $t)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_meta_data (GODoc $doc, GsfDocMetaData $data)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_modtime (GODoc $doc, GDateTime $modtime)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_pristine (GODoc $doc, gboolean $pristine)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_saved_state (GODoc $doc, guint64 $state)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_state (GODoc $doc, guint64 $state)
  is      native(goffice)
  is      export
{ * }

sub go_doc_set_uri (GODoc $doc, Str $uri)
  returns uint32
  is      native(goffice)
  is      export
{ * }

sub go_doc_update_meta_data (GODoc $doc)
  is      native(goffice)
  is      export
{ * }

sub go_doc_write (GODoc $doc, GsfXMLOut $output)
  is      native(goffice)
  is      export
{ * }
