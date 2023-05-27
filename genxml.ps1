Write-Output @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ResourceList>
    <Name>MinecraftDivergeResources</Name>
    <Attribution>
        Some of the music in Minecraft Diverge's resources repository
        are owned by other people such as C418 and Lena Raine.
        Most of the sound effects are from freesound.org.
        The audio used is (hopefully) under fair use.

        I am not a lawyer and I do not know how this stuff works:
        I am just some random guy on the internet making a mod for fun.
    </Attribution>
"@

Get-ChildItem -Recurse -Include *.ogg,*.mus -File | ForEach-Object { Write-Output @"
    <Contents>
        <Key>$((Resolve-Path $_ -Relative).Substring(2).Replace("\", "/"))</Key>
        <Size>$($_.Length)</Size>
    </Contents>
"@ }

Write-Output @"
</ResourceList>
"@
