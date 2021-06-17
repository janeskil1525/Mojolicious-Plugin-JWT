use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::JWT',
  VERSION_FROM => 'lib/Mojolicious/Plugin/JWT.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '8.65'},
  test         => {TESTS => 't/*.t'}
);
