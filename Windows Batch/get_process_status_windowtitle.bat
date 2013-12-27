@echo off

cmd /c

tasklist /FI "WINDOWTITLE eq %1*" /FI "STATUS eq running" /FO CSV /NH > C:/xampp/mslogs/status/%1_status.txt

exit