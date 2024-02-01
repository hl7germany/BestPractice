## {{page-title}}

Um einen schnellen Überblick über die Unterschiede zwischen den beiden Versionen zu erhalten, gibt es für jedes technische Artefakt einen "Diff"-Tab, hier z.B. für den R5-Ressourcentyp "Condition":

<div style="width:50%;margin: 20px auto">{{render:R4Diff.png}}</div>

Der Diff-Tab zeigt in jeder Version jeweils die Änderungen im Vergleich zur vorhergehenden Version an.

### Automatisches Mapping zwischen Versionen
Jedes FHIR-Release enthält ausführbare Conversion-Maps (auf Basis der [FHIR Mapping Language](https://hl7.org/fhir/mapping-language.html)), die ein automatisiertes Mapping von Instanzen zwischen zwei benachbarten FHIR-Versionen ermöglicht, z.B. hier für den Ressourcen-Typ "Condition":
<div style="width:50%;margin: 20px auto">{{render:Conversions.png}}</div>
Die Mappings stehen in beide Richtungen zur Verfügung (Upgrade und Downgrade).  

In der [Conversion Registry](https://hl7.org/fhir/extensions/conversion-registry.html) findet man einen Überblick über alle vorhandenen Mappings und die Ergebnisse der Roundtrip-Tests.

### Preadoption: R5-Features nutzen, aber auf R4 bleiben

Bevor die Migration eines auf R4 konzipierten, bestehenden Projektes auf R5 in Betracht gezogen wird, sollte zunächst geprüft werden, welche Vorteile sich dadurch ergeben und ob diese den Aufwand rechtfertigen. Geht es lediglich darum, in R5 neu hinzugekommene Elemente einer Ressource zu verwenden, kann auch der Weg der “Preadoption” gewählt werden. Dabei wird aus der Definition des neuen R5-Elementes automatisch eine R4-Extension generiert, die ohne einen Versionswechsel in R4 unmittelbar verwendet werden kann. Für diese Extensions gibt es auch einen eindeutigen Migrationspfad, so dass bei einer späteren Umstellung auf R5 eine eindeutige Zuordnung in der Conversion Map gewährleistet werden kann.
Details siehe http://hl7.org/fhir/versions.html#extensions
