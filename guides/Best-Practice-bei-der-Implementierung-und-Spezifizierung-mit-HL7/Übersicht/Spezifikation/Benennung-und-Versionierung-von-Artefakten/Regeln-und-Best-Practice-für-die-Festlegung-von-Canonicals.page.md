---
topic: CanonicalBestPractice
---
## {{page-title}}

### Einzigartigkeit 

Canonical URLs sind müssen so gewählt werden, dass sichergestellt ist, dass diese weltweit einzigartig sind. Dies wird dadurch erreicht, dass Organisationen Canonicals aus ihrer Domäne vergeben. Innerhalb einer Domäne ist die zuständige Organisation selbst dafür verantwortlich, die Eindeutigkeit der Vergebenen URLs zu gewährleisten. 


Canonicals werden in der Regel vom Autor einer Definition vergeben. Wenn die Canonical jedoch auf eine Definition verweist, die nicht als FHIR-Ressource abgebildet ist (z.B. eine externe Terminologie) und der Autor nicht erreichbar, identifizierbar oder willens ist, eine geeignete Canonical zu bestimmen, dann können Canonicals auch innerhalb der FHIR-Community abgestimmt werden, um dennoch einheitlich und interoperabel auf die jeweiligen Artefakte verweisen zu können. Häufig wird dann einfach eine Webadresse verwendet, unter der Informationen zu der entsprechenden Definition zu finden sind. Beispiel: http://unitsofmeasure.org ist die offizielle Informationsseite zur UCUM-Spezifikation und wird in FHIR als Canonical-URL für das entsprechende CodeSystem verwendet. 

Für den Aufbau von Canonicals gibt es keine festen Regeln, folgendes Schema hat sich jedoch als unkompliziert und praktikabel erwiesen: `[org]/[project]/[version]/[type]/[name]`

`[org]` = Domäne der herausgebenden Organisation, z.B. "http://meine-domaene.de", "http://hl7.org".  

Um die Canonicals auflösbar zu machen, muss in der Regel ein Redirect vom Webserver der Organisation auf die Publikationsseite der Spezifikation (z.B. Simplifier) eingerichtet werden. Dafür ist es hilfreich, wenn alle Canonicals eine gemeinsame Root haben, Das kann erreicht werden, indem stets der Pfad "/fhir/" an die Domäne angehängt oder eine Subdomäne verwendet wird z.B. "http://meine-domaene.de/fhir/" oder http://fhir.meine-domaene.de 
Von der Verwendung von "https" statt "http" in den Canoncials ist generell abzuraten. Hier wird sonst das Prinzip eines eindeutigen Namens für eine Ressource (was die Canoncial ist) mit der Methode zum Zugriff auf die Ressource (was die Canoncial NICHT ist) vermischt. 
Ein Name wird nicht "sicherer", wenn man ein "s" hinzufügt! 

`[project]` = Projektname der Spezifikation (kann weggelassen werden, wenn es nur eine einzige organisationsweite Spezifikation gibt, ist jedoch insbesondere dann hilfreich, wenn verschiedene Teams an diesen Projekten arbeiten und sichergestellt sein soll, dass die vergebenen URls eindeutig sind, ohne dass die Teams sich über die Vergabe abstimmen müssen.) 

`[version]` = Hauptversion der Spezifikation (sollte nur dann gesetzt werden, wenn mehrere Versionen der Spezifikation parallel betrieben werden müssen und wenn breaking changes zwischen verschiedenen Hauptversionen zu erwarten sind, sonst weglassen. 

`[type]` = Name des Ressourcentyps des Artefakte, z.B. "StructureDefinition", "ValueSet" etc. **CAVE:** Bei Ressourcen vom Typ "NamingSystem" sollte hier der internationalen Praxis gefolgt werden, anstelle des Ressourcentyps das Kürzel "sid" zu verwenden, da die Bezeichnung eines NamingSystems streng genommen keine Canonical URL, sondern eine uniqueID darstellt.  

***Begründung:**
NamingSystem Ressourcen verfügen nicht über ein `.url`-Elemente wie es für definitorische Artefakte üblich ist. Statt dessen wird die eindeutige Bezeichnung eines Namensraumes in `NamingSystem.uniqueID` angegeben. Dabei handelt es sich um ein wiederholbares Element, da die Ressource auch andere/alternative/veraltete bekannte Bezeichner eines Namensraumes erfassen kann (z.B. OIDs, UUIDs etc.). Die in FHIR gebräuchliche URI wird als `preferred` gekennzeichnet. Diese Besonderheit der NamingSystem-Ressource hatte in der Community immer wieder für Probleme und Kritik gesorgt, so dass die NamingSystem-Ressource in FHIR R5 ein `.url`-Element hinzubekommen hat. Daher ist es für R4 empfehlenswert, die URL `.../NamingSystem/...` frei zu lassen und statt dessen das Kürzel `.../sid/...` für `type`zu verwenden.*

`[name]` = sprechender, eindeutiger Name der Definition 

### Stabilität 

Einmal festgelegt, sollte sich eine Canonical nicht ändern, selbst wenn die Inhalte, die sie beschreiben, aktualisiert oder modifiziert werden. Die Änderungen der Version einer Definition kann unabhängig von der Canonical geschehen. Definitionen in FHIR verfügen stets sowohl über ein url-Attribut, das gleich bleibt, als auch ein version-Attribut, das sich im Laufe der Zeit ändern kann. Dies gilt ganz besonders für Canonicals, die später massenhaft in Implementierungen verwendet werden und sich obendrein auf die Interpretation von Daten auswirken können. Dies trifft insbesondere auf die Canonicals von CodeSystemen und NamingSystems zu. ValueSet sind weniger stark betroffen, da sie nur in den Definitionen verwendet werden, nicht in den Instanzen. Auch die Umbenennung von Profilen gilt als weniger kritisch, da die Angabe eines Profilnamens in meta.profile einer Instanz keine Auswirkung auf die Interpretation einer Ressource haben sollte. 

Wird eine Domäne aufgegeben, weil eine entsprechende Organisation nicht mehr existiert oder die Laufzeit eines Projektes beendet ist, muss eine Canonical nicht zwangsläufig geändert werden. Die einzige Einschränkung, die sich durch die Beibehaltung einer Canoncial, deren Domäne man nicht mehr kontrolliert, ergibt, besteht in der Schwierigkeit, die Canoncial weiterhin zur Publikation der Spezifikation auflösbar zu machen, da man den Redirect nicht länger konfigurieren kann. Da es jedoch keine Verpflichtung gibt, dass Canonicals auflösbar sein müssen, sollte dies kein Anlass sein, inkompatible Änderungen an der Spezifikation durchzuführen. 

### Versionsspezifische Canonicals 

Bei der Referenzierung auf eine Definition mittels des Datentyps `canonical` kann die Version pipe-separiert mit angegeben werden, wenn sichergestellt werden soll, dass sich der Verweis immer auf dieselbe Version einer Definition bezieht, unabhängig davon, ob diese noch aktuell oder gültig ist. 

In der Fhir-Spezifikation ist keine festgelegte Vorgabe zum Aufbau der Version enthalten. Die International oft genutzte SemVer-Versionierungsspezifikation ist eine gute Option und es wird empfohlen diese im Rahmen der erstellten Spezifikation festzulegen.

Beispiel: `http://hl7.org/fhir/ValueSet/data-absent-reason|4.0.1`

Bei Nutzung von SemVer ist es möglich die letzte Stelle (Bugfix-Stelle) der Canoncial als Wildcard wegzulassen z.B. http://hl7.org/fhir/ValueSet/data-absent-reason|4.0. Dies ermöglicht es Bugfixupdates ohne Anpassungnotwendigkeit der Teilnehmer, die bereits alles korrekt umgesetzt hatten, durchzuführen. In R4 ist dies in der Spezifikation noch nicht eindeutig erläutert, allerdings in den Folgeversionen bereits intendiert ([NPM Packages](https://confluence.hl7.org/pages/viewpage.action?pageId=35718629#NPMPackageSpecification-Versionreferences), [R5 Packages](https://hl7.org/fhir/packages.html#:~:text=Any%20dependencies%20SHALL,found%20patch%20number%3A), [R6 Build Canoncial Matching](https://build.fhir.org/references.html#canonical-matching))

Bei einer Canonical-Referenz *ohne* Versionsangabe entscheidet das jeweils interpretierende System, welche Version gilt. 

### Besonderheiten bei Canonicals von Extensions 

Extensions werden – wie alle definitorischen Artefakte – durch eine Canonical identifiziert und referenziert. 

Da der Datentyp von Extension.url jedoch “url” lautet (und nicht “canonical”), sind hier keine OIDs, UUIDs oder anderen Formen von URIs erlaubt, sondern ausschließlich URLs. Auch die versionsspezifische Notation [canonical]|[version] kann bei der Referenzierung auf Canonicals nicht verwendet werden. Bei nicht-kompatiblen Änderungen an Extensions muss daher die Canonical geändert werden. 


### Ändern von Canonicals 

Grundsätzlich gilt: Einmal vergebene Canonicals sollten nicht mehr geändert werden, auch dann nicht, wenn z.B. eine Domäne aufgegeben wird, weil eine herausgebende Organisation nicht mehr exisitiert oder fusioniert. 

Dies Auswirkung, dass eine ggf. Canonical dadurch nicht mehr auflösbar ist, stellt dabei nur ein geringfügiges Problem dar, da die Auflösbarkeit ohnehin optional ist. 

Deutlich schwerwiegender wären die Auswirkungen auf Spezifikationen und Implementierungen im Falle einer Änderung (bei dieser Betrachtung wird davon ausgegangen, dass die jeweilige Definition inhaltlich identisch bleibt, und NUR die Canoncial verändert werden soll): 

|Geänderte Canonical|Auswirkung auf Spezifikation|Auswirkung auf Instanzen|Auswirkung auf Implementierung|
|-
|StructureDefinition (Profil)|Geringfügig, ggf. Müssen gescopte Referenzen angepasst werden|Geringfügig, da aus dem Conformance-Claim nicht auf die Semantik geschlossen werden sollte (ein Blutdruck bleibt ein Blutdruck, so lange der LOINC code der gleiche bleibt, ob sich der Profilname ändert, sollte unerheblich sein.|Schwer abzusehen, zu welchen Zwecken Profile in den Implementierungen herangezogen werden. **Im Falle einer geplanten Änderung sollte ***vorher(!!)*** unbedingt die Community befragt werden.**|
|StructureDefinition(Extension)|Geringfügig, es sollte aber geprüft werden, ob andere Sepezifikationen aufgrund einer Dependency betroffen sind.|**Breaking Change**|**Breaking Change**, da Inhalte von Extensions nicht mehr verarbeitete werden können. Kritischer Breaking Change bei ModifierExtensions| 
|CodeSystem|Mäßig, da Slicings ggf. neu definiert werden müssen. Es sollte aber geprüft werden, ob andere Sepezifikationen aufgrund einer Dependency betroffen sind.|**Breaking Change**|<span style="color:red">**Kritischer Breaking Change**, da Codes nicht mehr erkannt und Suchergebnisse verfälscht werden können.</span>.|
|NamingSystem|Mäßig, da Slicings ggf. neu definiert werden müssen. Es sollte geprüft werden, ob andere Sepezifikationen aufgrund einer Dependency betroffen sind.|**Breaking Change**|<span style="color:red">**Kritischer Breaking Change**, da Identifier nicht mehr erkannt und Suchergebnisse  verfälscht werden können.</span>|
|Operation Definition|Geringfügig (CapabilityStatement muss angepasst werden)|keine|geringfügig|
|SearchParameter|Geringfügig (CapabilityStatement muss angepasst werden)|keine|geringfügig|
|Questionnaire|geringfügig|Breaking Change für QuestionnaireResponses|zu klären|


<img src="https://wiki.hl7.de/images/thumb/Attention_icon.svg/100px-Attention_icon.svg.png" alt="achtung" width="50" style="margin:0px 20px" align="left"/>

<b>Die hier aufgelisteten Auswirkungen von Änderungen beziehen sich auf bis jetzt gewonnene Erfahrungen aus solchen Ereignissen und werden kontinulierlich fortgeschrieben, sofern sich neue Erkenntnisse ergeben.</b>


