function Get-grcNetTotals {
    $RequestParameters = @{
        method = "getnettotals"
    }

    $results = (Invoke-grcRPCRequest -RequestParameters $RequestParameters -OutVariable ID).result
    $results | Add-Member -MemberType NoteProperty -Name RequestId -Value $ID.Id
    $results
}