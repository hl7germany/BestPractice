## {{page-title}}
### 29.10.2024
* `improved` im Rendering des CapabilityStatements wird nun in der Darstellung von (Rev)Include-Parametern zwischen MAY und SHALL differenziert

### 22.10.2024
* `improved` Zuweisung von `%canonical` in globale Variablen `variables.yaml` verschoben
* `improved` Beispiel-Ressourcen auf FSH migriert
* `improved` ausführlicheres CapabilityStatement-Beispiel erzeugt
### 18.10.2024
* `improved` Für Extensions würd jetzt eine übersicht der *verwendeten* Extensions (incl. aus Dependencies) erstellt, nicht nur der im Projekt spezifizierten
* `improved` FQL Queries für Extensions verwenden `using scope` um auch Extensions aus Dependencies im IG darstellen zu können.
### 17.10.2024
* `fixed` FQL für Ressource-Interaktionen korrigiert, so dass es auch bei mehreren supportedProfiles korrekt funktioniert
### 10.10.2024
* `improved` topic-based pagelink statt hartcodierter URL um von Profil-Seite auf CapabilityStatement zu verweisen
### 24.09.2024
* `added` Vervollständigung der Darstellung des CapabilityStatements
* `changed` Selektion des CapabilityStatement.rest.resource-Knotens im Profil-Template anhand `suportedProfile` statt `type`, damit kann die Variable %resType entfallen
### 20.09.2024
* `changed` Template und FQL-Queries für Rendering von CapabilityStatement vollständig überarbeitet
### 13.09.2024
* `fixed` FQL Queries auf CapabilityStatement funktionieren nun auch bei multiplen Ressourcentypen
### 19.08.2024
* `fixed` statische URL in FQL-Statement von ValueSet und CodeSystem auf Canonical-Variable korrigiert
* `fixed` defekter PageLink im Template für CodeSystem korrigiert
* `changed` neues Simplifier-Feature (ab Version 2024.5.2) output=transpose für Metadata-Tabellen verwendet.
### Version 0.0.4
* `added` Template für (SDC-)Questionnaires hinzugefügt
* `changed` [HDB-210](https://hl7germany.atlassian.net/issues/HDB-210) Startseite umbenannt in "Übersicht"
* `changed` Umstellung auf neue FQL-Syntax (Verfügbar ab Simplifier Version 31.1.1.0) mit Variablen für Canoncials und neuen Output-Optionen. Auslagerung der FQL-Queries, die in Tabs verwendet werden, in Hidden Pages
### Version 0.0.3
* `changed` Beispiele über page-widget inkludiert und Feature-Request für die Verwendung der `subject`- Variable für Beispieldaten hinzugefügt
* `fixed` FQL Query für Mappings korrigiert
* `fixed` Von Firely behobene offene Punkte auf erledigt gesetzt
* `added` Kapitel "Operations"
* `added` Kapitel "UseCases" mit Beispiel UML hinzugefügt
* `changed` 'subject'-Header durch 'canonical' ersetzt in Anpassung an Simplifier Version 30.6.0
* `added` {{breadcrumbs} }-Platzhalter unter Menübalken hinzugefügt.

### Version 0.0.2
* `changed` Hinweise zu Template und Template in zwei IGs separiert

### Version 0.0.1 
* `added` Kapitel "Known Issues" zur Reproduktion von Bugs, Tracking von missing Features hinzugefügt.
* `added` Template IG initial erstellt


