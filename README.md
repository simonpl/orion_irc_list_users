Orion_irc_list_users
====================

Setup
-----

1. Set up your Orion IRC-Services Installation (You can get the Orion IRC-Services via http://deepirc.net/orion)

2. Copy the file `list_users_configuration.pm.dist` to `list_users_configuration.pm`

3. Adjust `list_users_configuration.pm` to the values that fit with your setup.

4. Mark `list_users.pl` as executable (`chmod +x list_users.pl`).

Usage
-----

`./list_users.pl ['#channel']`

If '#channel' is given, the users in #channel will be listed. Otherwise the users in the channel specified in the configuration will be listed.

Example: `./list_users.pl '#yourchannel'`

Requirements
------------

* Perl 5 (tested with Perl v5.14.2)
* The Perl-module DBI
* A running MySQL-Server
* Orion IRC-Services installed and running.

License
-------

orion_irc_list_users lists the user of a specific channel in a IRC-Network with Orion IRC-Services.
Copyright (C) 2013 Simon Plasger

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

See COPYING for details.
