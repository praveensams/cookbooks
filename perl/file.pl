open(FILE,"number");
while($line=<FILE>)
	{
	if($line =~ /3/)
		{
		print $line."\n";
		}
	}
