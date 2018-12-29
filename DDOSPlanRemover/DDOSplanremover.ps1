Connect-AzureRmAccount
$SubID = Read-Host -Prompt 'Enter your SubID'
Select-AzureRmSubscription -Subscriptionid $SubID
$WarningPreference = 'SilentlyContinue'
$rmvnets=Get-AzureRmVirtualNetwork 

foreach ($vnet in $rmvnets) 
    { 
    $WarningPreference = 'SilentlyContinue'
    $ps= Get-AzureRmVirtualNetwork `
    -ResourceGroupName $vnet.ResourceGroupName `
    -Name $vnet.Name    
if($ps.DdosProtectionPlan){
write-host $vnet.Name ("Vnet has DDOS enabled and Will list down the plan below. Please delete")
$ps.DdosProtectionPlan
$vnet.ResourceGroupName
$vnet.DdosProtectionPlan = $null
$vnet.EnableDdosProtection = $false
$vnet | Set-AzureRmVirtualNetwork -asjob
} 
       
 else {
        write-host $vnet.Name ("Vnet has no DDOS plan enabled!")
      }
          }
  
$plans= Get-AzureRmDdosProtectionPlan
foreach ($plan in $plans) 
    { 
    $WarningPreference = 'SilentlyContinue'
    $dos= Get-AzureRmDdosProtectionPlan `
    -ResourceGroupName $plan.ResourceGroupName `
    -Name $plan.Name 
    Remove-AzureRmDdosProtectionPlan -ResourceGroupName $dos.ResourceGroupName -Name $dos.Name
    }