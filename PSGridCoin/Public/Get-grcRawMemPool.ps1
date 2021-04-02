function Get-grcRawMemPool {
    $RequestParameters = @{
        method = "getrawmempool"
    }

    $results = Invoke-grcRPCRequest -RequestParameters $RequestParameters
    [PSCustomObject]@{
        RawMemPool = $results.result
        RequestId = $results.id
    }
}