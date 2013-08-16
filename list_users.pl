#!/usr/bin/perl -w

#   
#   orion_irc_list_users lists the user of a specific channel in a IRC-Network with Orion IRC-Services.
#   Copyright (C) 2013 Simon Plasger
#   
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#   

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
