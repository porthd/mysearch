Das Projekt ist noch in Entwicklung. Die Suche funktioniert noch nicht korrekt (1.1.2022)

# mysearch - ein persönlicher Suchindex für die Surf-Historie
##Vorwort
Das Projekt ist in Entwicklung. Wenn etwas nicht funktioniert, so scheuen sie sich bitte nicht, es im Issue bei Github zu diesem Projekt porthd/mysearch zu veröffentlichen
Das Projekt will jedem die Möglichkeit geben, seine persönliche Surfhistorie in einem privaten Suchindex zu speichern. Es ist offen so konzipiert, dass sie die bestehenden TYPO3-Extensions durch eigene ersetzen können. Auch ist das AddOn nur ein Prototyp.
Wenn sie Verbesserungsvorschläge haben, bessere Extensions, bessere AddOn, AddOns für andere Browser so freue ich mich über Hinweise.

##Voraussetzungen
1. Öffne Konsole/Bash/PcShell/Terminal/Cmd oder Ähnliche Command-Line-Interpreter und gehen mit `cd Pfad/ZumZielordner`, wo das Projekt im Unterordner `mysearch` angelegt werden soll.
2. Nur Git herunterladen und rechnerweit Installieren (Rechnerweit)
https://git-scm.com/downloads
3. Install Docker-desktop auf dem Rechner (rechnerweit)
1. Richtiges Betriebssystem heraussuchen
2. Anleitung von ddev beachten: https://ddev.readthedocs.io/en/stable/users/docker_installation/ (Engl.)
3. ggfls auch https://www.docker.com/products/docker-desktop (Engl.)
4. ddev installieren (rechnerweit)
(engl. Wichtige Hinweise https://ddev.readthedocs.io/en/stable/ )
ggls unter Windows mit Chololaty (choco) installieren
Bei Linux funktioniert Homebrew gut
Bei Mac sollte Homebrew auch funktioneren.
5.  Lade von GitHub die Zipdatei des Projekts `porthd/mysearch` herunter und entpacke es in einem selbst erstellten Ordner `mysearch`.
Oder gib in der Kommando-Zeile Folgendes an (git entpackt für dich):
`git clone https://github.com/porthd/mysearch.git`

##Erste Indexierungen mit Firefox / Browser vorbereiten
1. Prüfen sie im  Command-Line-Interpreter, ob mysearch unter ddev läuft.
Geben sie einfach `ddev list`  ein. In der Tabelle muss beim Eintrag mysearch ok stehen
2. Öffnen sie Firefox als Browser.
3. Installieren sie das Add-On, indem sie nach MySearch suchen oder indem sie auf der Seite `about:addons` auf das Zahnrad klicken und das AddOn als Datei installieren. Die Zip-Datei liegt im Projekt im AddOn/Firefox/mysearchAddOn.zip
4. Holen sie das Icon mit dem Auge in ihre Tool-Leiste. Über das Pop-Up können sie den Index bestimmen und die Indexierung angesurfter Seiten aus und anschalten.

**Anmerkung:** Grundsätzlich könnte der Browser auch als Suchroboter funktionieren. Ich habe bislang darauf verzichtet entsprechende Funktionen zu bauen, da hier verschiedenen Aspekte zu beachten sind. Ich denke, in solchen Fällen sollten robots.txt oder Kopierverbote beachten werden.

**Hinweis:** Aktuell ist das AddOn noch nicht bei FireFox registriert. Sie können es nur 


##Erster Start ihrer lokalen Suchmaschine
1. Gehe im  Command-Line-Interpreter mit `cd Pfad/ZumZielordner` in den Ordner `mysearch`, der beim Entpacken der Zip-Datei entstanden ist
2. Command-Line-Interpreter: starte ddev mit
ddev start
(Es sollte genügend Festplattenspeicher vorhanden sein, da ddev viele Programme/Images nachlädt. So schafft man trotz der Macken bei Windows, MacOs oder Linux etc eine einheitliche Systemumgebung.)
3. Command-Line-Interpreter: Nach dem Hochfahren von ddev geben sie folgende Befehle ein
`ddev exec ./firstInstall.sh`
Es legt unter anderem die Datei `mycomposer.json` an, in welcher eigenen Änderungen zu Extension-Zuordnungen vorgenommen werden können.
4. Command-Line-Interpreter: Damit TYPO3 funktioniert, braucht es eine Datenbank. Das Projekt bringt eine Daten Initial mit. Diese müssen sie nur importieren.
`ddev import-db --src=initial-mysearch.sql`
5. Command-Line-Interpreter: Anschließend muss noch das TYPO3-System installiert werden
`ddev composer update`
6. Command-Line-Interpreter: Anschließend ist die initiale Datenbank zu installieren. Diese Enthält die TYPO3-Konfigurationen und stellt die Webseite `https://mysearch.ddev.site` lokale auf ihrem Rechner zur Verfügung.
7. Command-Line-Interpreter: Anschließend starten sie das ddev-System neu
`ddev restart`
8. Browser:  
Surfen sie auf: `https://mysearch.ddev.site`
9. Erstellen sie ein Suchabfrage, sofern überhaupt schon etwas indexiert wurde. (FireFox-Addon)
Anmerkung: Wenn ihr der Suchindex leer ist, könnten sie eine Fehlermeldung – vielleicht noch hässliche – Fehlermeldung bekommen.


##Weitere Starts ihrer lokalen Suchmaschine
Beachten Sie. Ohne das laufenden Ddev wird kein Browserverlauf indiziert. (Erkennbar am rötlichen Rahmen. )
Eine Seite wurde nur indexiert, wenn der Rahmen um die Seite grün ist. Schwarz bedeutet, dass die Seite auf der Bläcklist steht. Blau bedeutet, dass das AddOn derzeit nicht indexieren soll. Gelb bedeutet, dass die Seite in Bearbeitung ist.
1. Gehe im  Command-Line-Interpreter mit `cd Pfad/ZumZielordner` in den Ordner `mysearch`, der beim ersten Entpacken der Zip-Datei entstanden ist
2. Wenn sie an ihrer Datei mycomposer.json Änderungen vorgenommen haben,  dann führen sie folgende Befehle aus:
1. `ddev exec ./updateInstall.sh`
2. `ddev composer update`
3. Command-Line-Interpreter: starte ddev mit
`ddev restart`
(Dies hat den Vorteil, dass eine noch laufende Version heruntergefahrfen wird und ddev neu gestartet wird.
4. Browser: Für die eigne Suche
Surfen sie auf: `https://mysearch.ddev.site`


##Weiterentwicklungen des Prototypen 
Eine zentrale Idee wäre, dass man sich zu bestimmten Themen Linksammlungen kaufen kann, die der Suchindex dann indexiert. Dies böte für Journalisten oder Hobby-Internetter ein interessantes Zusatzeinkommen.
Sie können das TYPO3-System um eigenen Extensions erweitern, um dem System weiterer Indexer oder Resulter zur Verfügung zu stellen.  
Sie können auch meine Extension durch ihre eigenen Extensions ersetzen. (Es würde zuweit führen, dies hier genau zu erklären.)
Da das TYPO3 nur als Schnittstelle zwischen der ElasticSearch-Datenbank und ihrem Browser fungiert, können sie auf dem ddev-System ein eigenes CMS-System etablieren.
Sie können natürlich auch ihr eigene AddOn für den Firefox schreiben. Oder auch für andere Browser. Zum Beispiel könnte man ein AddOn zum Monitoring bestimmter (Kinos, Konzerte, Theater, ...) Seiten verwenden. Oder ein AddOn monitored Preise auch verschiedenen Seiten.


###Sicherheitsbedenken
Sie können dies System auch auf einem Internet-Server betreiben. In diesem Fall sollte man für einen Passwortschutz des ElasticSearch-Servers sowie des Servers insgesamt sorgen.
SICHERHEITSTECHNISCH IST DER VORLIEGENDE PROTOTYP EINE KATASTROPHE.
Ich habe bisher nicht richtig verstanden, wie man elasticsearch mit passworten absichert. Solange man die Seite nur lokal auf seinem Rechner nutzt und man nicht mit irgendeinem (Firmen-)Netzwerk verbunden, sollte es keine Probleme geben. 
Vorschlägen zu Optimierung der Sicherheit stehe ich offen gegenüber.

