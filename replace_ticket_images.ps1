$path = 'constants/getdata.ts'
$text = Get-Content -Path $path -Raw -Encoding UTF8
$pattern = ''
$newText = $text -replace $pattern, 'https://image-tether-tool.lovable.app/tickets/b-b1/$1'
$count = ([regex]::Matches($text, $pattern)).Count
if ($count -gt 0 -and $newText -ne $text) {
    Set-Content -Path $path -Value $newText -Encoding UTF8
}
Write-Output "Replaced $count image(s)."
