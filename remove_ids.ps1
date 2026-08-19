$ErrorActionPreference = 'Stop'
$path = 'c:\Users\MaisuradzeT\Downloads\school-last\constants\getdata.ts'
$ids = @(1572,337,181,182,184,185,981,270,271,1085,1428,526,1079,827,828,842,956,1066,1068,1635,1650,1076)
$idSet = [System.Collections.Generic.HashSet[int]]::new()
foreach ($id in $ids) { [void]$idSet.Add($id) }

if (-not (Test-Path $path)) {
    throw "File not found: $path"
}

$text = [System.IO.File]::ReadAllText($path)
$removed = 0
$searchStart = 0

while ($true) {
    $idx = $text.IndexOf('_id: ', $searchStart)
    if ($idx -lt 0) { break }

    $j = $idx + 6
    while ($j -lt $text.Length -and [char]::IsDigit($text[$j])) {
        $j++
    }

    if ($j -eq ($idx + 6)) {
        $searchStart = $idx + 1
        continue
    }

    $num = [int]::Parse($text.Substring($idx + 6, $j - ($idx + 6)))
    if (-not $idSet.Contains($num)) {
        $searchStart = $j
        continue
    }

    $start = $text.LastIndexOf('{', $idx)
    if ($start -lt 0) {
        throw "Could not find opening brace for _id $num"
    }

    $depth = 0
    $quote = $null
    $end = -1
    for ($pos = $start; $pos -lt $text.Length; $pos++) {
        $ch = $text[$pos]

        if ($null -ne $quote) {
            if ($ch -eq '\') {
                $pos++
                continue
            }
            if ($ch -eq $quote) {
                $quote = $null
            }
        }
        else {
            if ($ch -eq '"' -or $ch -eq "'") {
                $quote = $ch
            }
            elseif ($ch -eq '{') {
                $depth++
            }
            elseif ($ch -eq '}') {
                $depth--
                if ($depth -eq 0) {
                    $end = $pos + 1
                    break
                }
            }
        }
    }

    if ($end -lt 0) {
        throw "Could not find closing brace for _id $num"
    }

    $trimStart = $end
    while ($trimStart -lt $text.Length -and [char]::IsWhiteSpace($text[$trimStart])) {
        $trimStart++
    }
    if ($trimStart -lt $text.Length -and $text[$trimStart] -eq ',') {
        $trimStart++
    }

    $text = $text.Substring(0, $start) + $text.Substring($trimStart)
    $removed++
    $searchStart = $start
}

[System.IO.File]::WriteAllText($path, $text)
Write-Host "Removed $removed objects."
