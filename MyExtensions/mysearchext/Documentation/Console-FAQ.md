# FAQ für Befehle Elastic-Search
## Löschen von Daten (alle, Index, Index-Type)
- konsole (Ubuntu unter Windows - Pfad vom Mysearch-Projekt)
  - `curl -X DELETE 'http://mysearch.ddev.site:9200/_all'`
  - Antwort ``{"acknowledged":true} ``
  - Einzeldokument `curl -X DELETE 'http://mysearch.ddev.site:9200/index/type/documentID'`
  - Typen in Index `curl -X DELETE 'http://mysearch.ddev.site:9200/index/type'`
  - Einzelner Index  `curl -X DELETE 'http://mysearch.ddev.site:9200/index'`
  - [https://stackoverflow.com/questions/22924300/removing-data-from-elasticsearch]()
- php

## Liste der Indices
- konsole (Ubuntu unter Windows - Pfad vom Mysearch-Projekt)
    - alle Indices ` curl -X GET "mysearch.ddev.site:9200/_cat/indices/"'`
    - Antwort zum Beispiel ``yellow open klaus VNXyLIYAS36ToVMhn24qcQ 1 1 4 0 1.3mb 1.3mb``
- php

## Auflisten aller indexierten Daten
- konsole
    - aus alle Indices ` curl -X GET "mysearch.ddev.site:9200/_search?pretty=true&q=*:*"`
    - aus dem Index 'werner' `` curl -X GET "mysearch.ddev.site:9200/werner/_search?pretty=true&q=*:*"``
    - Antwort für die Daten im Index 'Werner' `{
      "took" : 15,
      "timed_out" : false,
      "_shards" : {
      "total" : 1,
      "successful" : 1,
      "skipped" : 0,
      "failed" : 0
      },
      "hits" : {
      "total" : {
      "value" : 1,
      "relation" : "eq"
      },...`

- php
