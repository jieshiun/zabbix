param(
     [Parameter()]
     [string]$backupPath
 )

#$backupPath = 'E:\Autobackup\'
$backupPath = $backupPath.Trim("'")

$date = (get-date).AddDays(-1).ToString("yyyMMdd")
$dbs = 'Sys','01','02','03'
$status = '0','0','0','0'

for ($index = 0; $index -lt $dbs.count; $index++)
{
    $fileName = "CHI" + $date + "." + $dbs[$index]
    $sourceFile = $backupPath + $fileName
    #Write-Host $sourceFile

    #If the file is exist, backup success
    if ((Test-Path -Path $sourceFile -PathType Leaf)) {
        $status[$index] = 1
    }
}

[ordered]@{sys=$status[0];company1=$status[1];company2=$status[2];company3=$status[3]} | ConvertTo-Json -Compress