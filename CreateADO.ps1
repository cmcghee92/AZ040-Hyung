#Create a new OU for a branch office
new-adorganizationalunit -Name London

#create a group for branch office administrators
new-adgroup -Name "London Admins" -GroupScope Global

#create a user and computer account for the branch office
new-aduser -name Ty -displayname "Ty Carlson"
add-adgroupmember -Identity "London Admins" -Members Ty
new-adcomputer LON-CL2

#move the group, user, and computer accounts to the branch office OU
Move-ADObject -Identity "CN=London Admins,CN=Users,DC=Adatum,DC=com" -TargetPath "OU=London,DC=Adatum,DC=com"
Move-ADObject -Identity "CN=Ty,CN=Users,DC=Adatum,DC=com" -TargetPath "OU=London,DC=Adatum,DC=com"
Move-ADObject -Identity "CN=LON-CL2,CN=Computers,DC=Adatum,DC=com" -TargetPath "OU=London,DC=Adatum,DC=com"

