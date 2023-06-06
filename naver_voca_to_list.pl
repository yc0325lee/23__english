# vim: ft=perl ts=4 sw=4 tw=999 expandtab
# ----------------------------------------------------------------------------
# File : naver_voca_to_list.pl
# Author : yc0325lee
# Created : 2022-09-05 20:56:42 by lee2103
# Modified : 2022-09-05 20:56:42 by lee2103
# Description : 
# ----------------------------------------------------------------------------
use strict;
use warnings;
use Carp;
use Data::Dumper; $Data::Dumper::Indent = 1;
use FindBin; use lib $FindBin::Bin;

my $word = undef;
my $meanings = [];

while( <> ) {
    s/\s*\[[^[]]+\]\s*//g;
    s/·//g; # remove unnecessary characters

    if( 0 ) { }
    elsif( m/^[a-z]+\d?\b/ ) {
        if( defined $word ) {
            print_meanings($meanings);
            $meanings = []; # init
        }
        m/^([a-z]+\d?)\b/;
        $word = $1; # a new word
        $word =~ s/\d+$//;
        printf("%s = ", $word);
    }
    elsif( m/^\d+\./ ) {
        $_ = <>; # next-line
        chomp;
        s/·//g; # remove unnecessary characters
        s/…/~/g;
        s/\s*\[(?:명사|형용사|동사|자동사|타동사|부사|전치사)\]\s*//g;
        push(@{$meanings}, $_);
    }

    if( eof() ) { # last one!
        print_meanings($meanings);
    }
}

sub print_meanings {
    @_==1 or die "";
    my $aref = shift;
    printf("%s\n", join("; ", @{$aref}));
}
