# Activate properties files#
copy all *.ext.dist files to *.ext files int he config/${os}/dev folders
'cd bin'
'ant build'

# Create and run a virtual machine #

## Requirements ##
Virtualbox => 4.1.x
Vagrant    => 1.0.3
Active internet connection, if not present a precise64 base box will be downloaded and installed.

## Start a Box ##
vagrant up
vagrant provision (only when vagrant up end with an error or when changes to the puppet files are made)
vagrant ssh