@echo off
::
:: Determine if a Windows application GUI window is currently running.
:: This batch function consumes a window-title, checks the tasklist for
:: processes with running GUI windows, then compares the title of the GUI windows
:: with the given window-title. This script writes the result of the tasklist
:: command to the file at C:/OUTPUT_DIRECTORY/window-title_status.txt.
::
:: The output file's contents can then be parsed for the original given window-title.
:: If the window-title IS found in the output file's contents, then that GUI window is currently running, yay!
:: If the window-title is NOT found in the output file, the GUI window is not running. :(
::
:: EXAMPLE USAGE: you can use this script to check the status of a server's application windows in realtime.
:: First, trigger this script with an Ajax request, then parse the file at the known output
:: location to determine whether or not a GUI window having the given window-title is currently running.
::
:: by Jordan Saints, www.jordansaints.com
::

cmd /c

tasklist /FI "WINDOWTITLE eq %1*" /FI "STATUS eq running" /FO CSV /NH > C:/OUTPUT_DIRECTORY/%1_status.txt

exit