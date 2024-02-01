## {{page-title}}

Die ImplementationGuide-Ressource enthält Markdown- bzw. HTML-Seiten, die alle technischen Anforderungen in eine menschenlesbare Form bringen im Quellformat und verknüpft sie mit der maschinenlesbaren Spezifikation (dem Package). 

Auf Basis der ImplementationGuide-Ressource erstellen Tools wie Simplifier oder der IG Publisher den Implementierungsleitfaden, der als Webseite publiziert werden kann. 

### Was ist der Unterschied zwischen einem ImplementationGuide und einem Implementierungsleitfaden?
Der `ImplementationGuide` ist eine Resource aus dem FHIR Conformance Framework (einer Gruppierung von verschiedenen Ressourcentypen, die im Kontext der Erstellung von FHIR-basierten Spezifikationen benötigt werden), also ein strukturiertes, maschinenlesbares Objekt, das wie jede andere FHIR-Ressource wahlweise in XML oder JSON serialisiert werden kann. Es dient dazu, die Einzelteile, die einen Implementierungsleitfaden ausmachen (HTML-Webseiten mit Erläuterungstexten und darin eingebetteten Grafiken, Beispieldaten, Profile, ValueSets, Extensions …) zu einem Paket zu verschnüren, zu publizieren und zwischen verschiedenen Tools und Systemen austauschbar zu machen. 

Für humanoide Konsumenten einer Spezifikation ist die ImplementationGuide-Ressource in der Regel uninteressant. Selbige wollen das HTML-Dokument in seiner menschenlesbaren Form betrachten können, nicht die maschinenlesbare Auflistung seiner Einzelteile.

Während im Englischen höchstens die Anordnung der Majuskeln zur Unterscheidung von ersterem, dem „ImplementationGuide“ und letzterem, dem „implementation guide“ herangezogen werden kann, hat es sich hierzulande etabliert, die Ressource bei ihrem englischen Namen zu nennen, jedoch das HTML-Dokument zu „(Implementierungs-)Leitfaden“ zu übersetzen.
Schwierig wird es, wenn man mit hartgesottenen FHIR-Nerds spricht, die aus ökonomischen Gründen beides unter dem Akronym „IG“ zusammenfalten.

CAVE: Auf Simplifier, einer beliebten Plattform zur Erstellung und Publikation von FHIR-Spezifikationen, findet man in einem Projekt einerseits einen „ImplementationGuide“ im Tab „Resources“, andererseits aber auch das gerenderte Dokument als HTML-Seite(n) im Tab „Guides“!