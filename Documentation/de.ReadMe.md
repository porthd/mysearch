# Projekt `Persönliche Suchmaschine`
## Warum überhaupt?  
### Anlass
Der inhaltliche Impact von Google nimmt immer mehr ab. 
Facebook, Instagram, Pinterest und andere Social-Media gehören zu gray-Net, weil sie gegen die regulären Suchmaschinen abgeschottet sind.
Einige spezielle Quelle werden wegen ihres extrem flüchtigen Charakters gar nicht erfasst, obwohl sie manchmal einen hohen Informationnutzen haben. (technische Chats, Newsletter)
Die Zersplitterung von Informationen nimmt immer mehr zu, weil keiner Geld für das Zusammenfassen und ordnen von Wissen ausgeben will.

#### aktuelles Suchverhalten
Mein Anlass für Recherchen ist oft, dass ich bestimmte Sachen vergessen habe oder mir nur noch gemerkt habe, wie ich sie finden kann. 
Mein Wissen ist immer mehr Impulsgesteuert und immer weniger Verständnis-basiert.
Daraus ergibt sich der folgende Workflow
1. Suchthema eingrenzen und Suchabfragen dafür finden
2. Suchbegriffe in Browser eingeben, der eine Suchmaschine aufruft
3. Überfliegen der Suchbegriffe inklusive der Kurztexte
4. interessant erscheinende Seiten öffnen
5. lesen

#### Probleme
Durch die Zergliederung des Wissens reicht eine Suchmaschine nicht mehr aus. 
Man ist auch verschiedene Suchmaschinen angewiesen.
Es wäre wünschenswert, das persönliche Wissen in einer persönlichen Suchmaschine zusammenzufassen.


### Idee - Persönliche Suchmaschine
Der aktuelle Trend zu personalisierter Suche basiert auf der Erkenntnis, dass die Menschen im Allgemeinen immer wieder in den gleichen Quellen suchen und lesen. 
Der Wunsch nach Exploration von neuen Quellen ist eher gering ausgeprägt. Neues Lernen ist anstrengend.

[comment]: <> (Mit Blick auf die Suchergebnisse bei den Social-Medias heißt es, dass  )

[comment]: <> (Häufig schaut man sich verschiedene Quellen an und findet erst nach mehrfachen Versuchen eine geeignete Seite.)

[comment]: <> (Es wäre schön, wenn der Browser die Inhalte der angesurften Seiten an eine persönliche Suchmaschine weiterleiten könnte.)

[comment]: <> (Bei der nächsten Suche könnte der Browser dann zuerst die eigene Suchmaschine verwenden.)

## Installation 
### Installation/Update von lokaler Umgebung (Kommandozeilen-Umgebung)
1. Installieren Sie das Versionierungsprogramm `git` [https://git-scm.com/downloads] auf ihrem Rechner. (Wenn `git -v` ein Ergebnis enthält, kann dieser Schritt entfallen.)
2. Rufen Sie die/das Konsole/Bash/Terminal/Shell/Powershell auf. Gegen sie mit `cd` zum Ordner, wo sie mysearch installieren wollen. Geben sie zum Herunterladen des Codes Folgendes als Kommando-Zeile ein: 
` git clone https://github.com/porthd/mysearch.git`
3. Installieren Sie Docker [https://docs.docker.com/get-docker/] auf ihren Rechner.
   (Wenn `docker -v` ein Ergebnis enthält, kann dieser Schritt entfallen.)
4. Installieren Sie ddev [https://ddev.readthedocs.io/en/stable/] auf ihrem Rechner.
   (Wenn `ddev -v` ein Ergebnis enthält, kann dieser Schritt entfallen.)
5. Starten Sie ddev über die Kommandozeile: 
`ddev start` (Beim ersten Mal kann dies relativ lange dauern, da ddev aus dem Internet verschieden Programme wie php oder mariadb herunterladen und in seiner Containerstruktur einbauen muss)
6. Laden sie die Installation des TYPO3-CMS-Systems aus dem Internet über die Kommandozeile
`ddev composer install`
   (Beim ersten Mal kann dies relativ lange dauern, da der `composer` aus dem Internet viel Code herunterladen muss.)
7. Laden sie die Minority-Updates für das TYPO3-System nach, indem sie die Kommandoziele `ddev composer update` eingeben.
   (Dies kann manchmal relativ lange dauern, da der `composer` aus dem Internet gegebenenfalls viel Code ersetzen und nachladen muss.
### Installation des AddOn in ihrem Browser

## Übersicht zu Architekturprinzipien
### Datenerfassung
Man erstellt lokal basierend auf Docker, ddev und ElasticSearch die technische Umgebung für ein Suchmaschine.
Ein AddOn im Browser sorgt dafür, dass die Daten eines Tabs automatisch an einen PHP-Parser inklusive mögliche Preselekt-Parameter weitergeleitet werden.
Das AddOn muss für die persönliche Suchmaschine auch Löschhinweise zulassen, denn man will sich ja nicht jeden Kram merken.
Der Parser bereitet die Inhalte auf und schickt sie anschließend an den Elastic-Server weiter.
### Datenexploration
Der Parser extrahiert auch links aus den Inhalten für weitergehende Explorationen.
### Datenabfrage
Bei der Eingabe von Suchbegriffen in die Adresszeile wird die persönliche Suchmaschine aufgerufen.
Die Suchmaschine wählt es der perönlichen Sammlung Begriffe aus.
Per Click kann man ausgewählte Seiten im Tab öffnen lassen
Oder man nutzt offensive die Explode-Version, um weitere Links öffnen zu lassen. 
Diese zusätzlichen Seiten können dann wieder von persönlichen Suchmaschine erfasst werden.


## Folgen
Die persönliche Suchmaschine wird das aktuelle Geschäftsmodell von Google untergraben, weil die Menschen autonom werden und verschiedene Informationsquellen zusammenführen.
Chats werden in der allgemeinen Wahrnehmung nicht länger als flüchtig angesehen, weil die Daten in vielen persönlichen Suchmaschinen persistiert sein können.

## Einloggen

| Art                 | Wert |
| ------------------- | ------ |
| InstallToolPasswort | Test123!|
| Login               | mysearch-admin|
| Passwort            | Test123!|

# Wie testet man, dass der Elastic-Search-Server Daten einlist, speichert und indexiert.
Ganz einfach: indem man test, ob er Daten hat. 
Voraussetzung: Es muss der Kommandozeilen-Browser (URL-Aufrufer) CURL installiert sein.
Terminal-Ebene: (PowerShell, bash, termial()mac), ...)
- Lasse die alle Datensätze anzeigen
  - `curl -X GET "mysearch.ddev.site:9200/general?pretty"`
- Lasse 10 Datensätze anzeigen
  - `curl -X GET "mysearch.ddev.site:9200/general/_search?pretty=true&size=10"`

