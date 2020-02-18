Import-Module "sqlps" -DisableNameChecking

$db=@{}


$dbs=Invoke-Sqlcmd -ServerInstance localhost -Query "select name,state_desc from sys.databases where state_desc not in ('online', 'restoring')" | Out-String

#write-host $dbs 
return $dbs
