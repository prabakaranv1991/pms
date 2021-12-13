cp /home/db_backup/backup_cron /etc/cron.d/backup_cron
chmod 0644 /etc/cron.d/backup_cron
crontab /etc/cron.d/backup_cron