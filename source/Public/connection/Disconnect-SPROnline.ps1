function Disconnect-SPROnline {
    [CmdletBinding()]
    param()
    
    process {

        if (Get-Variable -Name 'SPRConnection' -Scope Script -ErrorAction SilentlyContinue) {

            Remove-Variable -Name 'SPRConnection' -Scope Script -Force

        } else {

            throw("No connection found. Please connect first with 'Connect-SPROnline'")
        }   
    }
}