#!/usr/bin/perl
use warnings;
use strict;
use Daemon::Control;
#use local::lib '/usr/src/perl/libs/access_system/perl5/';
my $path = "/home/pi/AccessSystem";

exit Daemon::Control->new(
    name        => "AccessSystem CRUD",
    lsb_start   => '$syslog $remote_fs',
    lsb_stop    => '$syslog',
    lsb_sdesc   => 'AccessSystem CRUD',
    lsb_desc    => 'AccessSystem CRUD controls the AccessSystem CRUD daemon.',
    path        => "$path/script/accesssystem_daemon.pl",
    directory   => "$path",
#    init_config => "$path etc/environment",
    user        => 'castaway',
    group       => 'castaway',
    program     => "carton exec $path/script/accesssystem_server.pl",
 
    pid_file    => '/tmp/accesssystem_crud.pid',
    stderr_file => '/tmp/accesssystem_crud.out',
    stdout_file => '/tmp/accesssystem_crud.out',
 
    fork        => 2,
 
    )->run;