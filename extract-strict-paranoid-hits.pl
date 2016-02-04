#!/usr/bin/env perl;

use strict;
use warnings;


my $filename = $ARGV[0];

open (FH, "< $filename") or die "Can't open $filename for read: $!";
open (OF, "> strict-hits.tsv") or die "Can't open file to write: $!";;

my @result;

while (<FH>) {
	my $line = $_;
	my ($capture)         = $line =~ m/\d*\t\d*\t(.*scaffold.+\t).*/;

	#print split('\t', $capture);
	my @myArray = split (/\s+/, $capture);

	my $id;
	my $value;
	foreach my $loop_variable (@myArray) {
		#print $loop_variable;
		#my ($bla)			  = $loop_variable =~ m/(.*scaffold.*)\s/;
		#my ($value)			  = $loop_variable =~ m/(\s\d.\d+)/;
		#print $bla, "\n";
		#print $value, "\n";
	    if ($loop_variable =~ m/scaffold/) {
	    		$id = $loop_variable;
	    	} else {
	    		$value = $loop_variable;
	    		if ($value == 1) {
	    			print OF $id, "\t", $value, "\n";
	    		}
	    	}
	};

#	print join("\n",@myArray),"\n";

	#print join(':', split('\t', $capture)), "\n";
}


#print join("\n",@result),"\n";
