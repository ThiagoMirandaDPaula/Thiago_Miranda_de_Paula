cls
echo ""
Wirte-Output "################################################## Developed by : Thiago Miranda de Paula ##################################################"

mkdir "C:\Logs" -ErrorAction SilentlyContinue | Out-Null
ls -Name "C:\Users" > C:\Logs\Log_Users.log -ErrorAction SilentlyContinue

New-Alias grep findstr

function cut {
  param(
    [Parameter(ValueFromPipeline=$True)] [string]$inputobject,
    [string]$delimiter='\s+',
    [string[]]$field
  )
  process {
    if ($field -eq $null) { $inputobject -split $delimiter } else {
      ($inputobject -split $delimiter)[$field] }
  }
}

$Users = Get-Content "C:\Logs\Log_Users.log"
foreach ($Line01 in $Users)
{
# Write-Output "User => $Line01"
ls -Name "C:\Users\$Line01\AppData\Local\Google\Chrome\User Data\Default\Extensions" > C:\Logs\Log_Extensions.log -ErrorAction SilentlyContinue | Out-Null

    $Extensions = Get-Content "C:\Logs\Log_Extensions.log"
    write-Output "##################################################################################################################"
    write-Output "User > $Line01"
    echo ""
    foreach ($Line02 in $Extensions)
    {
    echo ""
    Write-Output "Extension ID > $Line02"
    $Name = Get-Content "C:\Users\$Line01\AppData\Local\Google\Chrome\User Data\Default\Extensions\$Line02\*\manifest.json" -ErrorAction SilentlyContinue | grep -I -N name # | cut -f 2 -d _
    Write-Output "Extension Name        > $Name"
    $Email = Get-Content "C:\Users\$Line01\AppData\Local\Google\Chrome\User Data\Default\Extensions\$Line02\*\manifest.json" -ErrorAction SilentlyContinue | grep -I -N email # | cut -f 3 -d '"'
    Write-Output "Extension E-mail      > $Email"
    $Permissions = Get-Content "C:\Users\$Line01\AppData\Local\Google\Chrome\User Data\Default\Extensions\$Line02\*\manifest.json" -ErrorAction SilentlyContinue | grep -I -N permissions # | cut -f 2 -d [
    Write-Output "Extension Permissions > $Permissions"
    echo ""
    }

    write-Output "##################################################################################################################"
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
}

pause
