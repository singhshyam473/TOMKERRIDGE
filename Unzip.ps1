param(
[string]$src, [string]$dest
)
$src = "C:\Users\User\Desktop\Release-Files\Amp\AMP1.1\TOMKERRIDGE\Jobs\"
$dest = "C:\Users\User\Desktop\Release-Files\Amp\AMP1.1\TOMKERRIDGE\Jobs\"

Add-Type -AssemblyName System.IO.Compression.FileSystem

$zps = Get-ChildItem $src -Filter *.zip



foreach ($zp IN $zps)
{
    $new  = $dest+$zp.BaseName
    if (Test-Path $new) { Remove-Item $new -Recurse; }

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zp.FullName, $new)
}
