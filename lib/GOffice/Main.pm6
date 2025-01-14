use v6.c;

use GOffice::Raw::Definitions;
use GOffice::Raw::Main;

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

INIT { GOffice::Main.init;     $GOFFICE-INIT = True  }
END  { GOffice::Main.shutdown; $GOFFICE-INIT = False }
