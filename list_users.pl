#!/usr/bin/perl -w

use warnings;
use strict;
use list_users_configuration;
use DBI;

my $channel;
if(scalar(@ARGV) > 0)
{
    $channel = $ARGV[0];
}
else
{
    $channel = $list_users_configuration::channel;
}
my $con = DBI->connect('DBI:mysql:'.$list_users_configuration::database.';host='.$list_users_configuration::host, $list_users_configuration::user, $list_users_configuration::password) || die "Could not connect to database: $DBI::errstr";
my $query = $con->prepare("SELECT nick FROM `orion_chan_users` WHERE channel=?");
$query->execute($channel);
my $nick;
$query->bind_columns(\$nick);
while($query->fetch())
{
    print $nick."\n";
}
$con->disconnect();
