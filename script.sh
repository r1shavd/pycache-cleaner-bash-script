# The script to clean all the pycache files (.pyc) that are created during the execution of the miscaellenous python scripts around your computer system.
#
# Author : Rishav Das (https://github.com/rdofficial)
# Created on : April 27, 2021
#

# First checking wheter the directory location is given in the arguments or not
if [[ -z "${1}" ]]; then
	# If the user did not give the directory location in the arguments, then we manually ask the user to enter the directory location where to clean the cache

	echo -e ""
	read -p "Enter the directory location (where to clean the pycache files) : " directoryLocation
else
	# If the user did give the directory location in the arguments, then we continue using it

	directoryLocation=$1
fi

# Displaying the required warning messages to the user
echo -e "\nWARNING : The entire folder tree will be scanned and then the filtered python cache files will be deleted. So, safely execute it and double think before doing it.\n"
read -p "Press enter key to start the process, and CTRL+C to quit here..."

# Finding out all the python cache files in the user specified directory and then deleting them
echo -e "\nSTARTING TO DELETE THE PYTHON-CACHE FILES..."
for file in $( find ${directoryLocation} | grep __pycache__ ); do
	# Iterating through each file / folder search results

	# Checking if the location given is a file or folder
	if [[ -f $file ]]; then
		# If the currently iterated location is of a file, then we continue to delete it

		rm -rf $file
		echo -e "[!] Deleted file : ${file}"
	else
		# If the currently iterated location is not of a file (i.e., it is of a folder), then we skip the current iteration

		continue
	fi
done
