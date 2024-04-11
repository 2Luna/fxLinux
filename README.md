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

### 4. Verwendung von FiveMStart

Nach der erfolgreichen Einrichtung und Konfiguration Ihres FXServers sollten Sie das `FiveMStart`-Skript ausführen, welches speziell für die Initialisierung und Verwaltung Ihres FiveM Servers entwickelt wurde. Dieses Skript automatisiert viele der routinemäßigen Aufgaben, die für den Betrieb eines stabilen und sicheren FiveM-Servers notwendig sind.

Um das `FiveMStart`-Skript zu nutzen, folgen Sie bitte diesen Schritten:

1. Das Skript wird automatisch im Zuge der Server-Einrichtung heruntergeladen und im Verzeichnis `/home/cfx/FXServer/server/` gespeichert.
2. Es ersetzt die standardmäßige `run.sh` durch eine spezialisierte Version, die im `FiveMStart`-Repository bereitgestellt wird, um eine optimierte Server-Startprozedur zu gewährleisten.
3. Um den Server zu starten, navigieren Sie zum Server-Verzeichnis und führen Sie `./run.sh` aus.

Das `FiveMStart`-Skript unterstützt Sie bei:

- Automatischer Konfiguration essentieller Server-Parameter.
- Vereinfachung des Startprozesses.
- Bereitstellung von Tools und Skripten für die Serverwartung und -überwachung.

Bitte stellen Sie sicher, dass Sie die neueste Version des `FiveMStart`-Skripts verwenden, indem Sie regelmäßig Updates aus dem offiziellen GitHub-Repository beziehen: `https://github.com/2Luna/FiveMStart`.

Die Verwendung von `FiveMStart` trägt wesentlich zur Effizienz und Stabilität Ihres FiveM-Servers bei und wird für ein optimales Servermanagement empfohlen.

## Fazit

Nach Abschluss dieser Schritte sollte Ihr FXServer erfolgreich eingerichtet und bereit zur weiteren Konfiguration und Nutzung sein. Beachten Sie die Sicherheitshinweise und stellen Sie sicher, dass Sie regelmäßig Backups Ihres Servers und der wichtigen Daten erstellen.
