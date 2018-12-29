//$ps=Get-AzureRmVM `
    -ResourceGroupName "AzureWAN" `
    -Name "VM1" `
    -Status | Select {$_.Statuses[1].Code -Match "PowerState/running"}



    while(1) {

    $ps=Get-AzureRmVM `
    -ResourceGroupName "AzureWAN" `
    -Name "VM1" `
    -Status |Select {$_.Statuses[1].Code -Match "PowerState/running"}
    if($ps -match "True")
        {
write-host("VM is Turned On! OOPS let me turn it OFF for you")
		
Stop-AzureRmVM `
   -ResourceGroupName "AzureWAN" `
   -Name "VM1" -Force 
		}
 else {
        write-host("VM is Turned OFF already")
       }

		
}