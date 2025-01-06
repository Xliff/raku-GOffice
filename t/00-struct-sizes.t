use v6.c;

use Test;
use NativeCall;

use GOffice::Raw::Types;

use lib <scripts ../scripts release-scripts ../release-scripts>;

use ScriptConfig;

#require ::($_ = "GLib::Raw::Structs");
my $prefix  = %config<prefix>.subst('::', '');
my $cu      = "{ $prefix }::Raw::Structs";
try require ::($cu);

#$cu ~= '::EXPORT::DEFAULT';
my @classes =
  ::("$cu").WHO
           .keys
           .grep({
              my @a = |%config<struct-prefix>, $prefix;
              [&&](
                .trim.chars,
                .defined,
                .starts-with( @a.any ),
                .contains('-').not
              );
            })
           .sort;
@classes.push: (%config<extra-test-classes> // '').split(',');

plan @classes.elems;

for @classes {
  sub sizeof () returns int64 { ... }

  unless .trim.chars {
    pass "Emptyish string value is not allowed (are we here?)";
    next;
  }

  my $c = ::("{ $cu }::$_");

  if $c.^name.ends-with($_).not {
    pass "Skipping because { $c.^name } is an alias for { $_ }";
    next;
  }

  trait_mod:<is>( &sizeof, :native('t/00-struct-sizes.so') );
  trait_mod:<is>(
    &sizeof,
    :symbol( 'sizeof_' ~ ($_ ~~ StructActualName ?? .actual-name !! $_) )
  );

  #say "In loop for ('{ $_ } / { $c.HOW } / { $c.REPR }')...";

  unless $c.HOW ~~ Metamodel::ClassHOW {
    pass "{ $_ } is not a class";
    next;
  }

  unless $c.REPR eq 'CStruct' {
    pass "{ $_ } is not a CStruct";
    next;
  }

  #diag $_;
  if
    ($c.WHY.leading // '') ~~ / ['Opaque' | 'Skip Struct'] [':' (.+) ]? $$ /
    ||
    $c ~~ StructSkipsTest
  {

    my $pass-msg = "Structure '{ $_ }' is not to be tested";
    if $c ~~ StructSkipsTest {
      $pass-msg ~= " ({ $c.reason })";
    } else {
      $pass-msg ~= " ({ $/[0] })" if $/[0]
    }

    pass $pass-msg;
    next;
  }
  is nativesizeof($c), sizeof(), "Structure sizes for { $_ } match";
}

# cw: Use for generic struct size debugging.
#
# for <gsize GstMapFlags GHookList> {
#   sub sizeof () returns int64 { ... }
#   trait_mod:<is>( &sizeof, :native('t/00-struct-sizes.so') );
#   trait_mod:<is>( &sizeof, :symbol('sizeof_' ~ $_) );
#
#   diag sizeof();
# }
