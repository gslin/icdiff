#
# Regular cron jobs for the icdiff package
#
0 4	* * *	root	[ -x /usr/bin/icdiff_maintenance ] && /usr/bin/icdiff_maintenance
