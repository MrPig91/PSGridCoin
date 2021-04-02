function Get-grcPollResults {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [string]$PollName,
        [bool]$ShowExpired
    )

    $RequestParameters = @{
        method = "getpollresults"
        params = [array]@($PollName)
    }

    Write-Warning "This will take a few moments and your GUI wallet will become unresponsive if open"
    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
    #Write-Warning "Function not implemented"
}