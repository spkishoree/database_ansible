Import-Module "sqlps" -DisableNameChecking

Invoke-Sqlcmd -ServerInstance localhost -InputFile "C:\Windows\Temp\MemorySettings.sql" | Out-File -FilePath "C:\Windows\Temp\output.txt"
