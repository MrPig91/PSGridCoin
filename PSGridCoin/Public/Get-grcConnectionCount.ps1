function Get-grcConnectionCount {
    $RequestParameters = @{
        method = "getconnectioncount"
    }

    $results = Invoke-grcRPCRequest -RequestParameters $RequestParameters
    if ($results.result -ne $null){
        [PSCustomObject]@{
            ConnectionCount = $results.result
            RequestId = $results.id
        }
    }
}