$sqlserver = "localhost"
[void][Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO")
$server = New-Object Microsoft.SqlServer.Management.Smo.Server $sqlserver
$server.Configuration.DefaultBackupCompression.ConfigValue = $true
$server.Configuration.Alter()