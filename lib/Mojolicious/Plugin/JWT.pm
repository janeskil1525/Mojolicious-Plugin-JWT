package Mojolicious::Plugin::JWT;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

sub register {
  my ($self, $app) = @_;
}

1;

=encoding utf8

=head1 NAME

Mojolicious::Plugin::JWT - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('JWT');

  # Mojolicious::Lite
  plugin 'JWT';

=head1 DESCRIPTION

L<Mojolicious::Plugin::JWT> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::JWT> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<https://mojolicious.org>.

=cut
