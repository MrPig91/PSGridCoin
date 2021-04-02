function Get-grcBlockByNumber {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [int]$Number,
        [switch]$IncludeTxInfo
    )
    
    $RequestParameters = @{
        method = "getblockbynumber"
        params = [array]@($Number, $IncludeTxInfo.IsPresent)
    }
    (Invoke-grcRPCRequest -RequestParameters $RequestParameters).result
}