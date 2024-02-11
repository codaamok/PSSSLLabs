class SslLabsHost {
    [String]$Host
    [Int]$Port
    [String]$Protocol
    [String]$IsPublic
    [String]$Status
    [datetime]$StartTime
    [datetime]$TestTime
    [Version]$EngineVersion
    [String]$CriteriaVersion
    [SslLabsEndpoint[]]$Endpoints
    [SslLabsCert[]]$Certs
}

class SslLabsEndpoint {
    [IPAddress]$IpAddress
    [String]$StatusMessage
    [String]$StatusDetails
    [String]$StatusDetailsMessage
    [String]$Grade
    [String]$GradeTrustIgnored
    [Bool]$HasWarnings
    [Bool]$IsExceptional
    [Int]$Progress
    [timespan]$Duration
    [Int]$Eta
    [Int]$Delegation
    [SslLabsEndpointDetails[]]$Details
}

class SslLabsEndpointDetails {
    [datetime]$HostStartTime
    [SslLabsCertificateChain[]]$CertChains
    [SslLabsProtocol[]]$Protocols
    [SslLabsProtocolSuites[]]$Suites
    [SslLabsProtocolSuites[]]$NoSniSuites
    [SslLabsNamedGroups]$NamedGroups
    [String]$ServerSignature
    [Bool]$PrefixDelegation
    [Bool]$NonPrefixDelegation
    [Bool]$VulnBeast
    [Int]$RenegSupport
    [Int]$SessionResumption
    [Int]$CompressionMethods
    [Bool]$SupportsNpn
    [String]$NpnProtocols
    [Bool]$SupportsAlpn
    [String]$AlpnProtocols
    [Int]$SessionTickets
    [Bool]$OcspStapling
    [Int]$StaplingRevocationStatus
    [String]$StaplingRevocationErrorMessage
    [Bool]$SniRequired
    [System.Net.HttpStatusCode]$HttpStatusCode
    [Object]$HttpForwarding # Not sure what data type this needs to be
    [Bool]$SupportsRc4
    [Bool]$Rc4WithModern
    [Bool]$Rc4Only
    [Int]$ForwardSecrecy
    [Bool]$SupportsAead
    [Bool]$SupportsCBC
    [Int]$ProtocolIntolerance
    [Int]$MiscIntolerance
    [SslLabsSimulationResults[]]$Sims
    [Bool]$Heartbleed
    [Bool]$Heartbeat
    [Int]$OpenSslCcs
    [Int]$OpenSSLLuckyMinus20
    [Int]$Ticketbleed
    [Int]$Bleichenbacher
    [Int]$ZombiePoodle
    [Int]$GoldenDoodle
    [Int]$ZeroLengthPaddingOracle
    [Int]$SleepingPoodle
    [Bool]$Poodle
    [Int]$PoodleTls
    [Bool]$FallbackScsv
    [Bool]$Freak
    [Int]$HasSct
    [String[]]$DhPrimes
    [Int]$DhUsesKnownPrimes
    [Bool]$DhYsReuse
    [Bool]$EcdhParameterReuse
    [Bool]$Logjam
    [Bool]$ChaCha20Preference
    [SslLabsHstsPolicy]$HstsPolicy
    [SslLabsHstsPreload[]]$HstsPreloads
    [SslLabsHpkpPolicy]$HpkpPolicy
    [SslLabsHpkpPolicy]$HpkpRoPolicy
    [SslLabsStaticPkpPolicy]$StaticPkpPolicy
    [SslLabsHttpTransaction[]]$HttpTransactions
    [SslLabsDrownHost[]]$DrownHosts
    [Bool]$DrownErrors
    [Bool]$DrownVulnerable
    [Bool]$ImplementsTLS13MandatoryCS
    [Int]$ZeroRttEnabled
}

class SslLabsCertificateChain {
    [String[]]$Id
    [String[]]$CertIds
    [SslLabsTrustPath[]]$TrustPaths
    [Int]$Issues
    [Bool]$NoSni
}

class SslLabsTrustPath {
    [String[]]$CertIds
    [SslLabsTrust[]]$Trust
    [Bool]$IsPinned
    [Int]$MatchedPins
    [Int]$UnmatchedPins
}

class SslLabsTrust {
    [String]$RootStore
    [Bool]$IsTrusted
    [String]$TrustErrorMessage
}

class SslLabsProtocol {
    [Int]$Id
    [String]$Name
    [System.Version]$Version
    [Bool]$V2SuitesDisabled
    [String]$q # String instead of int becausee '' or $null is 0 when cast to int
}

class SslLabsProtocolSuites {
    [Int]$Protocol
    [SslLabsProtocolSuite[]]$List
    [Bool]$Preference
    [Bool]$ChaCha20Preference
}

class SslLabsProtocolSuite {
    [Int]$Id
    [String]$Name
    [Int]$CipherStrength
    [String]$KxType
    [Int]$KxStrength
    [Object]$DhP  # Not sure what data type this needs to be
    [Object]$DhG  # Not sure what data type this needs to be
    [Object]$DhYs # Not sure what data type this needs to be
    [Int]$NamedGroupBits
    [Int]$NamedGroupId
    [String]$NamedGroupName
    [Int]$Q
}

class SslLabsNamedGroups {
    [SslLabsNamedGroup[]]$List
    [Bool]$Preference
}

class SslLabsNamedGroup {
    [Int]$Id
    [String]$Name
    [Int]$Bits
    [String]$NamedGroupType
}

class SslLabsSimulationResults {
    [SslLabsSimulation[]]$Results
}

class SslLabsSimulation {
    [SslLabsSimulationClient]$Client
    [Int]$ErrorCode
    [String]$ErrorMessage
    [Int]$Attempts
    [String]$CertChainId
    [Int]$ProtocolId
    [Int]$SuiteId
    [String]$SuiteName
    [String]$KxType
    [Int]$KxStrength
    [Int]$DhBits
    [String]$DhP
    [String]$DhG
    [String]$DhYs
    [Int]$NamedGroupBits
    [Int]$NamedGroupId
    [String]$NamedGroupName
    [String]$KeyAlg
    [Int]$KeySize
    [String]$SigAlg
}

class SslLabsSimulationClient {
    [Int]$Id
    [String]$Name
    [String]$Platform
    [String]$Version
    [Bool]$IsReference
}

class SslLabsHstsPolicy {
    [Int]$LONG_MAX_AGE
    [String]$Header
    [String]$Status
    [String]$Error
    [Int]$MaxAge
    [Bool]$IncludeSubDomains
    [Bool]$Preload
    [PSCustomObject]$Directives
}

class SslLabsHstsPreload {
    [String]$Source
    [String]$Hostname
    [String]$Status
    [String]$Error
    [datetime]$SourceTime
}

class SslLabsHpkpPolicy {
    [String]$Header
    [String]$Status
    [String]$Error
    [Int]$MaxAge
    [Bool]$IncludeSubDomains
    [String]$ReportUri
    [Object[]]$Pins # Not sure what data type this needs to be
    [Object[]]$MatchedPins # Not sure what data type this needs to be
    [Object[]]$Directives # Not sure what data type this needs to be
}

class SslLabsStaticPkpPolicy {
    [String]$Status
    [String]$Error
    [bool]$IncludeSubDomains
    [String]$ReportUri
    [Object[]]$Pins # Not sure what data type this needs to be
    [Object[]]$MatchedPins # Not sure what data type this needs to be
    [Object[]]$ForbiddenPins # Not sure what data type this needs to be
    [Object[]]$MatchedForbiddenPins # Not sure what data type this needs to be
}

class SslLabsHttpTransaction {
    [String]$RequestUrl
    [System.Net.HttpStatusCode]$StatusCode
    [String]$RequestLine
    [Object[]]$RequestHeaders # Not sure what data type this needs to be
    [String]$ResponseLine
    [Object[]]$ResponseHeadersRaw # Not sure what data type this needs to be
    [Object[]]$ResponseHeaders # Not sure what data type this needs to be
    [Bool]$FragileServer
}

class SslLabsDrownHost {
    [IPAddress]$Ip
    [Bool]$Export
    [Int]$Port
    [Bool]$Special
    [Bool]$SslV2
    [String]$Status
}

class SslLabsCert {
    [String]$Id
    [String]$Subject
    [String]$SerialNumber
    [String[]]$CommonNames
    [String[]]$AltNames
    [datetime]$NotBefore
    [datetime]$NotAfter
    [String]$IssuerSubject
    [String]$SigAlg
    [Int]$RevocationInfo
    [String[]]$CrlURIs
    [String[]]$OcspURIs
    [Int]$RevocationStatus
    [Int]$CrlRevocationStatus
    [Int]$OcspRevocationStatus
    [Bool]$DnsCaa
    [SslLabsCaaPolicy]$CaaPolicy
    [Bool]$MustStaple
    [Int]$Sgc
    [String]$ValidationType
    [Int]$Issues
    [Bool]$Sct
    [String]$Sha1Hash
    [String]$Sha256Hash
    [String]$PinSha256
    [String]$KeyAlg
    [Int]$KeySize
    [Int]$KeyStrength
    [Bool]$KeyKnownDebianInsecure
    [String]$Raw
}

class SslLabsCaaPolicy {
    [String]$PolicyHostname
    [SslLabsCaaRecord[]]$CaaRecords
}

class SslLabsCaaRecord {
    [String]$Tag
    [String]$Value
    [String]$Critical
    [Int]$Flags
}