use base "basetest";
use bmwqemu;

sub is_applicable()
{
	return $ENV{DESKTOP}=~/kde|gnome/;
}

sub run()
{
	my $self=shift;
	x11_start_program("oowriter");
	sleep 2; waitidle; # extra wait because oo sometimes appears to be idle during start
	$self->take_screenshot;
	sendkey "alt-f4"; sleep 2;
}

sub checklist()
{
	# return hashref:
	return {qw(
		a5fbe661f892c38c5069bf3430cac25b OK
		190acc3807f1f613aae461f805473e02 OK
		b4d6d76baae4254e0e01140bed1614e3 OK
		cab8e1d51a429d42ad922c88a786d591 OK
		bd32d2896fe9ee327724bce46ffe32be OK
		6edae3afba71dd93f7615791af5e4912 OK
		1aa2225b803c4712e2213d8639131b2c minorissue64bit
	)}
}

1;
