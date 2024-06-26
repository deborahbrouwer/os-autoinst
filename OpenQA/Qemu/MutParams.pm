# Copyright 2018 SUSE LLC
# SPDX-License-Identifier: GPL-2.0-or-later

=head2 OpenQA::Qemu::MutParams

This is the base class for an object model of some mutable QEMU state. The
Proc class keeps a list of MutParams and generates the QEMU command line from
that list.

Mutable parameters are parameters which can change during the test. Initially
this is limited to block devices which change due to snapshots although
MutParams are also used to represent static devices which benefit from the
added structure.

=cut

package OpenQA::Qemu::MutParams;
use Mojo::Base -base, -signatures;

use Scalar::Util 'blessed';

sub _push_ifdef ($self, $arr, $prefix, $val) { push(@$arr, $prefix . $val) if defined $val }

=head3 gen_cmdline

Create the necessary QEMU command line parameters for whatever this object
model represents.

=cut
sub gen_cmdline ($self) { die blessed($self) . ' has not implemented gen_cmdline' }

=head3 to_map

Convert to a plain hash map with limited nesting, which can easily be serialized.

=cut
sub to_map ($self) { die blessed($self) . ' has not implemented to_map' }

=head3 from_map

The inverse of to_map.

=cut
sub from_map ($self) { die blessed($self) . ' has not implemented from_map' }

=head3 has_state

Return true if this object has been populated. Put another way, it returns
false if the object's properties are all defaults.

This is used to decide if the object can have state loaded into it without
clobbering some existing information.

=cut
sub has_state ($self) { die blessed($self) . ' has not implemented has_state' }

1;
