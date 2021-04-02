function Get-grcCredential {
    [CmdletBinding()]
    param()
    try{
        $Config = Get-grcConfig
        $UserName = $Config | Select-String -SimpleMatch "rpcuser" | foreach {$_.line.split('=')[1]}
        $Password = $Config | Select-String -SimpleMatch "rpcpassword" | foreach {$_.line.split('=')[1]} | ConvertTo-SecureString -AsPlainText -Force
        if ([string]::IsNullOrEmpty($UserName) -or [string]::IsNullOrEmpty($Password)){
            Write-Error -Message "Username or password not set in config file! Please add these to your config file to communicate with the RPC using Set-grcCredential"
        }
        else{
            [pscredential]::new($UserName,$Password)
        }
    }
    catch{
        $PSCmdlet.WriteError($_)
    }  
}