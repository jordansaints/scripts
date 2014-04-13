@echo off
::
:: Determine if a Windows process is currently running.
:: This batch function consumes a process-name, checks the tasklist
:: for that process, and writes the result of the tasklist command
:: to the file at C:/OUTPUT_DIRECTORY/process-name_status.txt.
::
:: The output file's contents can then be parsed for the original given process-name.
:: If the process-name IS found in the output file's contents, then the process is currently running, yay!
:: If the process-name is NOT found in the output file, the process is not running. :(
::
:: EXAMPLE USAGE: you can use this script to check the status of a server application in realtime.
:: First, trigger this script with an Ajax request, then parse the file at the known output
:: location to determine whether or not a given process is currently running.
::
:: by Jordan Saints, www.jordansaints.com
::

cmd /c

tasklist /FI "IMAGENAME eq %1*" /FI "STATUS eq running" /FO CSV /NH > C:/OUTPUT_DIRECTORY/%1_status.txt

exit