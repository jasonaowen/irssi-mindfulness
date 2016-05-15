# Copyright 2016 Jason Owen <jason.a.owen@gmail.com>

# This file is part of irssi-mindfulness.

# irssi-mindfulness is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# irssi-mindfulness is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with irssi-mindfulness.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use warnings;

require Irssi;

our $VERSION = '0.01';
our %IRSSI = (
  authors     => 'Jason Owen',
  contact     => 'jason.a.owen@gmail.com',
  name        => 'Mindfulness',
  description => 'Be more careful of the language you use.',
  license     => 'GPLv3',
);

Irssi::settings_add_str($IRSSI{name}, $IRSSI{name} . '_term', 'you guys');
Irssi::settings_add_str($IRSSI{name}, $IRSSI{name} . '_error_effect', "%U");

Irssi::signal_add('send text', sub {
  my ($msg, $server, $window) = @_;
  return unless $server;

  my $term = Irssi::settings_get_str($IRSSI{name} . '_term');

  if ($msg =~ /$term/) {
    my $error_start = Irssi::settings_get_str($IRSSI{name} . '_error_effect');
    my $error_end = "%n"; # previous colour

    my $msg_with_error = $msg =~ s/($term)/${error_start}${1}${error_end}/gir;
    my $response = $IRSSI{name} . ": " . $msg_with_error;

    $server->print($window->{name}, $response, Irssi::MSGLEVEL_NOTICES);
    Irssi::signal_stop();
  }
});
