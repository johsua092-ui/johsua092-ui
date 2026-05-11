# Script buat bikin lu jadi dewa semua bahasa pemrograman (Linguist Spoofing)
Write-Host "Mulai ritual menguasai semua bahasa pemrograman..." -ForegroundColor Green

# Daftar bahasa dari yang paling gampang sampe yang bikin botak
$languages = @{
    "Brainfuck" = "bf"
    "Assembly" = "asm"
    "Rust" = "rs"
    "C++" = "cpp"
    "C" = "c"
    "Go" = "go"
    "TypeScript" = "ts"
    "Python" = "py"
    "HTML" = "html"
    "JavaScript" = "js"
}

# Bikin folder khusus biar ga menuhin luar
$folderName = "fake_skills"
if (-not (Test-Path $folderName)) {
    New-Item -ItemType Directory -Path $folderName | Out-Null
}

# Bikin file untuk setiap bahasa dengan ukuran yang beda-beda biar grafiknya estetik
$i = 1
foreach ($lang in $languages.Keys) {
    $ext = $languages[$lang]
    $fileName = "$folderName/core_system.$ext"
    
    # Isi file dengan komentar sampah (1000 - 5000 baris) biar bytes-nya keitung gede sama GitHub
    $lines = Get-Random -Minimum 500 -Maximum 3000
    $content = ""
    for ($j = 0; $j -lt $lines; $j++) {
        $content += "// Auto-generated highly optimized $lang core protocol system node $j`n"
    }
    
    Set-Content -Path $fileName -Value $content
    Write-Host "=> Berhasil menguasai $lang!"
    $i++
}

# Paksa GitHub Linguist buat ngebaca folder ini sebagai kode beneran (bukan vendor/docs)
# Dan mastiin ekstensinya dibaca persis kayak bahasanya
$gitattr = "fake_skills/* linguist-detectable=true`n"
foreach ($lang in $languages.Keys) {
    $ext = $languages[$lang]
    $gitattr += "*.${ext} linguist-language=$lang`n"
}
Set-Content -Path .gitattributes -Value $gitattr

# Commit & Push
Write-Host "Sedang mengunggah skill baru ke GitHub..." -ForegroundColor Cyan
git add fake_skills/ .gitattributes
git commit -m "feat: master all programming languages"
git push origin main

Write-Host "SELESAI! Profil lu sekarang dewa banget." -ForegroundColor Green
