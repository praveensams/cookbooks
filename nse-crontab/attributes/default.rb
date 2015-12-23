## Cron entry fro db backup script
##default['cron']['db']['test']['even']['dbbackup']='0 2 * * * /AZVOL/backups/backup.sh >> /var/log/cronbackup.log 2>&1'
default['cron']['db']['dev']['even']['dbbackup']='0 2 * * * /AZVOL/backups/devevendbbackup.sh >> /var/log/cronbackup.log 2>&1'
default['cron']['db']['test']['even']['dbbackup']='0 2 * * * /AZVOL/backups/testevendbbackup.sh >> /var/log/cronbackup.log 2>&1'