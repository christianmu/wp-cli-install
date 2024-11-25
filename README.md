# Beschreibung

Im Terminal auszuführende Skripte, mit welchem WordPress automatisch lokal installiert und deinstalliert werden kann (bei Verwendung von Windows müssen die entsprechenden Windows-Befehle gesetzt werden).

Es sind die Datenbankinformationen anzupassen, sowie der Installationspfad. Dann:
`sh install.sh` bzw. `sh uninstall.sh`.

# Anleitung

### Voraussetzungen

1. **Installierte Software**:

   - [WordPress CLI (`wp`)](https://wp-cli.org/) muss installiert sein.
   - Ein Webserver (z. B. Apache oder Nginx) muss konfiguriert sein und laufen.
   - PHP und MySQL müssen installiert sein.
   - `xdg-utils` für das Öffnen von URLs im Browser (in der Regel auf Linux-Systemen vorinstalliert).

2. **Dateirechte**:

   - Das Skript muss ausführbar sein:
     ```bash
     chmod +x install.sh
     ```

3. **Datenbankbenutzer**:

   - Sicherstellen, dass der Benutzer `DB_USER` mit dem Passwort `DB_PASS` Zugriff auf MySQL-Datenbanken hat.

4. **Rechte für den Installationspfad**:
   - Der Benutzer, der das Skript ausführt, sollte Schreibrechte im Verzeichnis `/var/www/html/wordpress` haben.

### Skript ausführen

1. Terminal öffnen.
2. In das Verzeichnis navigieren, in dem sich das Skript `install.sh` befindet:
   ```bash
   cd /Pfad/zum/Skript
   ```
3. Skript starten:
   ```bash
   sh install.sh
   ```

### Während der Ausführung

- Das Skript fragt interaktiv nach dem Namen für den Installationsordner und die Datenbank. Namen eingeben.
- Der Rest wird automatisch durchgeführt, einschließlich des Downloads, der Konfiguration und der Installation von WordPress.

### Nach der Installation

Das Skript öffnet automatisch:

- **WordPress-Dashboard** (der voreingestellte Account ist: user / password)
- **Die neue WordPress-Seite**
