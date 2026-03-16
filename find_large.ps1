Get-ChildItem -Path C:\ -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Length -gt 50MB } |
    Select-Object -First 20 FullName,
        @{Name='SizeMB';Expression={[math]::Round($_.Length/1MB,2)}} |
    Sort-Object SizeMB -Descending |
    Format-Table -AutoSize