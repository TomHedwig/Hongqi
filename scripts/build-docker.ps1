[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$ProjectRoot,
    [Parameter(Mandatory=$true)][string]$Document,
    [string]$Image = 'texlive/texlive',
    [switch]$DryRun
)
$ErrorActionPreference = 'Stop'
$rootPath = (Resolve-Path -LiteralPath $ProjectRoot).Path.TrimEnd('\','/')
if (-not $Document.EndsWith('.tex', [StringComparison]::OrdinalIgnoreCase)) {
    $Document += '.tex'
}
if (-not [IO.Path]::IsPathRooted($Document)) {
    $Document = Join-Path $rootPath $Document
}
$documentPath = (Resolve-Path -LiteralPath $Document).Path
$rootPrefix = $rootPath + [IO.Path]::DirectorySeparatorChar
if (-not $documentPath.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'The root document must be inside ProjectRoot.'
}
if ($rootPath.Contains(',')) { throw 'Docker --mount does not support commas in this project path.' }
$relativeDocument = $documentPath.Substring($rootPrefix.Length).Replace('\','/')
$separatorIndex = $relativeDocument.LastIndexOf('/')
$containerDirectory = '/data'
if ($separatorIndex -ge 0) {
    $containerDirectory += '/' + $relativeDocument.Substring(0, $separatorIndex)
}
$documentName = [IO.Path]::GetFileName($documentPath)
$dockerArguments = @(
    'run', '--rm',
    '--mount', "type=bind,source=$rootPath,target=/data",
    '-w', $containerDirectory,
    $Image, 'latexmk', '-xelatex', '-synctex=1',
    '-interaction=nonstopmode', '-file-line-error', '-halt-on-error',
    $documentName
)
Write-Host "Hongqi root document: $relativeDocument"
Write-Host "Docker working directory: $containerDirectory"
if ($DryRun) {
    $dockerArguments | ConvertTo-Json
    exit 0
}
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw 'Docker was not found. Install/start Docker Desktop and restart VS Code.'
}
& docker @dockerArguments
exit $LASTEXITCODE
