function Check-Diskfreespace {

    process{
        $diskfreespace = (Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Measure-Object -Property 'FreeSpace (GB)' -Sum).Sum
        return $diskfreespace
    }
}

Check-Diskfreespace