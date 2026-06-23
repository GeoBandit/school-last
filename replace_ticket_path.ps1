$path = 'constants/getdata.ts'
$text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$old = 'https://image-tether-tool.lovable.app/tickets/b-b1/'
$new = 'https://image-tether-tool.lovable.app/tickets/img/'
$updated = $text.Replace($old, $new)
if ($text -ne $updated) {
  [System.IO.File]::WriteAllText($path, $updated, [System.Text.Encoding]::UTF8)
  Write-Host 'UPDATED: All ticket URLs replaced from b-b1 to img'
  $count = ([regex]::Matches($text, [regex]::Escape($old))).Count
  Write-Host "Replaced $count occurrences"
} else {
  Write-Host 'No changes made'
}
