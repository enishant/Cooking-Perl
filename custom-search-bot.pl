#!/usr/bin/perl--
use CGI;
$query = new CGI;
use LWP::UserAgent;
$ua = LWP::UserAgent->new;
$ua->agent("CustomSearchBot");
$response = $ua->get( $query->param('url') );
if ($response->is_success) 
{
	use HTML::HeadParser;
	$head = HTML::HeadParser->new;
	$head->parse($response->decoded_content);
}
print "Content-type:text/html \n\n";
print 'Title : <br>' . $head->header('Title') . "\n\n<br><br>";
print 'Description : <br>' . $head->header('X-Meta-Description') . "\n\n<br><br>";
print 'Keywords : <br>' . $head->header('X-Meta-Keywords') . "\n\n<br><br>";