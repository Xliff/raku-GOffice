use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GOffice::Raw::Types;

use GDK::Pixbuf;
#use GOffice::Image;
use GOffice::Path;
use GOffice::Canvas::StyledItem; # cw: Must come BEFORE ::Item!
use GOffice::Canvas::Item;
use GOffice::Canvas::Points;
use GOffice::Graph::Renderer;

our subset GocArcAncestry is export of Mu
  where GocArc | GocStyledItemAncestry;

role ShapeCanvasCreation {
  multi method new (GocGroup() $parent, *%a) {
    my $goffice-canvas-shape = $.create-pointer($parent, self.get_type);

    my $o = $goffice-canvas-shape
      ?? self.bless( :$goffice-canvas-shape )
      !! Nil;
    $o.setAttributess(%a) if $o && +%a;
    $o;
  }
}

class GOffice::Canvas::Arc is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocArc $!goa   is implementor;
  has        $!quiet is built;

  submethod BUILD ( :$goffice-canvas-shape, :$!quiet ) {
    self.setGocArc($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocArc (GocArcAncestry $_) {
    my $to-parent;

    $!goa = do {
      when GocArc {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocArc, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Structs::GocArc
    is also<GoArc>
  { $!goa }

  multi method new (
    $goffice-canvas-shape where * ~~ GocArcAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  method ang1-degrees is rw is also<ang1_degrees> {
    Proxy.new:
      FETCH => -> $           { },
      STORE => -> $, Num() \r {
        $.ang1 = r * π / 180;
      }
  }

  method ang2-degrees is rw is also<ang2_degrees> {
    Proxy.new:
      FETCH => -> $           { },
      STORE => -> $, Num() \r {
        $.ang2 = r * π / 180;
      }
  }

  method radius is rw {
    Proxy.new:
      FETCH => -> $           { },
      STORE => -> $, Num() \r {
        say "You may want to set .ang1, first!" unless $!quiet.not || $.ang1;
        ($.xr, $.yr) = (r * $.ang1.cos, r * $.ang1.sin);
      }
   }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_arc_get_type, $n, $t );
  }

  # Type: double
  method ang1 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('ang1', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('ang1', $gv);
      }
    );
  }

  # Type: double
  method ang2 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('ang2', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('ang2', $gv);
      }
    );
  }

  # Type: GOArrowType
  method end-arrow ( :$enum = True )
    is rw
    is g-property
    is also<end_arrow>
  {
    my $gv = GLib::Value.new( GOffice::Enums::Canvas::ArrowType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('end-arrow', $gv);
        my $a = $gv.enum;
        return $a unless $enum;
        GOArrowTypeEnum($a);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GOArrowType) = $val;
        self.prop_set('end-arrow', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: GocArrowType
  method start-arrow ( :$enum = False )
    is rw
    is g-property
    is also<start_arrow>
  {
    my $gv = GLib::Value.new( GOffice::Enums::Canvas::ArrowType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('start-arrow', $gv);
        my $a = $gv.enum;
        return $a unless $enum;
        GOArrowTypeEnum($a);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GOArrowType) = $val;
        self.prop_set('start-arrow', $gv);
      }
    );
  }

  # Type: int
  method type ( :$enum = True ) is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('type', $gv);
        my $a = $gv.int;
        return $a unless $enum;
        GOArrowTypeEnum($a);
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('type', $gv);
      }
    );
  }

  # Type: double
  method xc is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('xc', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('xc', $gv);
      }
    );
  }

  # Type: double
  method xr is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('xr', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('xr', $gv);
      }
    );
  }

  # Type: double
  method yc is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('yc', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('yc', $gv);
      }
    );
  }

  # Type: double
  method yr is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('yr', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('yr', $gv);
      }
    );
  }
}


our subset GocCircleAncestry is export of Mu
  where GocCircle | GocItemAncestry;

class GOffice::Canvas::Circle is GOffice::Canvas::Item {
  also does ShapeCanvasCreation;

  has GocCircle $!goc is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocCircle($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocCircle (GocCircleAncestry $_) {
    my $to-parent;

    $!goc = do {
      when GocCircle {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocCircle, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocCircle
  { $!goc }

  multi method new (
    $goffice-canvas-shape where * ~~ GocCircleAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method radius is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('radius', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('radius', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_circle_get_type, $n, $t );
  }
}


our subset GocEllipseAncestry is export of Mu
  where GocEllipse | GocStyledItemAncestry;

class GOffice::Canvas::Ellipse is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocEllipse $!goe is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocEllipse($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocEllipse (GocEllipseAncestry $_) {
    my $to-parent;

    $!goe = do {
      when GocEllipse {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocEllipse, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocEllipse
  { $!goe }

  multi method new (
    $goffice-canvas-shape where * ~~ GocEllipseAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_ellipse_get_type, $n, $t );
  }
}


our subset GocGraphAncestry is export of Mu
  where GocGraph | GocItemAncestry;

class GOffice::Canvas::Graph is GOffice::Canvas::Item {
  also does ShapeCanvasCreation;

  has GocGraph $!gog is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocGraph($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocGraph (GocGraphAncestry $_) {
    my $to-parent;

    $!gog = do {
      when GocGraph {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocGraph, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocGraph
  { $!gog }

  multi method new (
    $goffice-canvas-shape where * ~~ GocGraphAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: GOGraph
  method graph is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Graph.get_type );
    Proxy.new(
      FETCH => sub ($) {
        warn 'graph does not allow reading' if $DEBUG;
        0;
      },
      STORE => -> $, GogGraph() $val is copy {
        $gv.object = $val;
        self.prop_set('graph', $gv);
      }
    );
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: GORenderer
  method renderer ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Graph::Renderer.get_types );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('renderer', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Graph::Renderer.getTypePair
        );
      },
      STORE => -> $, GogRenderer() $val is copy {
        $gv.object = $val;
        self.prop_set('renderer', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_graph_get_type, $n, $t );
  }
}


our subset GocImageAncestry is export of Mu
  where GocImage | GocStyledItemAncestry;

class GOffice::Canvas::Image is GOffice::Canvas::Item {
  also does ShapeCanvasCreation;

  has GocImage $!goi is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocImage($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocImage (GocImageAncestry $_) {
    my $to-parent;

    $!goi = do {
      when GocImage {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocImage, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Structs::GocImage
    is also<GocImage>
  { $!goi }

  multi method new (
    $goffice-canvas-shape where * ~~ GocImageAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method crop-bottom is rw  is g-property is also<crop_bottom> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('crop-bottom', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('crop-bottom', $gv);
      }
    );
  }

  # Type: double
  method crop-left is rw  is g-property is also<crop_left> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('crop-left', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('crop-left', $gv);
      }
    );
  }

  # Type: double
  method crop-right is rw  is g-property is also<crop_right> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('crop-right', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('crop-right', $gv);
      }
    );
  }

  # Type: double
  method crop-top is rw  is g-property is also<crop_top> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('crop-top', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('crop-top', $gv);
      }
    );
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: GOImage
  method image ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Image.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('image', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Image.getTypePair
        );
      },
      STORE => -> $, GOImage() $val is copy {
        $gv.object = $val;
        self.prop_set('image', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_image_get_type, $n, $t );
  }
}


our subset GocLineAncestry is export of Mu
  where GocLine | GocStyledItemAncestry;

class GOffice::Canvas::Line is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocLine $!gol is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocLine($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocLine (GocLineAncestry $_) {
    my $to-parent;

    $!gol = do {
      when GocLine {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocLine, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Structs::GocLine
    is also<GocLine>
  { $!gol }

  multi method new (
    $goffice-canvas-shape where * ~~ GocLineAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: GocArrowType
  method end-arrow ( :$enum = False )
    is rw
    is g-property
    is also<end_arrow>
  {
    my $gv = GLib::Value.new( GOffice::Enums::Canvas::ArrowType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('end-arrow', $gv);
        my $a = $gv.enum;
        return $a unless $enum;
        GOArrowTypeEnum($a);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GOArrowType) = $val;
        self.prop_set('end-arrow', $gv);
      }
    );
  }

  # Type: GocArrowType
  method start-arrow ( :$enum = False )
    is rw
    is g-property
    is also<start_arrow>
  {
    my $gv = GLib::Value.new( GOffice::Enums::Canvas::ArrowType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('start-arrow', $gv);
        my $a = $gv.enum;
        return $a unless $enum;
        GOArrowTypeEnum($a);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GOArrowType) = $val;
        self.prop_set('start-arrow', $gv);
      }
    );
  }

  # Type: double
  method x0 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x0', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x0', $gv);
      }
    );
  }

  # Type: double
  method x1 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x1', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x1', $gv);
      }
    );
  }

  # Type: double
  method y0 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y0', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y0', $gv);
      }
    );
  }

  # Type: double
  method y1 is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y1', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y1', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_line_get_type, $n, $t );
  }
}


our subset GocPathAncestry is export of Mu
  where GocPath | GocStyledItemAncestry;

class GOffice::Canvas::Path is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocPath $!gop is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocPath($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocPath (GocPathAncestry $_) {
    my $to-parent;

    $!gop = do {
      when GocPath {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocPath, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocPath
  { $!gop }

  multi method new (
    $goffice-canvas-shape where * ~~ GocPathAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method closed is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('closed', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('closed', $gv);
      }
    );
  }

  # Type: boolean
  method fill-rule is rw  is g-property is also<fill_rule> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fill-rule', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('fill-rule', $gv);
      }
    );
  }

  # Type: GOPath
  method path ( :$raw = False ) is rw is g-property {
    my $gv = GLib::Value.new( GOffice::Path.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('path', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GOffice::Path.getTypePair
        );
      },
      STORE => -> $, GOPath() $val is copy {
        $gv.object = $val;
        self.prop_set('path', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_path_get_type, $n, $t );
  }
}


our subset GocPixbufAncestry is export of Mu
  where GocPixbuf | GocStyledItemAncestry;

class GOffice::Canvas::Pixbuf is GOffice::Canvas::Item {
  also does ShapeCanvasCreation;

  has GocPixbuf $!gop is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocPixbuf($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocPixbuf (GocPixbufAncestry $_) {
    my $to-parent;

    $!gop = do {
      when GocPixbuf {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocPixbuf, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocPixbuf
  { $!gop }

  multi method new (
    $goffice-canvas-shape where * ~~ GocPixbufAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: GdkPixbuf
  method pixbuf ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GDK::Pixbuf.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pixbuf', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GDK::Pixbuf.getTypePair
        );
      },
      STORE => -> $, GdkPixbuf() $val is copy {
        $gv.object = $val;
        self.prop_set('pixbuf', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_pixbuf_get_type, $n, $t );
  }
}


our subset GocPolygonAncestry is export of Mu
  where GocPolygon | GocStyledItemAncestry;

class GOffice::Canvas::Polygon is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocPolygon $!gop is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocPolygon($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocPolygon (GocPolygonAncestry $_) {
    my $to-parent;

    $!gop = do {
      when GocPolygon {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocPolygon, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocPolygon
  { $!gop }

  multi method new (
    $goffice-canvas-shape where * ~~ GocPolygonAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method fill-rule is rw  is g-property is also<fill_rule> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('fill-rule', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('fill-rule', $gv);
      }
    );
  }

  # Type: GocPoints
  method points ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Canvas::Points.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('points', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |GOffice::Canvas::Points.getTypePair
        );
      },
      STORE => -> $, GocPoints() $val is copy {
        $gv.boxed = $val;
        self.prop_set('points', $gv);
      }
    );
  }

  # Type: GocIntArray
  method sizes ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Canvas::IntArray.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sizes', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |GOffice::Canvas::IntArray.getTypePair
        );
      },
      STORE => -> $, GocIntArray() $val is copy {
        $gv.boxed = $val;
        self.prop_set('sizes', $gv);
      }
    );
  }

  # Type: boolean
  method use-spline is rw  is g-property is also<use_spline> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-spline', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-spline', $gv);
      }
    );
  }


  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_polygon_get_type, $n, $t );
  }
}

our subset GocPolylineAncestry is export of Mu
  where GocPolyline | GocStyledItemAncestry;

class GOffice::Canvas::Polyline is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocPolyline $!gcp is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocPolyline($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocPolyline (GocPolylineAncestry $_) {
    my $to-parent;

    $!gcp = do {
      when GocPolyline {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocPolyline, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocPolyline
  { $!gcp }

  multi method new (
    $goffice-canvas-shape where * ~~ GocPolylineAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: GOPoints
  method points ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Points.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('points', $gv);
        propReturnObject(
          $gv.boxed,
          $raw,
          |GOffice::Points.getTypePair
        );
      },
      STORE => -> $, GocPoints() $val is copy {
        $gv.boxed = $val;
        self.prop_set('points', $gv);
      }
    );
  }

  # Type: boolean
  method use-spline is rw  is g-property is also<use_spline> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('use-spline', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('use-spline', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_polyline_get_type, $n, $t );
  }
}

our subset GocRectangleAncestry is export of Mu
  where GocRectangle | GocStyledItemAncestry;

class GOffice::Canvas::Rectangle is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocRectangle $!gor is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocRectangle($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocRectangle (GocRectangleAncestry $_) {
    my $to-parent;

    $!gor = do {
      when GocRectangle {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocRectangle, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocRectangle
  { $!gor }

  multi method new (
    $goffice-canvas-shape where * ~~ GocRectangleAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: double
  method rx is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rx', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rx', $gv);
      }
    );
  }

  # Type: double
  method ry is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('ry', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('ry', $gv);
      }
    );
  }

  # Type: int
  method type is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('type', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('type', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_rectangle_get_type, $n, $t );
  }
}

our subset GocTextAncestry is export of Mu
  where GocText | GocStyledItemAncestry;

class GOffice::Canvas::Text is GOffice::Canvas::StyledItem {
  also does ShapeCanvasCreation;

  has GocText $!got is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocText($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocText (GocTextAncestry $_) {
    my $to-parent;

    $!got = do {
      when GocText {
        $to-parent = cast(GocStyledItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocText, $_);
      }
    }
    self.setGocStyledItem($to-parent);
  }

  method GOffice::Raw::Structs::GocText
    is also<GocText>
  { $!got }

  proto method new (|)
  { * }

  multi method new (
    $goffice-canvas-shape where * ~~ GocTextAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: GOAnchorType
  method anchor ( :$enum = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GOffice::Enums::AnchorType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('anchor', $gv);
        my $e = $gv.enum;
        return $e unless $enum;
        GOAnchorTypeEnum($e);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GOAnchorType) = $val;
        self.prop_set('anchor', $gv);
      }
    );
  }

  # Type: PangoAttrList
  method attributes ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( Pango::AttrList.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('attributes', $gv);
        propReturnObject(
          $gv.pointer,
          $raw,
          |Pango::AttrList.getTypePair
        );
      },
      STORE => -> $, PangoAttrList() $val is copy {
        $gv.object = $val;
        self.prop_set('attributes', $gv);
      }
    );
  }

  # Type: boolean
  method clip is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('clip', $gv);
      }
    );
  }

  # Type: double
  method clip-height is rw  is g-property is also<clip_height> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip-height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('clip-height', $gv);
      }
    );
  }

  # Type: double
  method clip-width is rw  is g-property is also<clip_width> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('clip-width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('clip-width', $gv);
      }
    );
  }

  # Type: double
  method rotation is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rotation', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('rotation', $gv);
      }
    );
  }

  # Type: string
  method text is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('text', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('text', $gv);
      }
    );
  }

  # Type: double
  method wrap-width is rw  is g-property is also<wrap_width> {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('wrap-width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('wrap-width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_text_get_type, $n, $t );
  }
}

use GTK::Widget;

our subset GocWidgetAncestry is export of Mu
  where GocWidget | GocStyledItemAncestry;

class GOffice::Canvas::Widget is GOffice::Canvas::Item {
  also does ShapeCanvasCreation;

  has GocWidget $!gcw is implementor;

  submethod BUILD ( :$goffice-canvas-shape ) {
    self.setGocWidget($goffice-canvas-shape) if $goffice-canvas-shape
  }

  method setGocWidget (GocTextAncestry $_) {
    my $to-parent;

    $!gcw = do {
      when GocText {
        $to-parent = cast(GocItem, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GocWidget, $_);
      }
    }
    self.setGocItem($to-parent);
  }

  method GOffice::Raw::Definitions::GocWidget
  { $!gcw }

  multi method new (
    $goffice-canvas-shape where * ~~ GocWidgetAncestry,

    :$ref = True
  ) {
    return unless $goffice-canvas-shape;

    my $o = self.bless( :$goffice-canvas-shape );
    $o.ref if $ref;
    $o;
  }

  # Type: double
  method height is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('height', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('height', $gv);
      }
    );
  }

  # Type: GtkWidget
  method widget ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('widget', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Widget.getTypePair
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('widget', $gv);
      }
    );
  }

  # Type: double
  method width is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('width', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('width', $gv);
      }
    );
  }

  # Type: double
  method x is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('x', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('x', $gv);
      }
    );
  }

  # Type: double
  method y is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('y', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('y', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &goc_widget_get_type, $n, $t );
  }

  method set_bounds (Num() $left, Num() $top, Num() $width, Num() $height) is also<set-bounds> {
    my gdouble ($l, $t, $w, $h) = ($left, $top, $width, $height);

    goc_widget_set_bounds($!gcw, $l, $t, $w, $h);
  }
}

### /usr/src/goffice/goffice/canvas/goc-circle.h

sub goc_circle_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-arc.h

sub goc_arc_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-polygon.h

sub goc_polygon_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-ellipse.h

sub goc_ellipse_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-graph.h

sub goc_graph_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-image.h

sub goc_image_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-line.h

sub goc_line_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-path.h

sub goc_path_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-pixbuf.h

sub goc_pixbuf_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-polyline.h

sub goc_polyline_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-rectangle.h

sub goc_rectangle_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-text.h

sub goc_text_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

### /usr/src/goffice/goffice/canvas/goc-widget.h

sub goc_widget_get_type
  returns GType
  is      native(goffice)
  is      export
{ * }

sub goc_widget_set_bounds (
  GocWidget $widget,
  gdouble   $left,
  gdouble   $top,
  gdouble   $width,
  gdouble   $height
)
  is      native(goffice)
  is      export
{ * }
