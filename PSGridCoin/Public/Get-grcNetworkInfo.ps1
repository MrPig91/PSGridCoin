function Get-grcNetworkInfo {
    $RequestParameters = @{
        method = "getnetworkinfo"
    }

    $results = (Invoke-grcRPCRequest -RequestParameters $RequestParameters -OutVariable ID).result
    $results | Add-Member -MemberType NoteProperty -Name RequestId -Value $ID.Id
    $results
}