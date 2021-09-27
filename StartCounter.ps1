$servers = 
    'server1',     #RK
    'server2',#RS
    'server3',  #RM
    'server4',  #MZ
    'server5',  #RT
    'server6',  #RO
    'server7', #NMZ
    'server8'    #TOF

$i = 1
write-host 'где запускаем counter?'
foreach ($server in $servers)
    {
        write-host  "[" $i "]", $server
        $i = $i + 1
    }

$ser = Read-Host
if     ( $ser -eq 1 ) { $result = 'askue'     }
elseif ( $ser -eq 2 ) { $result = 'ASKUE-SKAL'}
elseif ( $ser -eq 3 ) { $result = 'ASKUE-RM'  }
elseif ( $ser -eq 4 ) { $result = 'ASKUE-MZ'  }
elseif ( $ser -eq 5 ) { $result = 'ASKUE-RT'  }
elseif ( $ser -eq 6 ) { $result = 'ASKUE-RO'  }
elseif ( $ser -eq 7 ) { $result = 'TOFASUE'   }
$result

write-host 'Сколько минут собирать?'
[int]$time = Read-Host
[int]$waitSeconds = $time * 60 

Invoke-Command -ComputerName $result -ScriptBlock {logman start -n counter}

Start-Sleep -Seconds 1
$waitSeconds..0 | ForEach-Object {
    Write-Host "Time Remaining: $_" 
    Start-Sleep -Seconds 1}

Invoke-Command -ComputerName $result -ScriptBlock {logman stop -n counter}

$test = 100
$test..0 | ForEach-Object {
    Write-Host "Time Remaining: $_" 
    Start-Sleep -Seconds 1}
