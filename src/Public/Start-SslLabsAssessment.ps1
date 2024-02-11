function Start-SslLabsAssessment {
    [CmdletBinding(DefaultParameterSetName = 'FromCache')]
    param (
        [Parameter(Mandatory)]
        [Alias('Domain','ComputerName','Address')]
        [String]$Hostname,

        [Parameter()]
        [Switch]$Publish,

        [Parameter(ParameterSetName = 'StartNew')]
        [Switch]$StartNew,

        [Parameter(ParameterSetName = 'FromCache')]
        [Switch]$FromCache,

        [Parameter(ParameterSetName = 'FromCache')]
        [Int]$MaxAge,

        [Parameter()]
        [Switch]$IgnoreMismatch,

        [Parameter()]
        [Bool]$All = $true,

        [Parameter(Mandatory)]
        [String]$Email
    )

    # This type is loaded by default in 7.0 and above
    if (-not ("System.Web.HttpUtility" -as [Type])) {
        Add-Type -AssemblyName "System.Web" -ErrorAction "Stop"
    }

    $QueryString = [System.Web.HttpUtility]::ParseQueryString('')

    $QueryString.Add('host', $Hostname)

    if ($PSBoundParameters.ContainsKey("Publish")) {
        $QueryString.Add('publish', 'on')
    }

    if ($PSBoundParameters.ContainsKey("StartNew")) {
        $QueryString.Add('startNew', 'on')
    }

    if ($PSBoundParameters.ContainsKey("FromCache")) {
        $QueryString.Add('fromCache', 'on')
    }

    if ($PSBoundParameters.ContainsKey("MaxAge")) {
        $QueryString.Add('maxAge', $MaxAge)
    }

    if ($PSBoundParameters.ContainsKey("IgnoreMismatch")) {
        $QueryString.Add('ignoreMismatch', 'on')
    }

    if ($All -eq $false) {
        $QueryString.Add('all', 'done')
    }
    else {
        $QueryString.Add('all', 'on')
    }

    try {
        $Params = @{
            Endpoint    = 'analyze'
            Method      = 'GET'
            Query       = $QueryString
            Headers     = @{ 'email' = if ($PSBoundParameters.ContainsKey("Email")) { $Email } else { $Script:__SslLabsEmail } }
            ErrorAction = 'Stop'
        }

        InvokeSslLabsRestMethod @Params
    }
    catch {
        Write-Error -ErrorRecord $_
    }
}