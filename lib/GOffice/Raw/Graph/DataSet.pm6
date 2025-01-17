use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GOffice::Raw::Definitions;
use GOffice::Raw::Structs;

unit package GOffice::Raw::Graph::DataSet;

### /usr/src/goffice/goffice/graph/gog-data-set.h

sub gog_dataset_dims (
  GogDataset $set,
  gint       $first is rw,
  gint       $last is rw
)
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_dup_to_simple (
  GogDataset $src,
  GogDataset $dst
)
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_finalize (GogDataset $set)
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_get_dim (
  GogDataset $set,
  gint       $dim_i
)
  returns GOData
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_get_elem (
  GogDataset $set,
  gint       $dim_i
)
  returns GogDatasetElement
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_parent_changed (
  GogDataset $set,
  gboolean   $was_set
)
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_set_dim (
  GogDataset              $set,
  gint                    $dim_i,
  GOData                  $val,
  CArray[Pointer[GError]] $err
)
  is      native(goffice)
  is      export
{ * }

sub gog_dataset_set_dim_internal (
  GogDataset $set,
  gint       $dim_i,
  GOData     $val,
  GogGraph   $graph
)
  is      native(goffice)
  is      export
{ * }
