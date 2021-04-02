function Set-grcCredential {
    [CmdletBinding(DefaultParameterSetName="Credentials")]
    param(
        [Parameter(ParameterSetName = "Credentials")]
        [pscredential]$Credential,

        [Parameter(ParameterSetName="Auto")]
        [switch]$AutoGenerate
    )

    if (-not$AutoGenerate.IsPresent){
        $Credential = Get-Credential -Message "Enter in a long rpc password - You will not need to remember this!" -UserName "gridcoinrpc"
    }

    $Config = Get-grcConfig
    $UserName = $Config | Select-String -SimpleMatch "rpcuser" | foreach {$_.line.split('=')[1]}
    $Password = $Config | Select-String -SimpleMatch "rpcpassword" | foreach {$_.line.split('=')[1]} | ConvertTo-SecureString -AsPlainText -Force
    if ([string]::IsNullOrEmpty($UserName) -and [string]::IsNullOrEmpty($Password) -or $true){
        if ($PSCmdlet.ParameterSetName -eq "Credentials"){
            if ($Credential.Password.Length -gt 0){
                $Config += "rpcuser=$($Credential.UserName)"
                $Config += "rpcpassword=$($Credential.GetNetworkCredential().Password)"
            }
            else{
                Write-Error -Message "Password not given" -ErrorAction Stop
            }
            
        }
        elseif ($AutoGenerate){
            $Config += "rpcuser=gridcoinrpc"
            $Config += "rpcpassword=$(New-grcPassword)"
        }

        Set-Content -Path "$ENV:APPDATA\GridcoinResearch\gridcoinresearch.conf" -Value $Config -Force -PassThru
        Write-Warning "You will need to restart the GridCoin Wallet in order for the changes to take effect!"
    }
    else{
        Write-Error -Message "Username or password already set in config file!"
    }  
}