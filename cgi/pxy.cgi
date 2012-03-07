#!/usr/bin/perl -w

require LWP::UserAgent;

my $ua = LWP::UserAgent->new();
my $req = $ARGV[0];
my $base = "http://api.flickr.com/services/rest/?";

if ( $req !~ /d9a76ca10b3a34cf59a859843d495b63/ )
{
 print "Content-Type: text/plain\n\n";
 print "Invalid input: $req\n";
}
else
{
 #where does this other slash come from?
 $req =~ s/\\//g;
 my $resp = $ua->get($base.$req);

 print "Content-Type: ".$resp->header("Content-Type")."\n\n";
 print $resp->content;
}
