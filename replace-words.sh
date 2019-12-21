#!/bin/bash

declare -A re # re = replacement

# Comments are spelled as written here
re[BSI]=BSÍ
re[Bildufell]=Bíldufell
re[Bjorgil]=Bjórgil
#re[Botnar]=
re[Brennivinskvisl]=Brennivínskvísl
re[Eldgja]=Eldgjá
#re[Entujökull]=
re[Frennri-Emstrua]=Fremri-Emstruá # Spelling mistake whould also be translated
re[Fremri-Emstrua]=Fremri-Emstruá
#re[Gigjökull]=
re[Hallgrimskirkja]=Hallgrímskirkja
re[Holmsa]=Hólmsá
re[Holmsarlon]=Hólmsárlón
re[Innri-Emstrua]=Innri-Emstruá
re[Keflavik]=Keflavík
re[Kerlingarhnukur]=Kerlingarhnúkur
re[Krossa]=Krossá
#re[Landmannalaugar]=
re[Langisjor]=Langisjór
#re[Laugavegur]=
re[Maelifell]=Mælifell
re[Maelifellsandur]=Mælifellsandur
re[Markarfljöt]=Markarfljót
re[Ofaerufoss]=Ofaerusofoss # TODO
re[Sydri-Ofaera]=Sydri-Ofaera # TODO
re[Skaelingar]=Skaelingar # TODO
re[Reykjavik]=Reykjavík
#re[Sandar]=
#re[Seljalandsfoss]=
re[Slettjökull]=Sléttjökull
re[Strutsskali]=Strútsskáli
re[Strutur]=Strútur
re[Thorsmörk]=Þórsmörk
re[Utivist]=Utivist # TODO

for i in $(find ./content -type f -iname '*.md')
do
	echo "File: $i"

	for c in "${!re[@]}"
	do
		if grep -w -q "$c" "$i"
		then
			echo "    Replace: $c -> ${re[$c]}"
			sed -i 's/'"$c"'\b/'"${re[$c]}"'/g' "$i";
		fi
	done
done
