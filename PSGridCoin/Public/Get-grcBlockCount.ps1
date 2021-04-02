function Get-grcBlockCount {

    $RequestParameters = @{
        method = "getblockcount"
    }

    if ((Invoke-grcRPCRequest -RequestParameters $RequestParameters -OutVariable results).result -ne $Null){
        [PSCustomObject]@{
            BlockCount = $results.result
            RequestId = $results.id
        }
    }
}