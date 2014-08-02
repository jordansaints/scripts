# Extra functions for the bash shell
# by Jordan Saints, www.jordansaints.com

## networking
# List the networking-related commands and their aliases

function networking(){
  echo "Available Networking Commands:"
  echo " ||--------- DESCRIPTION ---------||-------- COMMAND --------||------ ALIAS ------||"
  echo " || Get external IP address:      || curl ifconfig.me/ip     || external-ip       ||"
  echo " || Get remote host:              || curl ifconfig.me/host   || remote-host       ||"
  echo " || All external connection info: || curl ifconfig.me/all    || all-external-info ||"
  echo " || Flush DNS cache:              || dscacheutil -flushcache || flush-dns         ||"
  echo " || Get LAN hostname of computer: || hostname                || hn                ||"
  echo " || Scan ports of server:         || netstat -tulanp         || ports             ||"
  echo " ||-------------------------------||-------------------------||-------------------||"
}


## cd
# Adds the ability to cd into Finder directory aliases from the Terminal.
# based on http://hints.macworld.com/article.php?story=20050828054129701

function cd {
	if [ ${#1} == 0 ]; then
		builtin cd
	elif [[ -d "${1}" || -L "${1}" ]]; then		# If regular directory or a symlink
		builtin cd "${1}"
	elif [ -f "${1}" ]; then			# If file: is it an alias?
		# Redirect stderr to dev null to suppress OSA environment errors
		exec 6>&2 				# link file descriptor 6 with stderr so we can restore stderr later
		exec 2>/dev/null 			# stderr replaced by /dev/null
		path=$(osascript << EOF
tell application "Finder"
set theItem to (POSIX file "${1}") as alias
if the kind of theItem is "alias" then
get the posix path of ((original item of theItem) as text)
end if
end tell
EOF
)
		exec 2>&6 6>&-      			# restore stderr and close file descriptor #6

		if [ "$path" == '' ]; then 		# Probably not an alias, but regular file, let cd handle it
			builtin cd "${1}"
		else					# IS an alias, so use the returned path of the alias
			builtin cd "$path" && pwd
		fi
	else						# should never get here, but just in case
		builtin cd "${1}"
	fi
}


##

