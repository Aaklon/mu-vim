# =============================================================================
#                          POWERSHELL PROFILE (PS1)
# =============================================================================
# This profile configures PowerShell 7+ on Windows native hosts to act as the
# shell equivalent of .zshrc in Unix environments.
#
# Path: $PROFILE (usually $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
# =============================================================================

# --- 1. Shell Command Aliases ---
# Map vim and vi to Neovim. Crucial helper for muscle-memory!
Set-Alias -Name vim -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name vi -Value nvim -ErrorAction SilentlyContinue
Set-Alias -Name v -Value nvim -ErrorAction SilentlyContinue

# Common directory listing aliases
function Get-DetailedChildItem {
    Get-ChildItem -Force | Format-Table Mode, Name, LastWriteTime, @{Name="Size(KB)"; Expression={[math]::round($_.Length / 1KB, 2)}}
}
Set-Alias -Name ll -Value Get-DetailedChildItem -ErrorAction SilentlyContinue
Set-Alias -Name la -Value Get-ChildItem -ErrorAction SilentlyContinue

# --- 2. Prompt Initialization (Starship) ---
# Check if starship is installed and initialize it.
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# --- 3. Command Line Autocomplete & Predictions (PSReadLine) ---
# PSReadLine provides syntax highlighting, history autosuggestions,
# and autocomplete matching inside the PowerShell console terminal.
if (Get-Module -ListAvailable PSReadLine) {
    # Set history matching prediction source (like zsh-autosuggestions)
    Set-PSReadLineOption -PredictionSource History
    
    # Optional: Display predictions as a vertical list (press F2 to cycle views)
    Set-PSReadLineOption -PredictionViewStyle InlineView
    
    # Configure Tab completion to cycle through options like standard bash/zsh
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

# --- 4. Environment Variables ---
# Set Neovim as the default text editor
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"
