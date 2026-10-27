[CmdletBinding()]
    param(
        [Parameter()]
        [string]$RootPath = "C:\GPOBackups"
    )

    $Timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
    $SnapshotPath = Join-Path -Path $RootPath -ChildPath $Timestamp

    $Directories = @{
        Root = $SnapshotPath
        RawGPOs      = Join-Path -Path $SnapshotPath -ChildPath "RawGPOs"
        ReportsHtml  = Join-Path -Path $SnapshotPath -ChildPath "Reports\HTML"
        ReportsXml   = Join-Path -Path $SnapshotPath -ChildPath "Reports\XML"
        Metadata     = Join-Path -Path $SnapshotPath -ChildPath "Metadata"
    }

    foreach ($dir in $Directories.Values) {
        if (-not (Test-Path -Path $dir)) {
            $null = New-Item -ItemType Directory -Path $dir -Force
        }
    }

    return $Directories


# Verification execution
$Paths = Initialize-GPOStorageSnapshot
$Paths.GetEnumerator() | Select-Object Name, Value | Format-Table -AutoSize