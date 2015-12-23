@ls=`ls`;

foreach(@ls)
	{
		if( -f $_ )
			{
				print $_ ;
			}
	}
