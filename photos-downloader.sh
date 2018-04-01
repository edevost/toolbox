# move  images from sd card to computer
# This script has to be executed from the root of the DCIM/ Directory
# on the card. File naming sheme : "yymmdd-hhmm-dir-file.ext"

# Get file number from filename, as it is not present in the image metadata

# Use Exiftool at the command line to change the image file names: 
exiftool '-filename<${CreateDate}-${filename;s/.*([0-9][0-9][0-9][0-9]).*/$1/}.%le' -d %y%m%d-%H%M -ext cr2 -r DCIM/
# Use Exiftool to change the system file modification date to match the image createdate:
exiftool '-filemodifydate<createdate' -ext cr2 -r DCIM/

#From this point forward, all Exiftool commands that write to the image file will
# require using the "-P" option at the beginning of the command, or else the system
# file modification date will change to the currect date and time.

# Use Exiftool to move the image files files to the appropriate album subfolders, creating new folders as needed: 
exiftool '-Directory<CreateDate' -d /mnt/photos/Raw/%y/%y%m -ext cr2 -r DCIM/

# We want to do the same for videos
######################################
# ====================================
# Video Section
# ====================================
######################################

# Use Exiftool at the command line to change the image file names:
exiftool '-filename<${CreateDate}-${filename;s/.*([0-9][0-9][0-9][0-9]).*/$1/}.%le' -d %y%m%d-%H%M -ext MOV -r DCIM/

# Use Exiftool to change the system file modification date to match the image createdate:
exiftool '-filemodifydate<createdate' -ext MOV -r DCIM/

#From this point forward, all Exiftool commands that write to the image file will
# require using the "-P" option at the beginning of the command, or else the system
# file modification date will change to the currect date and time.

# Use Exiftool to move the image files files to the appropriate album subfolders, creating new folders as needed: 
exiftool '-Directory<CreateDate' -d /mnt/videos/Raw/%y/%y%m -ext MOV -r DCIM/
