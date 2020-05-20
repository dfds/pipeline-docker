
#Requires -Version 6
<#
.SYNOPSIS
  Builds images for Pipeline images
.DESCRIPTION
  <Brief description of script>
.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         Henrik Stanley Mortensen
  Creation Date:  15-05-2020
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>


#--------[Params]---------------
Param(
  [parameter(Mandatory = $True, ValueFromPipeline = $true)] 
  [string]$ToolboxName = "toolbox",

  [parameter(Mandatory = $True, ValueFromPipeline = $true)] 
  [string]$ToolboxVersion = "v1"
)

#if (-not($PSBoundParameters.ContainsKey("MyParam"))) {
#   Write-Output "Value from pipeline"
#}

#--------[Script]---------------



function Build-ToolboxImage {
  Param(
    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$ToolboxName = "toolbox",

    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$ToolboxVersion = "v1"
  )

  $ToolboxImage = "$($ToolboxName):$($ToolboxVersion)"
  docker build -t $ToolboxImage toolbox/
}


function Build-DistributionImages {
  Param(
    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$ToolboxName = "toolbox",

    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$ToolboxVersion = "v1",

    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$AppImage,

    [parameter(Mandatory = $false, ValueFromPipeline = $true)] 
    [string]$Distribution

  )

  begin {

    $BuildPaths = Get-ChildItem -Path $Distribution
    $ToolboxImage = "$($ToolboxName):$($ToolboxVersion)"
  }
  process {
    foreach ($BuildPath in $BuildPaths) {
      docker build -t "$($Distribution)-$($BuildPath.Name):" --build-arg APP_IMAGE="$AppImage" --build-arg TOOLBOX_IMAGE="$ToolboxImage" $BuildPath.FullName
    }
  }

  end {

  }
}