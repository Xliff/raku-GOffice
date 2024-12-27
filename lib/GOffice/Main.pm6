use v6.c;

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

INIT { GOffice::Main.init     }
EXIT { GOffice::Main.shutdown }
