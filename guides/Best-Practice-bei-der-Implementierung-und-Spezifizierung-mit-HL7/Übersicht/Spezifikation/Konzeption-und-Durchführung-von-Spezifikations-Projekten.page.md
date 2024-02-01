## {{page-title}}

Dieses Kapitel beschreibt, wie eine Organisation, Institution oder Firma vorgehen sollte, um auf Basis von FHIR eine möglichst interoperable Spezifikation zu erstellen. 
 

### Schritt 1: Festlegung von Motivation und Scope 

Die Motivation für das Projekte sollte sowohl für Beteiligte als auch für Außenstehende verständlich dargelegt werden. Die Grenzen dessen, was Bestandteil des Projektes ist und was nicht, oder erst in späteren Iterationen spezifiziert wird sollten klar formuliert werden. 

Dabei sind folgende Fragen zu beantworten: 
* Welches Problem soll die Spezifikation lösen? 
* Welche bestehenden Prozesse sollen durch die Spezifikation abgelöst/ergänzt/verbessert werden?

 

### Schritt 2: Identifikation von Stakeholdern 

Bei der Spezifikation sollten die Interessen von Personen und Organisationen, die später an der Implementierung und der Anwendung der Spezifikation beteiligt sind, berücksichtigt werden. 

Es sollte von Beginn an klar definiert und kommuniziert werden, auf welchem Wege man sich an der Erarbeitung der Spezifikation durch Mitwirkung bzw. Kommentierung beteiligen kann. 

Dabei sind folgende Fragen zu beantworten: 
* Wer soll die Spezifikation später implementieren? 
* Wer sind die Anwender dieser Implementierungen? 
* Wessen Arbeitsabläufe werden durch die Spezifikation beeinflusst? 
* Welche Nachnutzungsszenarien gibt es für die erhobenen Daten? 

 

### Schritt 3: Ankündigung 

Die Erarbeitung sollte mit allen zuvor erhobenen Informationen über ein geeignet Medium  angekündigt werden und/oder durch gezieltes Anschreiben von Interessensgruppen so kommuniziert werden, dass sichergestellt ist, dass alle interessierten Personen und Organisationen Kenntnis von der Initiative haben.

Dabei sind folgende Fragen zu beantworten: 
* Wie können die Initiatoren des Projektes kontaktiert werden? 
* Wo kann der aktuelle Stand der Spezifikation öffentlich eingesehen werden? 
* Welche Möglichkeiten der Mitwirkung gibt es? 
* Auf welchem Wege können Kommentare eingereicht werden? 

 

### Schritt 4: Erarbeiten der fachlichen Anforderungen und Rahmenbedingung 

Als erste inhaltliche Arbeit an der Spezifikation sollten die fachlichen Anforderungen und die gesetzlichen, regulatorischen und datenschutzrechtlichen Rahmenbedingungen erhoben werden. 

Bestandteil der fachlichen Anforderungen kann es sein, ein relevantes, vorhandenes Informationsmodell zu identifizieren oder ein neues Informationsmodell zu erstellen. 

Obwohl bei diesem Schritt noch keine Festlegungen auf Basis von FHIR getroffen werden und die Festlegungen überwiegend von Domänenexpert:innen erarbeitet werden müssen, sollten die technischen Möglichkeiten, Grundprinzipien und Modelle des Standards hier bereits berücksichtigt werden, um später bei der Umsetzung in FHIR nicht auf unüberwindbare Diskrepanzen zu stoßen. Es ist daher empfehlenswert, bereits an diesem Punkt  FHIR-Experten miteinzubeziehen. 

Dabei sind folgende Fragen zu beantworten: 
* Welche fachlichen Anforderungen sind zu berücksichtigen? 
* Welche existierenden Informationsmodelle können angewendet werden? 
* Welche Informationsmodelle müssen erarbeitet werden? 
* Welche Terminologien sind geeignet? 
* Welche gesetzlichen oder datenschutzrechtlichen Rahmenbedingungen sind zu beachten? 

 

### Schritt 5: Abgleich mit nationalen und internationalen Spezifikationen 

Bevor die Spezifikation in die Umsetzung geht, sollte geprüft werden, welche nationalen und internationalen Spezifikationen mit dem definierten Scope ganz oder teilweise überlappen und welche Artefakte aus anderen Spezifikationen wiederverwendet werden können. Besonderes Augenmerk sollte bereits existierenden Spezifikationen gelten, die von den gleichen Systemen bereits implementiert werden müssen, da hier besonderen Wert auf Interoperabilität und Wiederverwendbarkeit gelegt werden muss. 

Wenn relevante Spezifikationen identifiziert wurden, sollte Kontakt zu den Autoren aufgenommen werden, um Rückfragen schnell und unbürokratisch klären zu können. Einzelthemen und Fragen sollten im regelmäßigen Austausch mit der Deutschen und internationalen FHIR-Community über den FHIR-Chat geklärt werden. 

Festlegungen, die im Rahmen dieser Spezifikation getroffen werden, aber darüber hinaus von nationaler Relevanz sind, müssen frühzeitig beim Technischen Komitee für FHIR von HL7 Deutschland eingereicht werden. 

Dabei sind folgende Fragen zu beantworten: 
* Welche internationalen Spezifikationen (z.B. von HL7 oder IHE) sind relevant? 
* Welche Vorgaben aus nationalen Profilen (Deutsche Basisprofile) müssen berücksichtigt werden? 
* Welche weiteren Spezifikationen (z.B. ISiK, MIOs, eRezept...) müssen von den selben Systemen unterstützt werden? 

 

### Schritt 6: Abstimmungsverfahren 

Wenn die Spezifikation einen stabilen Arbeitsstand erreicht hat, der zur Implementierung (z.B. im Rahmen von Testtools, Connectathons, prototypischen Systemen) geeignet ist, sollte eine Abstimmung nach den Regeln von HL7 bzw. der herausgebenden Stelle, sofern diese einen gesetzlichen Auftrag hat, durchgeführt werden. 

Das Abstimmungsverfahren gibt allen Beteiligten und Betroffenen nochmal die Möglichkeit, ihre Zustimmung zu signalisieren oder die Spezifikation mit begründeter Kritik abzulehnen. 

Nach der erfolgreichen Abstimmung kann die Spezifikation mit dem Status "Standard for Trial Use (STU)" publiziert werden. 

Dabei sind folgende Fragen zu beantworten: 
* Ist die Spezifikation vollständig und stabil genug um darauf basierend erste Implementierungen erstellen zu können? 
* Erfüllt die Spezifikation die Qualitätsrichtlinien sowie die Best Practice-Empfehlungen des Technischen Komitees für FHIR von HL7 Deutschland? 
* Findet die Spezifikation die Zustimmung aller betroffenen Personen und Organisationen? 
* Kann bei ablehnender Kritik ein geeigneter Kompromiss gefunden werden, der für alle Parteien tragbar ist? 

 

### Schritt 7: Implementierung und Test 

In dieser Phase beginnen die ersten Implementierer mit der Umsetzung der Spezifikation. Hier ist mit einem vermehrten Auftreten von APARs (Appearing Problems after Release) zu rechnen, was oft eine rasche Veröffentlichung von Technical Corrections erfordert. 

In der Frühphase von Implementierung und Test ist die Durchführung von einem oder mehreren sog. "Connectathons" hilfreich, wo sich Entwickler und Spezifizierer im Rahmen einer Veranstaltung treffen, um prototypische Implementierungen zu testen, Probleme zu identifizieren und unmittelbar zu lösen und Unklarheiten zu beseitigen. 

Die Ansprechpartner für die Spezifikation sollten für die Entwickler transparent und niederschwellig für Rückfragen zur Verfügung stehen, z.B. durch Nutzung des [FHIR-Chats](http://chat.fhir.org). Gemeldete Probleme, sowie deren Bearbeitungsstand sollten für alle Entwickler sichtbar sein (z.B. in einem Service-Portal, Jira, GitHub Issues, o.ä.)

Solange sich die Spezifikation im Status "STU" befindet, können aufgrund von Entwicklerfeedback und Problemen bei der Umsetzung auch noch nicht-kompatible Änderungen an der Spezifikation erforderlich werden. In solchen Fällen sollte eine erneute Abstimmung durchgeführt werden. 

Dabei sind folgende Fragen zu beantworten: 
* Gibt es geeignete Plattformen, auf denen Entwickler untereinander bzw. mit den Spezifikateuren in den Austausch treten können? 
* Werden gemeldete Probleme transparent genug erfasst, so dass diese für alle Entwickler sichtbar sind und Doppelmeldungen vermieden werden können? 
* Können Technical Corrections zeitnah publiziert und an die Entwickler in geeigneter Form distribuiert werden? 

 

### Schritt 8: Produktivbetrieb 

Erst wenn die Spezifikationen vollständig implementiert und die Implementierungen deployed wurden, zeigt sich, ob die in Schritt 1 identifizierten Probleme adäquat gelöst werden können. Auch in dieser Phase sind Technical Corrections und nicht-kompatible Änderungen aufgrund von angetroffenen Problemen bei der Nutzung eventuell notwendig.  

Allerdings sind in dieser Phase längere Umsetzungsfristen und klare Übergangregelungen zu treffen, um Versionskonflikte im laufenden Betrieb zu verhindern. Es können mehrere Abstimmungsverfahren und weitere STU Versionen erforderlich sein, bis alle Probleme im Produktivbetrieb zufriedenstellend gelöst sind. 

### Schritt 9: Normative Abstimmung und Weiterentwicklung 

Sofern eine Spezifikation vollumfänglich von mehreren verschiedenen Herstellern erfolgreich implementiert und von Anwendern unter produktiven Bedingungen genutzt wurde, kann eine normative Abstimmung angestrebt werden. Dies ist jedoch nur zu empfehlen, wenn sichergestellt ist, dass sich die Anforderungen und Rahmenbedingungen auf absehbare Zeit nicht ändern werden. Ist eine Spezifikation einmal normativ publiziert, sind keine nicht-kompatiblen Änderungen mehr möglich! 

Unabhängig von der Entscheidung, ob eine normative Veröffentlichung angestrebt wird, muss spätestens in dieser Phase sichergestellt werden, dass die langfristige Pflege und Weiterentwicklung der Spezifikation sowohl finanziell als auch personell gewährleistet werden kann. 

 