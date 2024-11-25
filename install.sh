#!/bin/sh

# Interaktive Abfrage für den Datenbanknamen (wird auch für Namen des Installationsverzeichnis verwendet)
echo "Name für Installationsordner/Datenbank eingeben:"
read DB_NAME

# Datenbankinformationen
DB_USER="admin"           						# Datenbankbenutzer
DB_PASS="Passwort"          					# Passwort des Datenbankbenutzers
DB_HOST="localhost"       						# Datenbankhost (meist localhost)

# WordPress Installationspfad
WP_PATH="/var/www/html/wordpress/$DB_NAME"
WP_URL="http://localhost/wordpress/$DB_NAME"    # URL der WordPress-Installation
WP_ADMIN_URL="$WP_URL/wp-admin"         		# Volle URL für das Dashboard

# Verzeichnis für die Installation erstellen und wechseln
mkdir -p "$WP_PATH"
sudo chown -R www-data:www-data "$WP_PATH"      # Rechte des Installationsverzeichnisses anpassen
cd "$WP_PATH"

# WordPress herunterladen
wp core download --locale=de_DE

# WordPress-Konfigurationsdatei erstellen
wp core config --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --extra-php <<PHP
define( 'WP_DISABLE_FATAL_ERROR_HANDLER', true );
define( 'WP_DEBUG', true );
PHP

# Zusätzlichen Eintrag in die wp-config.php schreiben
echo "" >> "$WP_PATH/wp-config.php"
echo "/** Hochladen von Dateien über das Dashboard ohne FTP-Verbindung ermöglichen */" >> "$WP_PATH/wp-config.php"
echo "define('FS_METHOD', 'direct');" >> "$WP_PATH/wp-config.php"

# Datenbank erstellen
wp db create

# WordPress installieren
wp core install --url="$WP_URL" --title="$DB_NAME" --admin_email="info@testmail.de" --admin_user="user" --admin_password="password"

# Den aktuellen Benutzer zur Gruppe www-data hinzufügen
sudo usermod -aG www-data $USER

# WordPress-Admin-Dashboard im Standardbrowser öffnen
xdg-open "$WP_ADMIN_URL"

# WordPress-Seite im Standardbrowser öffnen
xdg-open "$WP_URL"