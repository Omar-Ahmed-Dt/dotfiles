#!/usr/bin/env perl
# Simplified MPD script to handle play/pause and display metadata

use strict;
use warnings;
use Env qw(BLOCK_BUTTON);

# Handle button presses for MPD
sub buttons {
    if (defined $ENV{'BLOCK_BUTTON'}) {
        if ($ENV{'BLOCK_BUTTON'} == 1) {
            system("mpc toggle");
        } elsif ($ENV{'BLOCK_BUTTON'} == 3) {
            system("mpc prev");
        }
    }
}

# Fetch MPD metadata
sub mpd {
    # Get MPD status and metadata
    my $status_line = qx(mpc | grep -E '^\[playing\]|\[paused\]');
    my $song = qx(mpc current);
    chomp($status_line);
    chomp($song);

    # Extract the status (playing or paused)
    my ($status) = $status_line =~ /\[(playing|paused)\]/;

    # Check if song is playing or paused
    if ($song eq '') {
        print("No music playing\n");
        exit 0;
    } else {
        buttons();

        # Append "(Paused)" if the status is paused
        if (defined $status && $status eq 'paused') {
            print("$song (Paused)\n");
        } else {
            print("$song\n");
        }
        exit 0;
    }
}

# Run the MPD function
mpd;

