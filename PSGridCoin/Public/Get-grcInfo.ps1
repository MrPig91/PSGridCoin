function Get-grcInfo {

    $RequestParameters = @{
        method = "getinfo"
    }

    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}