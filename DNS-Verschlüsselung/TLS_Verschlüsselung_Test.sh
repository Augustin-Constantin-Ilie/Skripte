# To do
# Und dass wenn es nicht über TLS verschlüsselt ist dass der program sagt es ist nicht über tls
# sondern über udp oder tcp und möchten sie die logs sehn etc..
clear
# Titel
echo ""
echo "DNS TLS-Verschlüsselung Test"
echo ""

# Funktion
Main_Funktion(){
	# Fragen welche DNS-Server der user Testen verwendet (Für konsistente Auflösung)
	clear
	echo ""
	echo "Welche DNS-Server verwenden sie?"
	echo ""
	# Phase 1
	while true; do
		read -p "1)Cloudfare 2)Quad9 3)Google 4)OpenDNS 5)Andere : " DNS_Auswahl
		# Phase 2
		# Cloudfare DNS
		if [ "$DNS_Auswahl" == 1 ]; then
			clear
			kdig @1.1.1.1 example.com +tls -p 853
			output=$(kdig @1.1.1.1 example.com +tls -p 853)
			# Phase 3
			if echo "$output" | grep -q "(TLS)"; then
				clear
				echo ""
				echo "Die DNS-Auflösung ist über TLS verschlüsselt!"
				echo ""
				# Phase 4.1
				while true; do
					echo ""
					read -p "Möchten sie die volle log sehen? J/j oder N/n : " Auswahl
					echo ""
					# Phase 5.1
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear #Mit DNSSEC ausgabe
						kdig @1.1.1.1 example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			else
				clear
				echo ""
				echo "Die DNS-Auflösung scheint nicht Verschlüsselt zu sein!"
				echo ""
				# Phase 4.2
				while true; do
					echo ""
					read -p "Möchten sie die volle Log sehen? J/j oder N/n : " Auswahl
					echo ""
					# Phase 5.2
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @1.1.1.1 example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			fi
		break
		# Quad9 DNS
		elif [ "$DNS_Auswahl" == 2 ]; then
			clear
			kdig @dns.quad9.net example.com +tls -p 853
			output=$(kdig @dns.quad9.net example.com +tls -p 853)
			if echo "$output" | grep -q "TLS"; then
				clear
				echo ""
				echo "Die DNS-Auflösung ist über TLS verschlüsselt!"
				echo ""
				while true; do
					echo ""
					read -p "Möchten sie die volle Log sehen? J/j oder N/n : " Auswahl
					echo ""
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @dns.quad9.net example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			else
				clear
				echo ""
				echo "Die DNS-Auflösung scheint nicht Verschlüsselt zu sein!"
				echo ""
				while true; do
					echo ""
					read -p "Möchten sie die volle Log sehen? J/j oder N/n : " Auswahl
					echo ""
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @dns.quad9.net example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			fi
			break
		# Google DNS
		elif [ "$DNS_Auswahl" == 3 ]; then
			clear
			kdig @dns.google example.com +tls -p 853
			output=$(kdig @dns.google example.com +tls -p 853)
			if echo "$output" | grep -q "TLS"; then
				clear
				echo ""
				echo "Die DNS-Auflösung ist über TLS Verschlüsselt"
				echo ""
				while true; do
					read -p "Möchten sie die volle log sehen? J/j oder N/n : " Auswahl
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @dns.google example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			else
				clear
				echo ""
				echo "Die DNS-Auflösung scheint nicht Verschlüsselt zu sein!"
				echo ""
				while true; do
					echo ""
					read -p "Möchten sie die volle Log sehen? J/j oder N/n :" Auswahl
					echo ""
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @dns.google example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			fi
			break
		elif [ "$DNS_Auswahl" == 4 ]; then
			clear
			kdig @208.67.222.222 example.com +tls -p 853
			output=$(kdig @208.67.222.222 example.com +tls -p 853)
			if echo "$output" | grep -q "TLS"; then
				clear
				echo ""
				echo "Die DNS-Auflösung ist über TLS verschlüsselt!"
				echo ""
				while true; do
					echo ""
					read -p "Möchten sie die volle log sehen? J/j oder N/n : " Auswahl
					echo ""
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @200.67.222.222 example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			else
				clear
				echo ""
				echo "Die DNS-Auflösung scheint nicht Verschlüsselt zu sein!"
				echo ""
				while true; do
					echo ""
					read -p "Möchten sie die volle Log sehen= J/j oder N/n : " Auswahl
					echo ""
					if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
						clear
						kdig @200.67.222.222 example.com +tls -p 853 +dnssec
						exit
					elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
						clear
						exit
					else
						clear
						echo ""
						echo "Bitte geben sie J/j oder N/n!"
						echo ""
					fi
				done
			fi
			break
		elif [ "$DNS_Auswahl" == 5 ]; then
			while true; do
				echo ""
				read -p "Bitte geben sie ihren DNS-Server IP-Addresse: " Bel_DNS
				echo "Sie haben $Bel_DNS eingegeben."
				read -p "Stimmt das? J/j & N/n:" Eingabe
				echo ""
				if [[ "$Eingabe" == "J" || "$Eingabe" == "j" ]]; then
					clear
					kdig @"$Bel_DNS" example.com +tls 853
					output=$(kdig @"$Bel_DNS" example.com +tls -p 853)
					if echo "$output" | grep -q "TLS"; then
						clear
						echo ""
						echo "Die DNS-Auflösung ist über TLS verschlüsselt!"
						echo ""
						while true; do
							echo ""
							read -p "Möchten sie die volle Log sehen? J/j oder N/n : " Auswahl
							echo ""
							if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
								clear
								kdig @"$Bel_DNS" example.coom +tls -p 853 +dnssec
								exit
							elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
								clear
								exit
							else
								clear
								echo ""
								echo "Bitte geben sie J/j oder N/n!"
								echo ""
							fi
						done
					else
						clear
						echo ""
						echo "Die DNS-Auflösung scheint nicht Verschlüsselt zu sein!"
						echo ""
						while true; do
							echo ""
							read -p "Möchten sie die volle Log sehen? J/j oder N/n : " Auswahl
							echo ""
							if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
								clear
								kdig @"$Bel_DNS" example.com +tls -p 853 +dnssec
								exit
							elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
								clear
								exit
							else
								clear
								echo ""
								echo "Bitte geben sie J/j oder N/n!"
								echo ""
							fi
						done
					fi
					break
				elif [[ "$Eingabe" == "N" || "$Eingabe" == "n" ]]; then
					clear
					echo ""
					echo "Geben sie die Addresse nochmal bitte!"
					echo ""
				else
					clear
					echo ""
					echo "Bitte geben sie J/j oder N/n!"
					echo ""
				fi
			done
		else
			clear
			echo ""
			"Bitte geben sie einen zahl zwischen 1 und 5!"
			echo ""
		fi
	done
}
# Start Schleife
while true; do
	# Utils Instalieren
	echo ""
	read -p "Haben sie knot-dnsutils shon installiert? J/j oder N/n : " Auswahl
	echo ""
	if [[ "$Auswahl" == "J" || "$Auswahl" == "j" ]]; then
		clear
		Main_Funktion
		break
	elif [[ "$Auswahl" == "N" || "$Auswahl" == "n" ]]; then
		clear
		sudo apt update -y
		sudo apt install knot-dnsutils -y
		Main_Funktion
		break
	else
		clear
		echo ""
		echo "Bitte geben sie J/j oder N/n!"
		echo ""
	fi
done
