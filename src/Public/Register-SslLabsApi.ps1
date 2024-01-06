function Register-SslLabsApi {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$FirstName,

        [Parameter(Mandatory)]
        [String]$LastName,

        [Parameter(Mandatory)]
        [String]$Email,

        [Parameter(Mandatory)]
        [Alias('Organization')]
        [String]$Organisation
    )

    try {
        $Params = @{
            Endpoint    = 'register'
            Method      = 'POST'
            Body        = @{
                firstName    = $FirstName
                lastName     = $LastName
                email        = $Email
                organization = $Organisation
            }
            ErrorAction = 'Stop'
        }

        $null = InvokeSslLabsRestMethod @Params

        $Script:__SslLabsEmail = $Email
    }
    catch {
        Remove-Variable -Name '__SslLabsEmail' -Scope 'Script' -Force -ErrorAction 'SilentlyContinue'
        Write-Error -ErrorRecord $_
    }
}