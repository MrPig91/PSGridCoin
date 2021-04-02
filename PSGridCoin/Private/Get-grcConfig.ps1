function Get-grcConfig {
    try{
        $GridCoinConfigPath = "$ENV:APPDATA\GridcoinResearch\gridcoinresearch.conf"
        if (Test-Path -Path $GridCoinConfigPath){
            Get-Content $GridCoinConfigPath
        }
        else{
            Write-Error -Exception [System.IO.FileNotFoundException] -Message "Config file was not found in default location of $GridCoinConfigPath!"
        }
    }
    catch{
        $PSCmdlet.WriteError($_)
    } 
}