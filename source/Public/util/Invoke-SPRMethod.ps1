function Invoke-SPRMethod {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [String]
        $RelativePath,

         # Parameter help description
         [Parameter()]
         [ValidateSet('GET','POST','DELETE')]
         [String]
         $Method = 'GET',

         # Parameter help description
         [Parameter()]
         [System.Object]
         $Body
    )

    begin {

        $connection = Get-SPRConnection
    }
    
    process {

        $uri = Join-Uri -Uri $connection.WebFullUrl -RelativePath $RelativePath
        $null = $PSBoundParameters.Remove('RelativePath')

        Invoke-RestMethod @PSBoundParameters -Uri $uri -WebSession $connection.WebSession
    } 
}