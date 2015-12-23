#! C:\Perl64\bin
$| = 1;


@s=`tasklist`;
if ( ! ($ARGV[0]))
		{
		chomp($reads=<STDIN>);
		}
	else
		{
		$reads=$ARGV[0];
		}
print $reads."\n";
for($i=0;$i<@s;$i++)
	{
	if($s[$i] =~ /$reads/i)
		{
			@processlist=split(" ",$s[$i]);
			system("TASKKILL /PID $processlist[1] /F");
			print "<$processlist[1]>";
		}
	}

