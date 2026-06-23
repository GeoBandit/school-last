$old = 'https://image-tether-tool.lovable.app/__l5e/assets-v1/ca2999c3-63aa-4d60-b020-a1f8aff6dd85/backgroundIMG.webp'
$new = 'https://image-tether-tool.lovable.app/__l5e/assets-v1/b475d439-b61e-41ea-abd8-96349e36b73e/backgroundIMG.png'
Get-ChildItem -Path . -Recurse -Include *.ts,*.tsx,*.js,*.jsx,*.json,*.md | ForEach-Object {
  $path = $_.FullName
  $content = Get-Content -Raw -Path $path
  if ($content.Contains($old)) {
    $updated = $content.Replace($old, $new)
    Set-Content -Path $path -Value $updated -Encoding UTF8
    Write-Host "UPDATED: $path"
  }
}
$matches = Get-ChildItem -Path . -Recurse -Include *.ts,*.tsx,*.js,*.jsx,*.json,*.md | Select-String -Pattern [regex]::Escape($old) | Measure-Object
Write-Host "Matches after: $($matches.Count)"
