function Connect-SPROnline {
    [CmdletBinding()]
    param (
        # Uri to connect to
        [Parameter(Mandatory, Position = 0)]
        [uri]
        $Uri,

        [Parameter(Position = 1)]
        [ValidateSet('nometadata','minimalmetadata','verbose')]
        [string]
        $OData = 'nometadata',

        # Credentials to use to connect
        [Parameter(Position = 2)]
        [pscredential]
        $Credential,

        # Credentials to use to connect
        [Parameter()]
        [switch]
        $UseDefaultCredentials
    )

    New-SPRConnection @PSBoundParameters
}