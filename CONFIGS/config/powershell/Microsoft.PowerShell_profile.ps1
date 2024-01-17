
function prompt {
# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
$PROMPT_ALTERNATIVE='twoline'
$NEWLINE_BEFORE_PROMPT='yes'
# STOP KALI CONFIG VARIABLES

  $esc = [char]27
  $bell = [char]7
  $bold = "$esc[1m"
  $reset = "$esc[0m"
  If ($NEWLINE_BEFORE_PROMPT -eq 'yes') { Write-Host }
  If ($PROMPT_ALTERNATIVE -eq 'twoline') {
    Write-Host "┌──(" -NoNewLine -ForegroundColor Blue
    Write-Host "${bold}$([environment]::username)㉿$([system.environment]::MachineName)${reset}" -NoNewLine -ForegroundColor Magenta
    Write-Host ")-[" -NoNewLine -ForegroundColor Blue
    Write-Host "${bold}$(Get-Location)${reset}" -NoNewLine -ForegroundColor White
    Write-Host "]" -ForegroundColor Blue
    Write-Host "└─" -NoNewLine -ForegroundColor Blue
    Write-Host "${bold}PS>${reset}" -NoNewLine -ForegroundColor Blue
  } Else {
    Write-Host "${bold}PS " -NoNewLine -ForegroundColor Blue
    Write-Host "$([environment]::username)@$([system.environment]::MachineName) " -NoNewLine -ForegroundColor Magenta
    Write-Host "$(Get-Location)>${reset}" -NoNewLine -ForegroundColor Blue
  }
  # Terminal title
  Write-Host "${esc}]0;PS> $([environment]::username)@$([system.environment]::MachineName): $(Get-Location)${bell}" -NoNewLine
  return " "
}
