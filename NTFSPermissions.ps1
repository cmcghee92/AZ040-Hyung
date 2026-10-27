#Disable inheritance and remove unprivileged user access
$Acl = Get-Acl -Path "C:\GPOBackups"
$Acl.SetAccessRuleProtection($true, $false)

#Grant full control to local Administrators group and SYSTEM account
$AdminRule = [System.Security.AccessControl.FileSystemAccessRule]::new(
    "BUILTIN\Administrators", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow"
    )
$SystemRule = [System.Security.AccessControl.FileSystemAccessRule]::new(
    "NT AUTHORITY\SYSTEM", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow"
    )

$Acl.AddAccessRule($AdminRule)
$Acl.AddAccessRule($SystemRule)
Set-Acl -Path "C:\GPOBackups" -AclObject $Acl

$Acl
