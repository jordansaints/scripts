@echo off

cmd /c

tasklist /FI "IMAGENAME eq %1*" /FI "STATUS eq running" /FO CSV /NH > C:/xampp/mslogs/squad_status/%1_status.txt

exit