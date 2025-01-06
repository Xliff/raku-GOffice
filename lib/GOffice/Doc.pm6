use v6.c;

use Method::Also;

use NativeCall;

use GOffice::Raw::Types;
use GOffice::Raw::Doc;

#use GOffice::Image;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GODocAncestry is export of Mu
  where GODoc | GObject;

class GOffice::Doc {
  also does GLib::Roles::Object;

  has GODoc $!gd is implementor;

  submethod BUILD ( :$goffice-doc ) {
    self.setGODoc($goffice-doc) if $goffice-doc
  }

  method setGODoc (GODocAncestry $_) {
    my $to-parent;

    $!gd = do {
      when GODoc {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GODoc, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GOffice::Raw::Definitions::GODoc
    is also<GODoc>
  { $!gd }

  multi method new (
    $goffice-doc where * ~~ GODocAncestry,

    :$ref = True
  ) {
    return unless $goffice-doc;

    my $o = self.bless( :$goffice-doc );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method dirty is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('dirty', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('dirty', $gv);
      }
    );
  }

  # Type: int64
  method dirty-time is rw  is g-property is also<dirty_time> {
    my $gv = GLib::Value.new( G_TYPE_INT64 );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('dirty-time', $gv);
        $gv.int64;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int64 = $val;
        self.prop_set('dirty-time', $gv);
      }
    );
  }

  # Type: GDateTime
  method modtime ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GLib::DateTime.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('modtime', $gv);
        propReturnObject(
          $gv.pointer,
          $raw,
          |GLib::DateTime.getTypePair
        );
      },
      STORE => -> $, GDateTime() $val is copy {
        $gv.pointer = $val;
        self.prop_set('modtime', $gv);
      }
    );
  }

  # Type: boolean
  method pristine is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pristine', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('pristine', $gv);
      }
    );
  }

  # Type: uint64
  method saved-state is rw  is g-property is also<saved_state> {
    my $gv = GLib::Value.new( G_TYPE_UINT64 );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('saved-state', $gv);
        $gv.uint64;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint64 = $val;
        self.prop_set('saved-state', $gv);
      }
    );
  }

  # Type: uint64
  method state is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT64 );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('state', $gv);
        $gv.uint64;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint64 = $val;
        self.prop_set('state', $gv);
      }
    );
  }

  # Type: string
  method uri is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('uri', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('uri', $gv);
      }
    );
  }

  method metadata-changed is also<metadata_changed> {
    self.connect($!gd, 'metadata-changed');
  }

  method metadata-updated is also<metadata_updated> {
    self.connect($!gd, 'metadata-updated');
  }

  method add_image (Str() $id, GOImage() $image, :$raw = False)
    is also<add-image>
  {
    propReturnObject(
      go_doc_add_image($!gd, $id, $image),
      $raw,
      |GOffice::Image.getTypePair
    );
  }

  method bump_state is also<bump-state> {
    go_doc_bump_state($!gd);
  }

  method end_read is also<end-read> {
    go_doc_end_read($!gd);
  }

  method get_dirty_time ( :$raw = False ) is also<get-dirty-time> {
    my $t = go_doc_get_dirty_time($!gd);
    return $t if $raw;
    DateTime.new($t / 1e6);
  }

  method get_image (Str() $id, :$raw = False) is also<get-image> {
    propReturnObject(
      go_doc_get_image($!gd, $id),
      $raw,
      |GOffice::Image.getTypePair
    );
  }

  method get_images ( :$raw = False ) is also<get-images> {
    # cw: -XXX- Here there be dragons!
    propReturnObject(
      go_doc_get_images($!gd),
      $raw,
      |GLib::HashTable.getTypePair
    );
  }

  method get_meta_data ( :$raw = False ) is also<get-meta-data> {
    propReturnObject(
      go_doc_get_meta_data($!gd),
      $raw,
      |GSF::MetaData.getTypePair
    );
  }

  method get_modtime ( :$raw = False ) is also<get-modtime> {
    propReturnObject(
      go_doc_get_modtime($!gd),
      $raw,
      |GLib::DateTime.getTypePair
    )
  }

  method get_saved_state is also<get-saved-state> {
    go_doc_get_saved_state($!gd);
  }

  method get_state is also<get-state> {
    go_doc_get_state($!gd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_doc_get_type, $n, $t );
  }

  method get_uri is also<get-uri> {
    go_doc_get_uri($!gd);
  }

  method image_fetch (
    Str()  $id,
    Int()  $type = GOffice::Image.get_type,
          :$pair = GOffice::Image.getTypePair,
          :$raw  = False
  )
    is also<image-fetch>
  {
    my GType $t = $type;

    propReturnObject(
      go_doc_image_fetch($!gd, $id, $t),
      $raw,
      |$pair
    );
  }

  method init_read (GsfInput() $input) is also<init-read> {
    go_doc_init_read($!gd, $input);
  }

  method init_write (GsfXMLOut() $output) is also<init-write> {
    go_doc_init_write($!gd, $output);
  }

  method is_dirty is also<is-dirty> {
    so go_doc_is_dirty($!gd);
  }

  method is_pristine is also<is-pristine> {
    so go_doc_is_pristine($!gd);
  }

  multi method read ( GsfXMLIn() $xin, @attrs = () ) {
    samewith( $xin, ArrayToCArray(Str, @attrs) )
  }
  multi method read (GsfXMLIn() $xin, CArray[Str] $attrs) {
    go_doc_read($!gd, $xin, $attrs);
  }

  method save_image (Str() $id) is also<save-image> {
    go_doc_save_image($!gd, $id);
  }

  method save_resource (GOPersist() $gp) is also<save-resource> {
    go_doc_save_resource($!gd, $gp);
  }

  method set_dirty (Int() $is_dirty) is also<set-dirty> {
    my gboolean $i = $is_dirty.so.Int;

    go_doc_set_dirty($!gd, $i);
  }

  method set_dirty_time (Int() $t) is also<set-dirty-time> {
    my gint64 $tt = $t;

    go_doc_set_dirty_time($!gd, $tt);
  }

  method set_meta_data (GsfDocMetaData() $data) is also<set-meta-data> {
    go_doc_set_meta_data($!gd, $data);
  }

  method set_modtime (GDateTime() $modtime) is also<set-modtime> {
    go_doc_set_modtime($!gd, $modtime);
  }

  method set_pristine (Int() $pristine) is also<set-pristine> {
    my gboolean $p = $pristine.so.Int;

    go_doc_set_pristine($!gd, $p);
  }

  method set_saved_state (Int() $state) is also<set-saved-state> {
    my guint64 $s = $state;

    go_doc_set_saved_state($!gd, $state);
  }

  method set_state (Int() $state) is also<set-state> {
    my guint64 $s = $state;

    go_doc_set_state($!gd, $s);
  }

  method set_uri (Str() $uri) is also<set-uri> {
    go_doc_set_uri($!gd, $uri);
  }

  method update_meta_data is also<update-meta-data> {
    go_doc_update_meta_data($!gd);
  }

  method write (GsfXMLOut() $output) {
    go_doc_write($!gd, $output);
  }

}
