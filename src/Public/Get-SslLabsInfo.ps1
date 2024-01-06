function Get-SslLabsInfo {
    [CmdletBinding()]
    param (
    )

    try {
        $Params = @{
            Endpoint    = 'info'
            Method      = 'GET'
            ErrorAction = 'Stop'
        }
        
        InvokeSslLabsRestMethod @Params | Select-Object -ExpandProperty Content | ConvertFrom-Json
    }
    catch {
        Write-Error -ErrorRecord $_
    }
}