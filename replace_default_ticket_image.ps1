$old = 'https://starti.ge/img/default-ticket.png'
$new = 'https://image-tether-tool.lovable.app/__l5e/assets-v1/ca2999c3-63aa-4d60-b020-a1f8aff6dd85/backgroundIMG.webp'
Get-ChildItem -Path . -Recurse -Include *.ts,*.tsx,*.js,*.jsx,*.json,*.md | ForEach-Object {
    $file = $_.FullName
    $text = Get-Content -Path $file -Raw -Encoding UTF8
    if ($text.Contains($old)) {
        $text = $text.Replace($old, $new)
        Set-Content -Path $file -Value $text -Encoding UTF8
        Write-Output $file
    }
}
