function New-SPRConnection {
    [CmdletBinding()]
    param (
        # Uri to connect to
        [Parameter(Mandatory, Position = 0)]
        [uri]
        $Uri,

        [Parameter(Mandatory, Position = 1)]
        [string]
        $OData,

        # Credentials to use to connect
        [Parameter(Position = 2)]
        [pscredential]
        $Credential,

        # Credentials to use to connect
        [Parameter()]
        [switch]
        $UseDefaultCredentials
    )

    $headers = @{
        'accept' = 'application/json;odata=nometadata'
        'X-FORMS_BASED_AUTH_ACCEPTED' = 'f'
    }

    $PSBoundParameters['Uri'] = Join-Uri -Uri $Uri -RelativePath '/_api/contextinfo'
    $O_Data = $OData
    $null = $PSBoundParameters.Remove('OData')
    
    $connection = Invoke-RestMethod @PSBoundParameters -Headers $headers -Method POST -SessionVariable 'webSession'

    Add-Member -InputObject $connection -MemberType NoteProperty -Name 'WebSession' -Value $webSession
    $webSession.Headers['accept'] = $webSession.Headers['accept'].Replace('nometadata',$O_Data)

    Set-Variable -Name 'SPRConnection' -Description 'SPRConnection object' -Option ReadOnly -Value $connection -Scope Script -Force
}