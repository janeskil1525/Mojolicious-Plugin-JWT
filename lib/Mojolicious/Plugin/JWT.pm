package Mojolicious::Plugin::JWT;
use Mojo::Base 'Mojolicious::Plugin', -signatures, -async_await;

use Mojo::JWT;

has 'secret' => qw {lK1leAbOxGmUKdVmuMKbJtD7ru1wd2V9Y5e58zLPlL5UI4GP1AETmd7eZ3MRZEP};

our $VERSION = '0.01';

sub register {
  my  ($self, $app) = @_;

  $app->helper(JWT => sub {$self});
}

async sub encode_jwt($self, $claim) {

  my $secret = $self->secret();
  my $jwt = Mojo::JWT->new(claims => $claim, secret => $secret)->encode;

  return $jwt
}

async sub decode_jwt($self, $jwt) {

  my $secret = $self->secret();
  my $claims = Mojo::JWT->new(secret => $secret)->decode($jwt);

  return $claims;
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
