
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Automatic asset serving via sha1-based URLs",
  "AUTHOR" => "Henry Van Styn <vanstyn\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Catalyst" => 0,
    "Catalyst::Test" => 0,
    "FindBin" => 0,
    "Test::More" => 0,
    "parent" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Catalyst-Controller-AutoAssets",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Catalyst::Controller::AutoAssets",
  "PREREQ_PM" => {
    "CSS::Scopifier" => "0.02",
    "Catalyst::Controller" => 0,
    "Catalyst::Utils" => 0,
    "CatalystX::InjectComponent" => 0,
    "Cwd" => 0,
    "Data::Dumper::Concise" => 0,
    "Digest::SHA1" => 0,
    "Fcntl" => 0,
    "File::stat" => 0,
    "MIME::Types" => 0,
    "Module::Runtime" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Path::Class" => "0.32",
    "Storable" => 0,
    "Time::HiRes" => 0,
    "Try::Tiny" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.25",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



