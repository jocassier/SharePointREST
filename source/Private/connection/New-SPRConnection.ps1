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
        'X-FORMS_BASED_AUTH_ACCEPTED' = 'f'
    }
    
    $connection = Invoke-RestMethod -Uri "$Uri/_api/contextinfo" -Headers $headers -Credential $Credential -Method POST -SessionVariable 'webSession'
    Add-Member -InputObject $connection -MemberType NoteProperty -Name 'WebSession' -Value $webSession
    New-Variable -Name 'SPRConnection' -Description 'SPRConnection object' -Option Constant -Value $connection -Scope Script
}

$cred = Get-Credential 

New-SPRConnection -Uri 'https://portal-se.dev.de' -Credential $cred -Verbose

$connection.FormDigestTimeoutSeconds = $null

$connection = Get-Variable SPRConnection -ValueOnly

$connection.WebFullUrl = $null