function Get-grcBestBlockHash{
    $RequestParameters = @{
        method = "getbestblockhash"
    }
    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}