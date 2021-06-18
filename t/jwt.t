use Mojo::Base -strict, -signatures, -async_await;

use Test::More;
use Test::Mojo;


sub test_encode_async {

	test_encode()
}

async sub test_encode($c) {

	my $secret = qw {lK1leAbOxGmUKdVmuMKbJtD7ru1wd2V9Y5e58zLPlL5UI4GP1AETmd7eZ3MRZEP};
	my $claim->{name} = "Jan Eskilsson";
	$claim->{email} = 'janeskil1525@gmail.com';

	my $jwt = await $c->JWT->encode_jwt($claim, $secret);

	return $jwt;
}

ok(test_encode_async() ne '');
done_testing();

