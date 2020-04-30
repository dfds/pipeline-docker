[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $OutFile,

    [Parameter(Mandatory)]
    [string]
    $Base,

    [Parameter()]
    [hashtable]
    $Packages
)

@"
# --------------------------------------------------
# Base
# --------------------------------------------------

FROM $Base
"@ | OUt-File $OutFile

ForEach ($Key in $Packages.Keys) {

    $PackageFile = "./.packages/$Key.Dockerfile"
    
    If (Test-Path $PackageFile -PathType Leaf) {
        $PackageSpec = $Packages[$Key]
        $Vars = $Package.Keys

        @"


# --------------------------------------------------
# $Key
# --------------------------------------------------

"@  | OUt-File $OutFile -Append

        Get-Content $PackageFile | Out-File $OutFile -Append
    }
    else {
        Throw "Package '$PackageFile' not found"
    }

}

Write-Host "$OutFile"