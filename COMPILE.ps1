#!/usr/bin/env powershell

echo 'Compiler for Pak.Basic'
echo '--------------------------------------------------------'

function compile($paksize, $msg, $glob) {
    echo '--------------------------------------------------------'
    echo "Compiling $msg..."

    $index=1
    $dats=Get-ChildItem $glob
    $size=($dats | Measure-Object).Count
    
    foreach ($dat in $dats) {

        # convert to linux style for compatibility between systems
        $relative=($dat | Resolve-Path -Relative).Substring(2).Replace('\', '/')

        ./makeobj.exe "pak$paksize" ./compiled/ "$relative" > $null 2> $null
                if ($LASTEXITCODE -gt 0) {
                    echo "Error: Makeobj returned an error for $relative. Aborting..."
                    exit $LASTEXITCODE
                }

        Write-Progress -Activity "Compiling $msg" -Status "$relative" -PercentComplete (100*$index/$size)
        $index++
    }
}

Write-Host -NoNewline 'Checking for makeobj... '

if (!(Test-Path makeobj.exe)) {
    echo 'ERROR: makeobj not found in root folder.'
    exit 2
}

echo 'OK'

# Create folder for *.paks or delete all old paks if folder already exists
if (!(Test-Path compiled)) {
    mkdir compiled > $null
    echo 'created "compiled" dir'
}


compile '192' 'Buildings' 'buildings/*.dat'
compile '192' 'Industry' 'industry/*.dat'
compile '192' 'Infrastructure' 'infrastructure/*.dat'

compile '192' 'Landscape' 'landscape/ground/*.dat'
compile '192' 'Landscape' 'landscape/ground_objects/*.dat'
compile '192' 'Landscape' 'landscape/tree/*.dat'
compile '48' 'Landscape' 'landscape/pedestrians/*.dat'

#echo '--------------------------------------------------------'
echo "Moving Trunk (configs, sound, text)`n"
Copy-Item trunk/* compiled -Recurse -Force

compile '32' 'User Interface' 'UI/32/*.dat'
compile '64' 'User Interface' 'UI/64/*.dat'
compile '128' 'User Interface' 'UI/128/*.dat'
compile '192' 'User Interface' 'UI/192/*.dat'

compile '192' 'Vehicles' 'vehicles/*.dat'

echo '========================================================'
echo 'Pakset Complete!'
echo '========================================================'
