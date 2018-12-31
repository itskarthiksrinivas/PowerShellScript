Write-Host "I help you find location of IP Address" -ForegroundColor green -BackgroundColor black
Write-Host "Select any option" -ForegroundColor green -BackgroundColor black
Write-Host "1. Get Location of your machine" -ForegroundColor cyan -BackgroundColor black
Write-Host "2. Get Location by providing IP" -ForegroundColor cyan -BackgroundColor black
$value=Read-Host -Prompt "Enter your option here " 

Switch($value) {

1
{

$ps=Invoke-RestMethod http://ipinfo.io/json
Write-Host "Your Public IP is "$ps.ip -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your City is "$ps.city -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your latitude and longitude is "$ps.loc -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your Country is "$ps.country -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your Provider is "$ps.org -ForegroundColor Magenta -BackgroundColor black ;

Break
}

2
{
$Flag =1
While($flag)
{
$IP = Read-Host -Prompt "Enter your IP address"
$URI="http://ip-api.com/json/$IP"
$info=Invoke-RestMethod -uri $URI -Method Get 
Write-Host "Your Country is "$info.country -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your Region is "$info.region -ForegroundColor Magenta -BackgroundColor black
Write-Host "Your Provider is "$info.org -ForegroundColor Magenta -BackgroundColor black 
Write-Host "Your Timezone is "$info.timezone -ForegroundColor Magenta -BackgroundColor black 

$repeat=Read-Host -Prompt "Do you want to try another IP (y/n)"

if($repeat -match 'n')
{
$flag=0
Break
}

}

}

}