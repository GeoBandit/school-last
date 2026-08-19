$path = 'c:\Users\MaisuradzeT\Downloads\school-last\constants\getdata.ts'
$ids = @(1572,337,181,182,184,185,981,270,271,1085,1428,526,1079,827,828,842,956,1066,1068,1635,1650,1076)
$text = [System.IO.File]::ReadAllText($path)
foreach ($id in $ids) {
    $idx = $text.IndexOf("_id: $id")
    if ($idx -ge 0) {
        Write-Host "FOUND $id at $idx"
    }
    else {
        Write-Host "MISSING $id"
    }
}
