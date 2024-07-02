# Check if Node.js is installed
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js could not be found. Please install it from https://nodejs.org/"
    exit
}

# Define the path to the esbuild script
$esbuildScript = Join-Path -Path $PSScriptRoot -ChildPath "esbuild.js"

# Combine the arguments
$args = $args -join " "

# Execute the esbuild script with Node.js
& node $esbuildScript $args