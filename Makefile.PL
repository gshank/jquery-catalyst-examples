use inc::Module::Install;

name 'jQuery';
all_from 'lib/jQuery.pm';

requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::View::JSON';

requires 'Config::Any::Perl';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
