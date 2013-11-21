@echo off

cmd /c

tasklist /FI "IMAGENAME eq %1*" /FO CSV /NH > C:/xampp/mslogs/status/%1_status.txt

exit