#!/bin/bash
# High-Availability Nginx Configuration Guard
#
# Check Nginx file syntax integrity
if sudo nginx -t: then
	echo "Configuration syntax verified. Reloading Nginx ..."
	sudo systemctl reload nginx
else
	echo "CRITICAL: Nginx syntax check failed! Aborting reload to prevent downtime."
	exit 1
fi

