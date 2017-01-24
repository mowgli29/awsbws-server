#!/usr/bin/env perl
use Mojolicious::Lite;
use Mojo::JSON 'j';
use Mojo::File 'path';

post '/' => sub {
 my $c = shift;
 my $az = $c->param('az');
 my $it = $c->param('it');
 my $file = Mojo::File->new("/tmp/$az-$it");
 $file->spurt(j($c->req->json));
 $c->render(json=>{az=>$az});
};

 
get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Wolsdjhfdslkfhslkdfgslkgsjhdgkljh the Mojolicious real-time web framework!</h1>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
