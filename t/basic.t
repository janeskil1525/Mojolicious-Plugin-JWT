use Mojo::Base -strict, -signatures, -async_await;

use Test::More;
use Mojolicious::Lite;
use Test::Mojo;
use Data::Dumper;

plugin 'JWT';

get '/' => sub {
  my $c = shift;

  test_encode($c)->then(sub($jwt) {
    say $jwt;
    test_decode($c, $jwt)->then(sub($claims){
      say Dumper($claims);
    })->catch(sub($err){
      say $err;
    })->wait;
  })->catch(sub($err){
    say $err;
  })->wait;


  $c->render(text => 'Hello Mojo!');
};

async sub test_decode($c, $jwt) {

  my $secret = qw {lK1leAbOxGmUKdVmuMKbJtD7ru1wd2V9Y5e58zLPlL5UI4GP1AETmd7eZ3MRZEP};

  my $claim = await $c->app->JWT->decode_jwt($jwt);

  return $claim;
}

async sub test_encode($c) {

  my $secret = qw {lK1leAbOxGmUKdVmuMKbJtD7ru1wd2V9Y5e58zLPlL5UI4GP1AETmd7eZ3MRZEP};
  my $claim->{name} = "Jan Eskilsson";
  $claim->{email} = 'janeskil1525@gmail.com';

  my $jwt = await $c->app->JWT->encode_jwt($claim);

  return $jwt;
}

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_is('Hello Mojo!');

done_testing();
