use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'POE::Component::CSS::Minifier',
    license             => 'perl',
    dist_author         => q|Zoffix <'zoffix@cpan.org'>|,
    dist_version_from   => 'lib/POE/Component/CSS/Minifier.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'POE'                                      => 0.9999,
        'POE::Component::NonBlockingWrapper::Base' => 0.002,
        'CSS::Minifier'                            => 0.01,
        'LWP::UserAgent'                           => 2.036,
    },
    add_to_cleanup      => [ 'POE-Component-CSS-Minifier-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
