use v6.c;

use Method::Also;

use GLib::Raw::Definitions;
use GLib::Raw::Subs;
use GTK::Raw::Definitions;
use GOffice::Raw::Definitions;
use GOffice::Raw::Math::Editor;

use GTK::Bin;

use GLib::Roles::Implementor;

our subset GoMathEditorAncestry is export of Mu
  where GoMathEditor | GtkBinAncestry;

class GOffice::Math::Editor is GTK::Bin {
  has GoMathEditor $!gome is implementor;

  submethod BUILD ( :$goffice-math-editor ) {
    self.setGoMathEditor($goffice-math-editor) if $goffice-math-editor
  }

  method setGoMathEditor (GoMathEditorAncestry $_) {
    my $to-parent;

    $!gome = do {
      when GoMathEditor {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoMathEditor, $_);
      }
    }
    self.setGtkBin($to-parent);
  }

  method GOffice::Raw::Definitions::GoMathEditor
    is also<GOMathEditor>
  { $!gome }

  multi method new (
    $goffice-math-editor where * ~~ GoMathEditorAncestry,

    :$ref = True
  ) {
    return unless $goffice-math-editor;

    my $o = self.bless( :$goffice-math-editor );
    $o.ref if $ref;
    $o;
  }
  multi method new ( *%a ) {
    my $goffice-math-editor = go_math_editor_new();

    return Nil unless $goffice-math-editor;
    my $o = self.bless( :$goffice-math-editor );
    $o.setAttributes(%a) if $o && +%a;
    $o;
  }

  method inline-changed is also<inline_changed> {
    self.connect($!gome, 'inline-changed');
  }

  method itex-changed is also<itex_changed> {
    self.connect($!gome, 'itex-changed');
  }

  method get_inline is also<get-inline> {
    go_math_editor_get_inline($!gome);
  }

  method get_itex is also<get-itex> {
    go_math_editor_get_itex($!gome);
  }

  method get_mathml is also<get-mathml> {
    go_math_editor_get_mathml($!gome);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &go_math_editor_get_type, $n, $t );
  }

  method set_inline (Int() $mode) is also<set-inline> {
    my gboolean $m = $mode.so.Int;

    go_math_editor_set_inline($!gome, $m);
  }

  method set_itex (Str() $text) is also<set-itex> {
    go_math_editor_set_itex($!gome, $text);
  }

  method set_mathml (Str() $text) is also<set-mathml> {
    go_math_editor_set_mathml($!gome, $text);
  }

}
