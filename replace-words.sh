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
re[Holmsarbotnar]=Hólmsárbotnar
re[Holmsarlon]=Hólmsárlón
re[Innri-Emstrua]=Innri-Emstruá
re[Keflavik]=Keflavík
re[Kerlingarhnukur]=Kerlingarhnúkur
re[Krossa]=Krossá
#re[Landmannalaugar]=
re[Langisjor]=Langisjór
#re[Laugavegur]=
re[Ljosa]=Ljósá
re[Maelifell]=Mælifell
re[Maelifellsandur]=Mælifellsandur
re[Markarfljöt]=Markarfljót
re[Ofaerufoss]=Ófærufoss
re[Sydri-Ofaera]=Syðri–Ófæra
re[Skaelingar]=Skælingar
re[Reykjavik]=Reykjavík
#re[Sandar]=
#re[Seljalandsfoss]=
re[Skafta]=Skaftá
re[Slettjökull]=Sléttjökull
re[Strutslaug]=Strútslaug
re[Strutsskali]=Strútsskáli
re[Strutur]=Strútur
re[Svartahnuksfjöll]=Svartahnúksfjöll
#re[Sveinstindur]=
re[Thorsmörk]=Þórsmörk
re[Thor]=Þór
re[Utivist]=Útivist

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
