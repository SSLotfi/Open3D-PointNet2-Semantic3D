#!/bin/bash

ans=`dpkg-query  -W p7zip-full`
if [ -z "$ans" ]; then
	echo "Please, install p7zip-full by running: sudo apt-get install p7zip-full"
	exit -1
fi

for i in `cat /content/Open3D-PointNet2-Semantic3D/dataset/semantic_raw/semantic3D_files.csv` 
do
	output_file=`basename $i`
	echo Downloading ${output_file} ...
	wget $i
	7z x ${output_file} -y
done

mv station1_xyz_intensity_rgb.txt neugasse_station1_xyz_intensity_rgb.txt

exit 0
