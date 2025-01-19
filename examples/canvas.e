use v6.c;

use GOffice::Raw::Types;

use GLib::Timeout;
use Pango::FontDescription;
use GTK::Application;
use GTK::Box;
use GTK::ColorButton;
use GTK::FontButton;
use GOffice::Font;
use GOffice::Main;
use GOffice::Canvas;
use GOffice::Canvas::Shapes;
use GOffice::Style;

my @l = (|'A'...'Z', |'a'...'z', |'0'...'9');

my (&set-letter, $cn, $c, $fd, $l, $fb);

sub MAIN ( :$widget, :$item ) {
  if $widget == $item {
    $*USAGE.say;
    exit;
  }

  my %h;
  %h<widget> = True if $widget;
  %h<item>   = True if $item;

  my $app = GTK::Application.new(
    title  => 'org.genex.workbook.control.gui',
    width  => 1024,
    height => 768
  );

  $app.activate.tap: SUB {
    my $v  = GTK::Box.new-vbox(10);
    my $h  = GTK::Box.new-hbox(5);
    my $cb = GTK::ColorButton.new;

    $fb = GTK::FontButton.new;
    $fd = Pango::FontDescription.new-from-string('Sans 72');
    $cn = GOffice::Canvas.new;

    $fb.font-desc = $fd;

    create-canvas-item( |%h );

    $c = $cb.rgba = GDK::RGBA.new(255, 255, 255, 255);
    $cb.color-activated.tap: SUB { $c = $cb.rgba }

    say "Size: { $cn.width } X { $cn.height }";

    my  $speed = 1.25;
    my ($Δx, $Δy) = (1, 1) »*» $speed;

    GLib::Timeout.add(100,  SUB {
      CATCH { default { .message.say; .backtrace.concise.say } }

      ($l.x, $l.y) »+=« ($Δx, $Δy);
      $Δx = 1  * $speed if $Δx < 0;
      $Δx = -1 * $speed if $Δx > $cn.width;
      $Δy = 1  * $speed if $Δy < 0;
      $Δy = -1 * $speed if $Δy > $cn.height;

      G_SOURCE_CONTINUE
    });

    $h.push( :fill, :expand, $_  ) for $fb, $cb;
    $v.push( :fill,          $h  );
    $v.push( :fill, :expand, $cn );

    $app.window.add($v);
    $app.window.show-all;
  }

  set-letter() if &set-letter;

  GLib::Timeout.add(3000, SUB { set-letter() if &set-letter });

  $app.run;
}

multi sub create-canvas-item ( :$item is required where *.so ) {
  my $f = GOffice::Font.new-by-desc($fd);

  $l    = GOffice::Canvas::Text.new($cn.root);

  my $s = $l.get_style;
  $s.flags = GO_STYLE_ALL;
  $s.set-font($f);
  $s.font.color = 0xffffffff;
  $l.set_style($s);

  $fb.font-set.tap: SUB {
    say "Style font color: { $l.style.font.color }";
    my $f = GOffice::Font.new-by-desc($fb.font-desc);
    $l.style.set-font($f);
    $l.style.font.color = 0xffffffff;
  }

  &set-letter = sub {
    my $s = $l.get_style;
    say "Setting letter to { $l.text = @l.pick; }";
    say "Color: { $s.font.color }";
    G_SOURCE_CONTINUE
  }
}

multi sub create-canvas-item ( :$widget is required where *.so ) {
  use GTK::Label;

  my $lab = GTK::Label.new;

  $l      = GOffice::Canvas::Widget.new($cn.root);

  ($l.widget = $lab).show-all;

  $fb.font-set.tap: SUB {
    $lab.layout.font-desc = $fb.font-desc;
  }

  &set-letter = sub {
    my $letter = @l.pick;
    say "Setting letter to { $letter } with color { $c.rgba-hex }";
    $lab.markup = "<span color=\"{ $c.rgba-hex }\">{
      $lab.text = $letter }</span>";
    G_SOURCE_CONTINUE;
  }
}
