function Join-Uri {
    
    param (
        # Parameter help description
        [Parameter(Mandatory, Position = 0)]
        [Uri]
        $Uri,

        # Parameter help description
        [Parameter(Position = 1)]
        [string]
        $RelativePath = [String]::Empty
    )
    
    return [uri] ($uri.AbsoluteUri.TrimEnd('/') + '/' + $RelativePath.TrimStart('/'))
}