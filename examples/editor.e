use v6.c;

use GTK::Raw::Types;

use GOffice::Math::Editor;

use GIO::Resource;
use GTK::Application;
use GTK::Box;
use GTK::Button;
use GOffice::Math::Editor;

my $app = GTK::Application.new(
  title  => 'org.genex.workbook.control.gui',
  width  => 1024,
  height => 768
);

$app.activate.tap: SUB {
  my $me = GOffice::Math::Editor.new;

  $app.window.add($me);
  $app.window.show-all;
}

$app.run;
