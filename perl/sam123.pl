open(FILE,"sam.txt");

while($line=<FILE>)
	{
		if($line=~/var(?=\/ftp)/)
			{
				print "$line";
			}
	}
