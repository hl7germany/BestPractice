---
canonical: http://example.org/StructureDefinition/MeinPatientProfil
capability: http://example.org/CapabilityStatement/BeispielCapabilityStatement
expand: 1
---

|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|
||Um das Template an ein konkretes Ressourcenprofil anzupassen, müssen dessen Canonical sowie der Ressourcentyp im Seitenheader angepasst werden! Die Seite muss umbenannt werden von Template -> Profilname|
||Wenn ein CapabilityStatement vorhanden ist und der Abschnitt RESTful-API gefüllt werden soll, muss im Header zusätlich die Canoncial des CapabilityStatements angeben werden. Falls nicht, sollte der Abschnitt RESTFul-API durch eine geeignete Beschreibung des verwendeten Paradigmas ersetzt werden.|

## {{link}}

### Metadaten

<fql output="transpose" headers="true">
from
	StructureDefinition
where
	url = %canonical
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
</fql>



### Inhalt

<!-- im Beschreibungs-Tab werden die Inhalte StructureDefintion.description sowie ElementDefinition.short und .comment der mit einem MS-Flag markierten Elemente ausgegeben-->
<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="Beschreibung"> 
    {{page:FQL-Beschreibung}}
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

<!-- TODO: FQL funktioniert noch nicht wie vorgesehen, da nur die Binding des Differentials ausgegeben werden
### Terminology-Bindings

<fql headers="true">
from 
    StructureDefinition
where 
    url = %canonical
for 
    snapshot.element
    where 
        mustSupport = true and binding.exists()
    select
        Element: binding.path, Staerke: binding.strength, ValueSet: binding.valueSet
</fql>
-->

### Constraints/Invarianten
<fql headers="true">
from StructureDefinition where url = %canonical for differential.element.constraint select Name: key, Schweregrad: severity, Beschreibung: human, Ausdruck: expression
</fql>

### RestFul API

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations}}
    </tab>
    <tab title="Link">
        {{pagelink:CapabilityStatement}}
    </tab>
</tabs>

### Beispiele

<!-- ausgewählte Seiten aus Kapitel /Artefakte/Beispiele hier einbetten-->

{{page:Startseite/Artefakte/Beispiele/Patient--Minimaldatensatz-1.page.md}}
{{page:Startseite/Artefakte/Beispiele/Patient--Minimaldatensatz-2.page.md}}

### Mappings

<!-- FQL zum Rendern von Mappings unterschiedlichen Identitäten, URL und Name der Identität müssen jeweils angepasst werden. Abschnitt entfernen, falls keine Mappings verwendet werden-->
<tabs>
 <tab title="Mein Erstes Mapping">
@```
      from StructureDefinition
      where url = 'http://example.org/StructureDefinition/MeinPatientProfil' 
      for differential.element 
      select
        FHIR: id,
        join mapping.where(identity = 'meinErstesPatientenMapping')
          { meineDatenbank: map, Hinweis: comment, Identitaet: identity  } 
```
</tab>
<tab title="Mein Zweites Mapping">
@```
      from StructureDefinition
      where url = 'http://example.org/StructureDefinition/MeinPatientProfil' 
      for differential.element 
      select
        FHIR: id,
        join mapping.where(identity = 'meinZweitesPatientenMapping')
          { meineDatenbank: map, Hinweis: comment, Identitaet: identity  } 
```
</tab>
</tabs>
