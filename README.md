# FXServer Setup-Anleitung

Diese Anleitung beschreibt die Einrichtung eines FXServers auf einem Linux-Server mithilfe eines automatisierten Bash-Skripts. Dieses Skript führt sämtliche notwendigen Schritte aus, um den Server zu installieren und zu konfigurieren, inklusive der Installation von Abhängigkeiten und der Konfiguration der Server-Software.

## Voraussetzungen

Um dieses Skript erfolgreich auszuführen, benötigen Sie:

- Einen Linux-Server mit Root-Zugriff.
- Internetverbindung auf dem Server.

## Installationsschritte

Das Skript führt folgende Aktionen aus:

1. **Systemaktualisierung und Installation benötigter Pakete:** Das System wird aktualisiert und Pakete wie `screen`, `fail2ban`, `wget`, und `git` werden installiert.
   
2. **Benutzererstellung:** Ein Benutzer namens `cfx` wird erstellt, falls er noch nicht existiert. Dieser Benutzer wird für den Betrieb des FXServers verwendet.

3. **Verzeichnisstruktur erstellen:** Es werden notwendige Verzeichnisse für den FXServer unter `/home/cfx/FXServer` angelegt, inklusive eines `server`- und eines `server-data`-Verzeichnisses.

4. **FXServer-Dateien herunterladen und entpacken:** Die neuesten FXServer-Dateien werden heruntergeladen und im `server`-Verzeichnis entpackt.

5. **Eigentümerschaft und Berechtigungen setzen:** Die Eigentümerschaft der FXServer-Verzeichnisse und Dateien wird auf den Benutzer `cfx` gesetzt und entsprechende Berechtigungen werden angewendet.

6. **FiveMStart-Skript:** Das `FiveMStart`-Repository wird geklont, und die `run.sh` aus diesem Repository wird verwendet, um die Standard-`run.sh` zu ersetzen. Dies optimiert den Startprozess des Servers.

7. **Datenbanküberprüfung:** Das Skript überprüft, ob MySQL oder MariaDB installiert ist und gibt eine Meldung aus, falls dies nicht der Fall ist. Die Installation einer Datenbank ist erforderlich für SQL-abhängige Systeme wie ESX oder qb-core.

## Ausführung

Um das Skript auszuführen, loggen Sie sich als `root` auf Ihrem Server ein und starten Sie das Skript mit:

```bash
./setup_fxserver.sh
```

## Nach der Installation

Nach erfolgreicher Ausführung des Skripts sollten Sie:

- Das Passwort für den Benutzer `cfx` mit `passwd cfx` setzen.
- Eine MySQL- oder MariaDB-Datenbank installieren, falls Sie planen, SQL-abhängige Anwendungen zu verwenden.
- Den FXServer starten, indem Sie zum `/home/cfx/FXServer/server`-Verzeichnis navigieren und `./run.sh` ausführen.

## Abschluss

Nachdem Sie diese Schritte ausgeführt haben, ist Ihr FXServer einsatzbereit. Für weitere Anpassungen oder Informationen besuchen Sie bitte das offizielle [FiveM](https://fivem.net/) Forum oder die [fxLinux](https://github.com/2Luna/fxLinux) GitHub-Seite.
