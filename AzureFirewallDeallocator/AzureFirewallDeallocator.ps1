Connect-AzureRmAccount
$SubID = Read-Host -Prompt 'Enter your SubID'
Select-AzureRmSubscription -Subscriptionid $SubID
$WarningPreference = 'SilentlyContinue'
$AFs=Get-AzureRmFirewall 

foreach ($AF in $AFs) 
    { 
    $ps= Get-AzureRmFirewall `
    -ResourceGroupName $AF.ResourceGroupName `
    -Name $AF.Name
    echo $ps

    $AF.Deallocate() 
    Set-AzureRmFirewall -AzureFirewall $AF

    } 