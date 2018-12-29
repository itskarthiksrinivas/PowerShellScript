SubID = Read-Host -Prompt 'Enter your SubID'
Select-AzureRmSubscription -Subscriptionid $SubID
$rmvms=Get-AzurermVM 

foreach ($vm in $rmvms) 
    {     

    
    $ps=Get-AzureRmVM `
    -ResourceGroupName $vm.ResourceGroupName `
    -Name $vm.Name `
    -Status |Select {$_.Statuses[1].Code -Match "PowerState/running"}
    if($ps -match "True")
        {
write-host $vm.Name ("is Turned On! OOPS let me turn it OFF for you")
		
Stop-AzureRmVM `
   -ResourceGroupName $vm.ResourceGroupName `
   -Name $vm.Name -Force 
		}
 else {
        write-host $vm.Name ("is Turned OFF already")
       }
       }