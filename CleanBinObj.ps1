# PowerShell script to recursively delete bin and obj folders with progress

# Get the starting directory (current directory)
$startDirectory = Get-Location

# Find all bin and obj folders recursively
$directories = Get-ChildItem -Path $startDirectory -Recurse -Directory -Include bin, obj


# Count the total number of folders to delete
$totalDirectories = $directories.Count
$currentCount = 0

# Delete each folder found and display progress
foreach ($dir in $directories) {
    Remove-Item -Path $dir.FullName -Recurse -Force
    $currentCount++
    Write-Host "[$currentCount/$totalDirectories] Deleted folder: $($dir.FullName)"
}

Write-Host "Cleanup complete! $totalDirectories folders deleted."
