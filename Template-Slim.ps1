# Variables
$Outfile = "./eks/Dockerfile"
$Base = "debian:buster-slim"
$Packages = @{
    "aws-cli" = @{version = "1.2.3"; date = "1984"}
    "terraform" = @{version = "0.12.24"}
}

# Generate Dockerfile
./Generate-Dockerfile.ps1 -Outfile $Outfile -Base $Base -Packages $Packages