function ConvertTo-SPRResult {
    [CmdletBinding()]
    param()
    
    process {

        if ($connection = Get-Variable -Name 'SPRConnection' -ValueOnly -Scope Script) {

            return $connection

        } else {

            throw("No connection found. Please connect first with 'Connect-SPROnline'")
        }   
    }
}