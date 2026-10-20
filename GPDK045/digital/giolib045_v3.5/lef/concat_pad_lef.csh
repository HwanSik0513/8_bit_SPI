#!/usr/bin/csh -f
#
# Functionality: Concatnate macro LEF files into a single file: giolib045.lef
#
set libLEFfile = giolib045.lef
if (-f ./$libLEFfile ) \rm -f  ./$libLEFfile
#
echo 'VERSION 5.7 ;'       >> ./$libLEFfile
echo 'BUSBITCHARS "[]" ;'  >> ./$libLEFfile
echo 'DIVIDERCHAR "/" ;'   >> ./$libLEFfile
echo " "                   >> ./$libLEFfile
echo "UNITS"                   >> ./$libLEFfile
echo "    DATABASE MICRONS 2000  ;"     >> ./$libLEFfile
echo "END UNITS"                        >> ./$libLEFfile
echo " "                                >> ./$libLEFfile
echo " MANUFACTURINGGRID    0.005000 ;" >> ./$libLEFfile
echo " "                                >> ./$libLEFfile
echo "SITE pad"                         >> ./$libLEFfile
echo "    SYMMETRY x y r90 ;"           >> ./$libLEFfile
echo "    CLASS pad ;"                  >> ./$libLEFfile
echo "    SIZE 1.000 BY 240.000 ;"      >> ./$libLEFfile
echo "END pad"                          >> ./$libLEFfile
echo " "                                >> ./$libLEFfile
echo "SITE corner"                      >> ./$libLEFfile
echo "    SYMMETRY x y r90 ;"           >> ./$libLEFfile
echo "    CLASS pad ;"                  >> ./$libLEFfile
echo "    SIZE 240.000 BY 240.000 ;"    >> ./$libLEFfile
echo "END corner"                       >> ./$libLEFfile
echo ""                                 >> ./$libLEFfile
echo "PROPERTYDEFINITIONS"              >> ./$libLEFfile
echo "  MACRO oaTaper STRING ;"         >> ./$libLEFfile
echo "END PROPERTYDEFINITIONS"          >> ./$libLEFfile
#
foreach cellLEFfile (`ls ./PAD*.lef; ls ./pad*.lef`)
        more ./$cellLEFfile | sed -e /VERSION/d -e/BUSBITCHARS/d  -e/DIVIDERCHAR/d -e/LIBRARY/d >> ./$libLEFfile
end
echo 'END LIBRARY' >> ./$libLEFfile
#
