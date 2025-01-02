---
topic: CanonicalBedeutung
---


## {{page-title}}

Canonicals sind weltweit eindeutige Bezeichnungen für Artefakte, mit deren Hilfe in FHIR systemübergreifend, konsistent und interoperabel auf Definitionen verwiesen werden kann. 

Diese Bezeichnungen sind unabhängig vom tatsächlichen Speicherort, unter dem diese Definitionen abrufbar sind. 

<img src="https://wiki.hl7.de/images/thumb/Attention_icon.svg/100px-Attention_icon.svg.png" alt="achtung" width="50" style="margin:0px 20px" align="left"/>
<b>Canonicals sind keine Adressen, sie sind lediglich weltweit eindeutige Namen!</b>  


Die Verwechslung von Adressen und Namen kann in FHIR leicht passieren, da es sich i.d.R. bei beidem um URLs handelt. (Canonicals können genau genommen auch andere Formen von URIs annehmen, z.B. OIDs oder UUIDs, üblich und empfohlen sind jedoch URLs. Die Bereitstellung der Artefakte erfolgt i.d.R. über die FHIR-API, welche das HTTP-Protokoll nutzt, wodurch auch der Speicherort als URL gegeben ist.). Speicherort und Name können jedoch verschieden sein. Sie müssen sogar verschieden sein, wenn man bedenkt, dass der Name weltweit eindeutig ist, das entsprechende Artefakt (z.B. ein ValueSet) jedoch auf dutzenden, wenn nicht hunderten verschiedenen FHIR-Servern über eine API (mit jeweils abweichender URL) bereitgestellt werden kann.

Um Artefakte wie z.B. CodeSysteme über die FHIR-API von einer externen Quelle herunterzuladen, braucht man  

* die Adresse des FHIR-Endpunktes (z.B. https://terminologieserver.bfarm.de/) 
* den Namen des Artefaktes (z.B. http://fhir.de/CodeSystem/bfarm/icd-10) 

Die Abfrage des Artefaktes erfolgt dann in der Form einer Suche anhand des Namens (der Canonical-URL) auf dem konfigurierten Endpunkt, z.B.: 

`https://terminologieserver.bfarm.de/CodeSystem?url=http://fhir.de/CodeSystem/bfarm/icd-10`

Der Speicherort der Ressource auf diesem Endpunkt könnte folgendermaßen lauten: 

`https://terminologieserver.bfarm.de/CodeSystem/[id]`

Wobei die [id] von einem Server beliebig gewählt werden kann. Wird das Artefakt anschließend lokal im abrufenden System gespeichert, erhält es eine neue Adresse, z.B. 

`https://mein-fhir-server.de/fhir/CodeSystem/[id]`

Die ID wird dabei von jedem System selbst bestimmt und neu vergeben. Das Artefakt bleibt jedoch auch stets anhand der systemübergreifend stabilen Canonical auffindbar: 

`https://mein-fhir-server.de/fhir?url=http://fhir.de/CodeSystem/bfarm/icd-10`

 
Wärend sich also die Adresse abhängig von dem bereitstellenden System ändert, bleibt die Canonical über alle Systeme hinweg konstant. 

Der Verweis auf Definitionen anhand ihrer Canonical stellt sicher, dass unterschiedliche Systeme verstehen, dass die gleiche Definition gemeint ist, obwohl diese in den Systemen an völlig unterschiedlichen Speicherorten abgelegt sein kann. 

### Datentyp von Canoncial URLs 

Der Datentyp für Canonicals ist [URI](https://de.wikipedia.org/wiki/Uniform_Resource_Identifier), was bedeutet, dass zur eindeutigen Benennung einer Definition nicht zwangsläufig eine URL verwendet werden muss. Auch andere Formen von URIs sind erlaubt, z.B. OIDs oder UUIDs.  

In der FHIR-Community wird die Verwendung von [URLs](https://de.wikipedia.org/wiki/Uniform_Resource_Locator) gegenüber anderen Formen von URIs präferiert, da sie für die Entwickler erhebliche Vorteile haben: 

* Sie sind lesbar. Ein Verweis auf die URL http://hl7.org/fhir/ValueSet/data-absent-reason lässt klar erkennen, dass es sich
  * um ein ValueSet handelt,
  * diese von HL7 publiziert wurde und
  * dort Codes zur Begründung von fehlenden Daten enthalten sind.  
  Die äquivalente OID “2.16.840.1.113883.4.642.3.5” hingegen lässt keine derlei Rückschlüsse zu. 

* Sie sind ubiquitär. Jede Organisation verfügt entweder bereits über eine eigene Domäne oder kann eine solche niederschwellig und kostengünstig registrieren. Für die meisten Organisationen und Projekte sind keine weiteren administrativen Schritte notwendig, um mit der Vergabe von Canonical URLs beginnen zu können. Eine OID müsste hingegen zunächst bei einem Register beantragt werden. 

* URLs können nicht nur als Name eines Artefaktes verwendet werden, sondern auch als Adresse, unter der Informationen zu dem jeweiligen Artefakt, bzw. dessen Spezifikation bereitgestellt werden können. 

### Auflösbarkeit von Canonicals 

Zwar besteht weder eine Notwendigkeit noch eine Verpflichtung, dass Canonicals auflösbar sein müssen, es gilt aber dennoch als BestPractice, unter der jeweiligen URL die Spezifikation des Artefaktes verfügbar zu machen, siehe z.B. http://hl7.org/fhir/ValueSet/data-absent-reason 

Dies kann mit Hilfe eines Redirects umgesetzt werden, sofern der Name des Artefaktes nicht mit dem Ort der Publikation übereinstimmt. 

Beispiel: Die Canonical http://fhir.de/StructureDefinition/seitenlokalisation wird automatisch weitergeleitet auf https://simplifier.net/packages/de.basisprofil.r4/1.5.0-ballot2/files/2367671 wo die aktuelle Spezifikation dieser Extension publiziert ist. 


 

 

 