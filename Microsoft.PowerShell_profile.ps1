oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\avit.omp.json" | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

Set-PSReadLineKeyHandler -Chord Alt+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Alt+k -Function HistorySearchBackward

Set-PSReadLineKeyHandler -Chord Alt+l -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Alt+h -Function BackwardDeleteWord