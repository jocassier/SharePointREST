function New-SPRConnection {
    [CmdletBinding()]
    param (
        # Uri to connect to
        [Parameter(Mandatory, Position = 0)]
        [string]
        $Uri,

        # Credentials to use to connect
        [Parameter(Position = 1)]
        [pscredential]
        $Credential
    )

    $headers = @{
        'accept' = 'application/json;odata=nometadata'
    }
    
    Invoke-RestMethod -Uri $Uri -Headers $headers -Credential $Credential
}

$cred = Get-Credential 

New-SPRConnection -Uri 'https://zdtwc.sharepoint.com/sites/testsite1/_api/web' -Credential $cred -Verbose