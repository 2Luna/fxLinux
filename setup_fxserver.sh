#!/bin/bash

# Stelle sicher, dass das Skript als Root ausgeführt wird
if [ "$(id -u)" != "0" ]; then
   echo "Dieses Skript muss als Root ausgeführt werden" 1>&2
   exit 1
fi

# System aktualisieren und benötigte Pakete installieren
echo "System wird aktualisiert und notwendige Pakete werden installiert..."
apt-get update && apt-get upgrade -y
apt-get install -y screen fail2ban wget git

# Benutzer 'cfx' erstellen, falls nicht vorhanden
if id "cfx" &>/dev/null; then
    echo "Benutzer 'cfx' existiert bereits."
else
    echo "Erstelle Benutzer 'cfx'..."
    useradd -m -s /bin/bash cfx
    echo "Bitte setzen Sie das Passwort für den Benutzer 'cfx' manuell mit 'passwd cfx'"
fi

# Erstelle Verzeichnisstruktur für FXServer
echo "Erstelle Verzeichnisstruktur für FXServer..."
mkdir -p /home/cfx/FXServer/server
mkdir -p /home/cfx/FXServer/server-data

# FXServer-Dateien herunterladen
echo "Lade FXServer-Dateien herunter..."
wget -O /home/cfx/FXServer/fx.tar.xz "https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/14033-60505548e21b6d6e0844e02e571513e15bff5ccc/fx.tar.xz"

# FXServer-Dateien entpacken
echo "Entpacke FXServer-Dateien..."
tar -xf /home/cfx/FXServer/fx.tar.xz -C /home/cfx/FXServer/server
rm /home/cfx/FXServer/fx.tar.xz

# Ändere den Eigentümer der FXServer-Verzeichnisse und Dateien zu 'cfx'
echo "Ändere den Eigentümer der FXServer-Verzeichnisse und Dateien zu 'cfx'..."
chown -R cfx:cfx /home/cfx/FXServer

# Setze die passenden Berechtigungen
echo "Setze die passenden Berechtigungen..."
chmod -R 750 /home/cfx/FXServer

# Klone das FiveMStart Repository und ersetze die run.sh
TEMP_REPO_DIR="/tmp/FiveMStart"
git clone https://github.com/2Luna/FiveMStart.git "$TEMP_REPO_DIR"
if [ -f "$TEMP_REPO_DIR/run.sh" ]; then
    cp "$TEMP_REPO_DIR/run.sh" "/home/cfx/FXServer/server/run.sh"
    chown cfx:cfx "/home/cfx/FXServer/server/run.sh"
    echo "run.sh wurde erfolgreich ersetzt."
else
    echo "Fehler: run.sh wurde im Repository nicht gefunden."
fi
rm -rf "$TEMP_REPO_DIR"

# Definiere den Namen des Service und den Pfad zur run.sh
SERVICE_NAME=FXServer
FXSERVER_PATH="/home/cfx/FXServer/server"
RUN_SCRIPT="run.sh"

# Erstelle das systemd service file
cat <<EOF > /etc/systemd/system/$SERVICE_NAME.service
[Unit]
Description=FXServer Service
After=network.target

[Service]
Type=simple
User=cfx
WorkingDirectory=$FXSERVER_PATH
ExecStart=/bin/bash $FXSERVER_PATH/$RUN_SCRIPT
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Aktiviere und starte den Service
systemctl enable $SERVICE_NAME.service
systemctl start $SERVICE_NAME.service

echo "$SERVICE_NAME Service wurde erstellt und gestartet."

# Überprüfen, ob MySQL oder MariaDB installiert ist
if dpkg -l | grep -qE '^ii\s+(mariadb-server|mysql-server)'; then
    echo "MariaDB oder MySQL ist bereits installiert."
else
    echo "MariaDB oder MySQL ist NICHT installiert. Bitte beachten Sie, dass die Installation von MariaDB oder MySQL erforderlich ist, wenn Sie ein SQL-abhängiges System wie ESX oder qb-core verwenden möchten."
fi

echo "Die Installation und Konfiguration ist abgeschlossen. Alle relevanten Dateien gehören nun dem Benutzer 'cfx'."
