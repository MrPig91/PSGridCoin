function Get-grcBanned {
    $RequestParameters = @{
        method = "listbanned"
    }

    $results = (Invoke-grcRPCRequest -RequestParameters $RequestParameters -OutVariable result).results
    if ($results -ne $Null){
        $results
    }
    else{
        Write-Warning "No banned ips or subnets found"
    }
    
}