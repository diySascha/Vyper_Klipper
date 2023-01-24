#!/bin/bash
cd ~/printer_data
file_date=(`date +%Y-%m-%d_%H-%M`)
log_date=(`date +%Y-%m-%d_%H:%M:%S`)
echo $log_date
echo "-------------------------------------------------" >> /home/pi/printer_data/config/Backuplogs/log_ready.log
echo $log_date >> /home/pi/printer_data/config/Backuplogs/log_ready.log
echo "-------------------------------------------------" >> /home/pi/printer_data/config/Backuplogs/log_fail.log
echo $log_date >> /home/pi/printer_data/config/Backuplogs/log_fail.log
sleep 0.1s ; mkdir -p /home/pi/shares/klipper/Backup/$file_date
sleep 0.1s ;  zip -r /home/pi/shares/klipper/Backup/$file_date/vyper_klipper_$file_date.zip config/ database/ logs/ 1>> /home/pi/printer_data/config/Backuplogs/log_ready.log 2>> /home/pi/printer_data/config/Backuplogs/log_fail.log
# sleep 2s ; rsync -av --progress /home/pi/printer_data/config/ ~/shares/klipper/Backup/$file_date --exclude .git --exclude *.bkp --exclude mainsail.cfg 1>> /home/pi/printer_data/config/Backuplogs/log_ready.log 2>> /home/pi/printer_data/config/Backuplogs/log_fail.log
sleep 0.1s ; echo "$(tail -65 /home/pi/printer_data/config/Backuplogs/log_ready.log)" > /home/pi/printer_data/config/Backuplogs/log_ready.log
sleep 0.1s ; echo "$(tail -65 /home/pi/printer_data/config/Backuplogs/log_fail.log)" > /home/pi/printer_data/config/Backuplogs/log_fail.log
