import "accounts/*"
import "apps/*"
import "files/*"
import "services/*"

#Create users.
include accounts::groups
realize(Group["puppet"])

include apt

#Make sure files are in place
include files::workspace

#Setup services
include services::ntpd
include services::sshd
include services::ufwd

#Install applications
include apps::baseApps
include apps::devApps