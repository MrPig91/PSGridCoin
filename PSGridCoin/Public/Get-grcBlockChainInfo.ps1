function Get-grcBlockChainInfo {
    $RequestParameters = @{
        method = "getblockchaininfo"
    }
    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}