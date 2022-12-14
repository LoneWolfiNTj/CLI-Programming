#! /usr/bin/perl

# This is a 120-character-wide UTF-8 Unicode Perl source-code text file with hard Unix line breaks ("\x{0A}").
# ¡Hablo Español! Говорю Русский. Björt skjöldur. ॐ नमो भगवते वासुदेवाय. 看的星星，知道你是爱。 麦藁雪、富士川町、山梨県。
# =======|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|

########################################################################################################################
# RH/RegTest.pm
# Regular Expression Test Module
# Class for testing regular expressions.
# Usage:
#    my $tester = RH::RegTest->new(@ARGV);
#    $tester->match($MyDamnString);
# Written by Robbie Hatley.
# Edit history:
# Tue Mar 24, 2015:
#    Wrote it.
# Sun Dec 31, 2017:
#    use v5.26.
# Sat Nov 20, 2021: use v5.32. Renewed colophon. Revamped pragmas & encodings.
########################################################################################################################

# Package:
package RH::RegTest;

# Pragmas:
use v5.32;
use strict;
use warnings;
use experimental 'switch';
use utf8;
use warnings FATAL => 'utf8';

# Encodings:
use open ':std', IN  => ':encoding(UTF-8)';
use open ':std', OUT => ':encoding(UTF-8)';
use open         IN  => ':encoding(UTF-8)';
use open         OUT => ':encoding(UTF-8)';
# NOTE: these may be over-ridden later. Eg, "open($fh, '< :raw', e $path)".

# CPAN modules:
use Sys::Binmode;
# Note: Don't use "use parent 'Exporter';" here, because this module doesn't export anything, because it is a class.

sub new
{
   my $class  = shift;
   my $re = @_ ? shift : '^.+$';
   if ( ! defined $re ) {die "Bad RegExp.\n$!\n";}
   my $RegExp = qr/$re/o;
   say "RegExp = \"$RegExp\"";
   my $self = {RegExp => $RegExp};
   return bless $self, $class;
}

sub match
{
   my $Self    = shift;
   my $RegExp  = $Self->{RegExp};
   my $Text    = shift;
   say '';
   say "Text   = \"$Text\"";
   my @Matches = $Text =~ m/$RegExp/;
   if (@Matches)
   {
      say "Text matches RegExp.";
      say ( "Length  of \$` = "  ,   length($`) ,        );
      say ( "Content of \$` = \"",          $`  , "\""   );
      say ( "Length  of \$& = "  ,   length($&) ,        );
      say ( "Content of \$& = \"",          $&  , "\""   );
      say ( "Length  of \$' = "  ,   length($') ,        );
      say ( "Content of \$' = \"",          $'  , "\""   );
      if ($1)
      {
         say scalar(@Matches), " captures: ", join(', ', map {"\"$_\""} @Matches);
      }
      else
      {
         say('No captures.');
      }
   }
   else
   {
      say "Text does NOT match Regex.";
   }
}

1;
