Import-Module "sqlps" -DisableNameChecking

Invoke-Sqlcmd -ServerInstance localhost -InputFile "C:\Windows\Temp\adhocworkload.sql" | Out-File -FilePath "C:\Windows\Temp\output.txt"
