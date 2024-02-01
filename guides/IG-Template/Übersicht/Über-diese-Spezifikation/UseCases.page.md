|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|


## {{page-title}}

* Welche UseCases werden in dieser Spezifikation abgebildet?


### UseCase Diagramm
<!-- Beispiel UseCase Diagramm mit PlantUML-->
<plantuml>
@startuml
actor "Nurse" as n
participant "FHIR Repository" as fhir
group "Get Immunizations"
n -> fhir: "Consult Immunizations"
fhir -> n: "Bundle"
end
...
group "Immunization report"
n -> fhir: "Register Immunization"
end
...
group "Adverse Event Reporting"
n -> fhir: "Register Adverse Event"
end
@enduml
</plantuml>