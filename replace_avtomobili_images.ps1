$script = @'
$path = 'constants/getdata.ts'
$text = Get-Content -Path $path -Raw -Encoding UTF8
$pattern = [regex] '(?s)gadjet:\s*"ავტომობილი".*?image:\s*"https://starti\.ge/uploads/tickets/ticketIMG-([0-9]+)\.webp"'
$replaced = 0

$newText = [regex]::Replace($text, $pattern, { param($m) $replaced++; return $m.Value -replace 'https://starti\.ge/uploads/tickets/ticketIMG-([0-9]+)\.webp', 'https://image-tether-tool.lovable.app/tickets/b-b1/$1' })

if ($newText -ne $text) {
    Set-Content -Path $path -Value $newText -Encoding UTF8
}
Write-Output "Replaced $replaced image(s) in avtomobili blocks."
'@

Invoke-Expression $script
