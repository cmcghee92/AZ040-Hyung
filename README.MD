# AZ040 - GPO Backup and Restore Automation

# Phase1: Environment and compatibility set up

## RsatGPMC.ps1 
Confirms Group Policy Management Console is installed on the VM
GPMC is an optional feature under Remote Server Administration Tools (RSAT) for Windows 10/11
This script verifies that GPMC is installed

## NTFSPermissions.ps1
Disable inheritence, grant full control to local administrators and system

## Initialize-GPOStorageSnapshot.ps1
Structures the backup storage schema "C:\GPOBackups"

### Backup Storage Schema structure
C:\GPOBackups\
├── 2026-10-26_140000\
│   ├── Metadata
│   ├── RawGPOs
│   ├── Reports\
│   │   ├── HTML
│   │   └── XML
│   └── {GPO-GUID}\

# Phase2: Core Scripts
## Backup-GPOAutomated.ps1: backup engine
Collects inventory of GPOs - Backup-GPO extract domain policies
Generates Metadata & Manifest - Manifest.json matching GPO DN to the AD GUIDs, backup GUIDs, WMI filter bindings
Captures OU links - OULinks.json mapping all policy links 
Exports reports - Get-GPOReport to export .html and .xml files 
Calculates expiration date from the Retention window
Generates the backup log in C:\GPOBackups 

# Phase3: 