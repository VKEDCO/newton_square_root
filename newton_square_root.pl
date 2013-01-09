##################################################
## Newton's square root approximation
## Use dos2unix to to handle ^M.
##
## Bugs to vladimir dot kulyukin at gmail dot com
##################################################

use warnings;
use strict;

## global (to this module) error tolerance variable
my $error_tolerance = .001;

sub square {
  ($#_ == 0) or die 'square must have 1 argument';
  return $_[0]**2;
}

sub average {
  ($#_ == 1) or die 'average must have 2 arguments';
  return ($_[0] + $_[1])/2.0;
}

sub improve_guess {
  ($#_ == 1) or die 'improve_guess must have 2 arguments';
  my ($guess, $n) = @_;
  return average($guess, $n/$guess);
}

sub is_good_enough {
  ($#_ == 1) or die 'is_good_enough must have 2 arguments';
  my ($guess, $n) = @_;
  (abs(square($guess)- $n) <= $error_tolerance)? 1: 0; 
}

sub sqrt_iter {
  ($#_ == 1) or die 'sqrt_iter must have 2 arguments';
  my ($guess, $n) = @_;
  if ( is_good_enough($guess, $n) ) {
    return $guess;
  }
  else {
    print 'improve_guess(', $guess, ', ', $n, ')=', improve_guess($guess, $n), "\n";
    return sqrt_iter(improve_guess($guess, $n), $n);
  }
}

sub newton_sqrt {
  ($#_ == 0) or die '(newton_sqrt must have 1 argument';
  return sqrt_iter(1, $_[0]);
}

my $sqrt_of_2 = newton_sqrt(2);
my $sqrt_of_3 = newton_sqrt(3);
my $sqrt_of_4 = newton_sqrt(4);

print 'newton_sqrt(2)=', newton_sqrt(2), ' ', 'sqrt(2)=', sqrt(2), "\n\n";
print 'newton_sqrt(3)=', newton_sqrt(3), ' ', 'sqrt(3)=', sqrt(3), "\n\n";
print 'newton_sqrt(4)=', newton_sqrt(4), ' ', 'sqrt(4)=', sqrt(4), "\n\n";



