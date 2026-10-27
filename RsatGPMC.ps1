#Validate RSAT tools are installed
get-windowscapability -online -name "Rsat.grouppolicy.management.tools*"

#Import modules for PowerShell compatibility
Import-Module GroupPolicy -useWindowsPowerShell
import-Module ActiveDirectory -useWindowsPowerShell

#Set up a root backup directory for GPOs
$backupDir = "C:\GPOBackups"
