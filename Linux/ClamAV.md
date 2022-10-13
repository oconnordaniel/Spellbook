<package manager> clamav

su root
cd /etc/clamav
clamconf -g freshclam.conf > freshclam.conf
clamconf -g clamd.conf > clamd.conf
clamconf -g clamav-milter.conf > clamav-milter.conf
edit conf and remove Example

sudo freshclam #to update signature
sudo clamscan -r -i / > /var/log/clamav-output-$(date '+%Y-%m-%d').log

crontab

daily freshclam 
daily after that clamscan 

