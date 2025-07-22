param (
    [string]$DomainName,
    [string]$SafeModePassword
)

Install-WindowsFeature -Name AD-Domain-Services

Import-Module ADDSDeployment

Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword (ConvertTo-SecureString $SafeModePassword -AsPlainText -Force) `
    -DomainNetbiosName ($DomainName.Split('.')[0]) `
    -Force `
    -InstallDns
