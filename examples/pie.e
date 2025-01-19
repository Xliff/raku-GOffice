use v6.c;

use GOffice::Raw::Types;
use GTK::Raw::Stock;

use GTK::Application;
use GTK::Box;
use GTK::Button;
use GTK::Separator;

my $app = GTK::Application.new(
  id     => 'org.genex.goffice.pie',
  width  => 1024,
  height => 768
);

use GOffice::Main;
use GOffice::Graph::Label;
use GOffice::Graph::Plot;
use GOffice::Graph::Widget;

$app.activate.tap: SUB {
  my $box   = GTK::Box.new-vbox;
  my $sep   = GTK::Separator.new( :h );
  my $btn   = GTK::Button.new-from-stock(GTK_STOCK_QUIT);
  my $rng   = GTK::Button.new-with-label('Randomize Data');
  my $gw    = GOffice::Graph::Widget.new;
  my $graph = $gw.get-graph;
  my $chart = $gw.get-chart;

  my $pie   = GOffice::Graph::Plot.new-by-name('GogPiePlot')
    or
  die 'Plot did not initialize!';

  my $s     = $pie.new-series;
  my $l     = GOffice::Graph::Label.new(
    "Some Statistics",
    font-desc => "Sans bold 32",
    :copy
  );

  $s.set-dim(:labels, <first second third fourth>);

  sub randomize {
    $s.set-dim(:data, (10 * (^10).pick) xx 4 );
  }

  randomize;
  $rng.clicked.tap: SUB { randomize };

  $graph.add-by-name('Title', $l);
  $chart.add-by-name('Plot', $pie);

  $btn.clicked.tap: SUB { $app.quit( :gio ) }

  $box.push: $_, :end for $btn, $rng;
  $box.push: $gw, :fill, :expand;
  $box.push: $sep;

  $app.window.title = 'Pie Plot';
  $app.window.add($box);
  $app.window.show-all;
}

$app.run;
