function Invoke-grcRPCRequest{
    [cmdletbinding()]
    param(
        $RequestParameters
    )
    try{
        $Global:RequestId++
        $RequestParameters["id"] = $Global:RequestId
        $Json = $RequestParameters | ConvertTo-Json
        $grcCredential = Get-grcCredential -ErrorAction Stop
        
        $RequestParameters = @{
            URI = "http://127.0.0.1:15715/"
            Method = "Post"
            ContentType = "application/json"
            Credential = $grcCredential
            Body = $Json
        }

        Invoke-RestMethod @RequestParameters
    }
    catch{
        if ($_.Exception.Message -like "*Unable to connect to the remote server*"){
            Write-Warning "Make sure to add server=1 and rpcallowip=127.0.0.1 to config file"
        }
        $PSCmdlet.WriteError($_)
    }
}