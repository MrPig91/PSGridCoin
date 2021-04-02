function Get-grcPolls{
    param(
        [switch]$IncludeFinishedPolls
    )
    $RequestParameters = @{
        method = "listpolls"
        params = [array]@($IncludeFinishedPolls.IsPresent)
    }

    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}