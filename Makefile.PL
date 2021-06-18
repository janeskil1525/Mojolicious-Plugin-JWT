use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::JWT',
  VERSION_FROM => 'lib/Mojolicious/Plugin/JWT.pm',
  AUTHOR       => 'Jan Eskilsson <janeskil1525@gmail.com>',
  PREREQ_PM    => {'Mojolicious' => '8.65'},
  test         => {TESTS => 't/*.t'}
);
