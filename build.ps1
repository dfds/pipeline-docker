
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
  [parameter(Mandatory=$True,ValueFromPipeline=$true)] 
  [string]$ToolboxName = "toolbox",

  [parameter(Mandatory=$True,ValueFromPipeline=$true)] 
  [string]$ToolboxVersion = "v1"
)

#if (-not($PSBoundParameters.ContainsKey("MyParam"))) {
#   Write-Output "Value from pipeline"
#}

#--------[Script]---------------

docker build -t "$($ToolboxName):$($ToolboxVersion)" toolbox/


#docker build -t "$basetag$tag-slim" -f "slim/Dockerfile" --build-arg APP_IMAGE="$image" --build-arg TOOLBOX_IMAGE="$TOOLBOX_IMAGE"