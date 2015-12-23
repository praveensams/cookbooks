#! C:\Perl64\bin



$| = 1;

if("$ARGV[1]")
	{
	if("$ARGV[0]" =~ /start/i)
		{
			system("VBoxManage startvm $ARGV[1] --type headless");
		}
	if("$ARGV[0]" =~ /create/i)
		{
			system("vboxmanage clonevm $ARGV[1] --name $ARGV[2] --register --mode all");
		}
	if("$ARGV[0]" =~ /stop/i)
		{
			system("vboxmanage controlvm $ARGV[1] poweroff");
		}	
	}
else
	{
	if("$ARGV[0]" =~ /list/i)
		{
			@list=`VBoxManage list vms`;
			while($_=pop(@list))
				{
				@line=split(" ",$_);
				$line[0]=~s/\"//g;
				print $line[0]."\n";
				}
		}

	if("$ARGV[0]" =~ /run/i)
		{
			@list=`VBoxManage list runningvms`;
			while($_=pop(@list))
				{
				@line=split(" ",$_);
				$line[0]=~s/\"//g;
				print $line[0]."\n";
				}
		}
	if("$ARGV[0]" =~ /delete/i)
		{
			system("vboxmanage controlvm 'centos64' poweroff");
			system("vboxmanage unregistervm centos64 --delete");
		      
		}	       

 	 }
