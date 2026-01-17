# Skript für gegen KVM.
clear
echo "Haben sie den Skript als ROOT ausgeführt?!"
read -p "Eingabe: " input
COPY_START_LOCATION="Config/blacklist-kvm.conf"
PASTE_END_LOCATION="/etc/modprobe.d/blacklist-kvm.conf"
if [[ "$input" == "j" || "$input" == "J" ]]; then
	# KVM für die aktuelle Session deaktivieren
	modprobe -r kvm_intel

	# Blacklist Einfügen &  initramfs Updaten
	cp "$COPY_START_LOCATION" "$PASTE_END_LOCATION"
	update-initramfs -u

	# Neustart Meldung
	clear
	echo "Skript würde erfolgreich ausgeführt"
	echo "Bitte Starten sie ihren rechner erneut!"
	exit 0
else
	clear
	echo "Bitte den Skript als ROOT ausführen!!!"
fi

# Erfolgreich verlassen
exit 0
