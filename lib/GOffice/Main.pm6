use v6.c;

use GOffice::Raw::Definitions;
use GOffice::Raw::Main;

use GOffice::Plugin;

use GLib::Roles::StaticClass;

class GOffice::Main {
  also does GLib::Roles::StaticClass;

  method init {
    libgoffice_init;
  }

  method shutdown {
    libgoffice_shutdown;
  }

}

INIT {
  GOffice::Main.init;
  GOffice::Plugins.init if $GOFFICE-AUTO-INIT-PLUGINS;
  $GOFFICE-INIT = True;
}

END  {
  GOffice::Plugins.shutdown if $GOFFICE-AUTO-INIT-PLUGINS;
  GOffice::Main.shutdown;
  $GOFFICE-INIT = False;
}
