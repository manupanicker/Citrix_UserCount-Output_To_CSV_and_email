while ($true){
$ht = @{}
$ht.Date = get-date -Format M/d/y
$ht.Time = get-date -Format hh:mm:ss
asnp citrix* -ErrorAction SilentlyContinue
$ht.Users = Get-XAFarm | select -ExpandProperty sessioncount
$table = New-Object -TypeName psobject -Property $ht | select date,time,users
#$table |format-table -autosize

$table | export-csv -Append -Path .\count.csv -NoTypeInformation
}
