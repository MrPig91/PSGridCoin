function Get-grcCheckPoint {
    $RequestParameters = @{
        method = "getcheckpoint"
    }

    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}