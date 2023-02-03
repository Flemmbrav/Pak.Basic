#!/bin/bash

set -e

echo 'Compiler for Pak.Basic'
echo '------------------------------------------------------'

compile() {
    echo '------------------------------------------------------'
    echo -e "Compiling $2...\n"

    local index=1
    local size=($3)
    local size=${#size[@]}

    for dat in $3; do
        # get directory where the dat file is located
        local dir=$(dirname "$dat")

	./makeobj pak$1 ./compiled/ "./$dat" &> /dev/null
	if [[ $? != 0 ]]; then
		echo "Error: Makeobj returned an error for $dat. Aborting..."
		rm "$csv.in"
		exit $?
	fi

        local index=$(( $index + 1 ))
    done
}

echo -n 'Checking for makeobj... '

if [ ! -f 'makeobj' ]; then
    echo 'ERROR: makeobj not found in root folder.'
    exit 1
fi

echo -e 'OK\n'

# Create folder for *.paks or delete all old paks if folder already exists
if [ ! -d 'compiled' ]; then
    mkdir compiled
fi


compile '192' 'Buildings' 'buildings/*.dat'
compile '192' 'Industry' 'industry/*.dat'
compile '192' 'Infrastructure' 'infrastructure/*.dat'

compile '192' 'Landscape' 'landscape/ground/*.dat'
compile '192' 'Landscape' 'landscape/ground_objects/*.dat'
compile '192' 'Landscape' 'landscape/tree/*.dat'
compile '48' 'Landscape' 'landscape/pedestrians/*.dat'

echo -e 'Moving Trunk (configs, sound, text)\n\n'
cp -r pakset/trunk/* compiled

compile '32' 'User Interface' 'UI/32/*.dat'
compile '64' 'User Interface' 'UI/64/*.dat'
compile '128' 'User Interface' 'UI/128/*.dat'
compile '192' 'User Interface' 'UI/192/*.dat'

compile '192' 'Vehicles' 'vehicles/*.dat'

echo '========================================================'
echo 'Pakset Complete!'
echo '========================================================'
