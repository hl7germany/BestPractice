|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|

## {{page-title}}

<!-- Datentypen, Kardinalitäten und Beschreibung der Elemente sollte aus dem Informationsmodell ersichtlich sein. Informationsmodelle können z.B. als LogicalModel mit externen Tools wie ArtDecor, UML-Klassendiagramme o.ä. erstellt werden-->

<plantuml>
@startuml
' verstecke das E im Entitäten-Titel
hide circle

' verhindere Probleme mit gewinkelten Krähenfüßen
skinparam linetype ortho

entity Entität01 {
  *e1_id : nummer <<generiert>>
  --
  *name : text
  beschreibung: text
}

entity Entität02 {
  *e2_id : nummer <<generiert>>
  --
  *e1_id : nummer <<FS>>
  andere_details : text
}

entity Entität03 {
  *e3_id : nummer <<generiert>>
  --
  e1_id : nummer <<FS>>
  andere_details : text
}


Entität01 }|..|| Entität02
Entität03 }o..o| Entität04
Entität05 ||--o{ Entität06
Entität07 |o--|| Entität08
@enduml
</plantuml>

