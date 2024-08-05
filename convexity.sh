#!/bin/sh
gfortran LaplacianCone.f90 -o LaplacianCone.exe
./LaplacianCone.exe
python3 plot.py
rm heat_map_data.csv
rm LaplacianCone.exe
sleep 5
rm temperature.html
