Connect-AzureRmAccount
$SubID = Read-Host -Prompt 'Enter your SubID'
Select-AzureRmSubscription -Subscriptionid $SubID
$a=Get-AzureRmLoadBalancer
Write-host "Number of Lb in your subscription is " $a.count -ForegroundColor Cyan -BackgroundColor Black 

foreach($b in $a) {

$lb=get-azurermloadbalancer -ResourceGroupName $b.ResourceGroupName -Name $b.Name 
$lb
$rules=Get-AzureRmLoadBalancerRuleConfig -LoadBalancer $lb 
$natrules=Get-AzureRmLoadBalancerInboundNatRuleConfig -LoadBalancer $lb
$total= $rules.count + $natrules.count 
Write-host "Number of rules in " $lb.Name "is "$total -ForegroundColor Cyan -BackgroundColor Black

}