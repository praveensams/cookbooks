#! C:\Perl64\bin\perl

@s=`ls`;

open(FILE,">",error);

exit if(! "$ARGV[0]" );

if($ARGV[0] ne "list")
{
while($_=pop(@s))
	{
		if($_=~/$ARGV[0]/)
			{
			system("notepad $_");
			$no_file=1;
			}
	}


		if($no_file!=1)
			{
			system('notify-send  -i important "Attention!" "No file with the name exit in the present folder"');
			exit;
		}
	}

if($ARGV[0]=~/li/)
	{

			print "\n\n";
			print "##################################################################################################################\n\n";
	@se=`ls -l`;
	foreach(@se)
		{
		if($_=~/^-/)
			{
			@list=split(" ",$_);
			print "$list[@list-1]     ";
			}
		}
			print "\n\n";
			print "##################################################################################################################\n\n";
	}
			
