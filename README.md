# FXServer Setup-Anleitung

Diese Anleitung führt Sie durch den Prozess der Einrichtung eines FXServers auf Ihrem Linux-Server unter Verwendung eines Bash-Skripts. Zusätzlich wird beschrieben, wie Sie ein unterstützendes Skript aus dem `fxLinux` Repository von GitHub herunterladen und ausführen.

## Voraussetzungen

Bevor Sie beginnen, stellen Sie sicher, dass Sie Folgendes haben:

- Einen Linux-Server mit Root-Zugriff.
- `wget` und `git` installiert auf Ihrem Server.
- Grundlegende Kenntnisse im Umgang mit der Kommandozeile.

## Schritte zur Einrichtung

### 1. Skript vorbereiten

- Erstellen Sie eine neue Datei auf Ihrem Server, z.B. `setup_fxserver.sh`.
- Kopieren Sie den Skript-Code (wie zuvor beschrieben) in diese Datei.
- Machen Sie das Skript ausführbar mit dem Befehl: `chmod +x setup_fxserver.sh`.

### 2. Skript ausführen

Führen Sie das Skript als Root-Benutzer aus:

```bash
./setup_fxserver.sh
```

Das Skript führt folgende Aktionen durch:

- Aktualisiert das System und installiert notwendige Pakete (`screen`, `fail2ban`, `wget`, `git`).
- Erstellt einen Benutzer namens `cfx`, falls dieser nicht existiert.
- Erstellt die notwendige Verzeichnisstruktur für den FXServer.
- Lädt die FXServer-Dateien herunter und entpackt sie.
- Ändert den Eigentümer der FXServer-Verzeichnisse und Dateien zu `cfx`.
- Überprüft, ob MySQL oder MariaDB installiert ist und gibt eine Warnung aus, falls dies nicht der Fall ist.

### 3. Zusätzliche Schritte

Nach der Installation und Konfiguration durch das Skript:

- **Setzen Sie das Passwort für den `cfx` Benutzer** mit dem Befehl `passwd cfx`, falls erforderlich.
- **Überprüfen Sie die Installation von MySQL oder MariaDB**, falls Sie vorhaben, SQL-abhängige Systeme wie ESX oder qb-core zu verwenden. Installieren Sie diese nach Bedarf.

### 4. fxLinux Installations-Skript

Falls Sie zusätzliche Konfigurationen oder Installationen durch das `fxLinux` Skript von GitHub wünschen, besuchen Sie das Repository unter `https://github.com/2Luna/fxLinux` und folgen Sie den dortigen Anweisungen zur Ausführung des Installations-Skripts.

## Fazit

Nach Abschluss dieser Schritte sollte Ihr FXServer erfolgreich eingerichtet und bereit zur weiteren Konfiguration und Nutzung sein. Beachten Sie die Sicherheitshinweise und stellen Sie sicher, dass Sie regelmäßig Backups Ihres Servers und der wichtigen Daten erstellen.
