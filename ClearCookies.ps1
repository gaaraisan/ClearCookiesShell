# Очищаємо cookies для системи (Windows)
$systemCookiesPath = "$env:APPDATA\Microsoft\Windows\Cookies"
if (Test-Path $systemCookiesPath) {
    Remove-Item $systemCookiesPath\* -Force -Recurse
    Write-Host "Системні cookies очищені!"
} else {
    Write-Host "Не знайдено системних cookies."
}

# Очищаємо cookies для браузера Google Chrome
$chromeCookiesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cookies"
if (Test-Path $chromeCookiesPath) {
    Remove-Item $chromeCookiesPath -Force
    Write-Host "Cookies для Google Chrome очищені!"
} else {
    Write-Host "Не знайдено cookies для Google Chrome."
}

# Очищаємо cookies для браузера Opera
$operaCookiesPath = "$env:APPDATA\Opera Software\Opera Stable\Cookies"
if (Test-Path $operaCookiesPath) {
    Remove-Item $operaCookiesPath -Force
    Write-Host "Cookies для Opera очищені!"
} else {
    Write-Host "Не знайдено cookies для Opera."
}

# Очищаємо cookies для браузера Mozilla Firefox
$firefoxProfilePath = "$env:APPDATA\Mozilla\Firefox\Profiles"
$firefoxProfile = Get-ChildItem -Path $firefoxProfilePath | Select-Object -First 1
if ($firefoxProfile) {
    $firefoxCookiesPath = "$firefoxProfile\cookies.sqlite"
    if (Test-Path $firefoxCookiesPath) {
        Remove-Item $firefoxCookiesPath -Force
        Write-Host "Cookies для Mozilla Firefox очищені!"
    } else {
        Write-Host "Не знайдено cookies для Mozilla Firefox."
    }
} else {
    Write-Host "Не знайдено профілю Firefox."
}
