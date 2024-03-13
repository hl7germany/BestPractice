## {{page-title}}

Dieses Kapitel soll eine Hilfestellung für die Unterscheidung und Abgrenzung der beiden Paradigmen ["Structured Documents"](http://hl7.org/fhir/documents.html) und "Questionnaires"/["Structured Data Capture"](https://build.fhir.org/ig/HL7/sdc/) bieten.

Zunächst bedienen beide Paradigmen den UseCase, strukturierten Daten in Form eines Dokumentes (abgeschlossene, vollständige, signierbare Aggregation von Informationen) abzubilden. Die Abgrenzung zwischen einem strukturierten Dokument und einem Formular/Questionnaire ist im alltäglichen Sprachgebrauch schwer zu fassen, die entsprechenden Umsetzungen in FHIR haben aber klare Vor- und Nachteile, die eine Entscheidung für das eine oder andere Paradigma erleichtern können.

### Structured Documents
Die Erstellung eines strukturierten Dokumentes in FHIR sieht vor, dass vorhandene Informationsobjekte/Ressourcen von einem Anwender zu einem Dokument aggregiert und darin angeordnet werden. Dazu wird eine Composition-Ressource erstellt, die die Dokumenten-Metadaten (u.a. Art des Dokumentes, Autor, Datum der Erstellung) enthält und eine frei vom Benutzer gewählte oder durch den Dokumenttyp vorbestimmte Struktur vorgibt (sog. "Sections", die das Dokument in Kapitel untergliedern, z.B. bei einem Entlassbrief "Anamnese", "Epikrise", "Entlassmedikation", "Empfehlungen zur Weiterbehandlung).

Der Inhalt der jeweiligen Sections besteht wahlweise aus HTML-basiertem Freitext ("Narrative") oder aus Referenzen auf die im System des Autors (z.B. PVS/KIS) bereits vorhandenen Informationsobjekte (z.B. Diagnosen, Prozeduren, Medikationen), die den strukturierten Inhalt dieser Sections darstellen. Der Narrativ (die menschenlesbare Version) solcher Sections wird in diesem Fall automatisch aus den strukturierten Daten erzeugt. (Beachte hierzu die Anmerkungen im Kapitel "menschenlesbare Repräsentation" weiter unten).

Um von einer fertig "komponierten" Composition zu einem verkehrsfähigen Dokument (signierbar, unveränderlich, vollständig, abgeschlossen) zu kommen, wird zum Zeitpunkt der Fertigstellung eine Bundle-Ressource erstellt, die eine Kopie der Composition sowie aller darin referenzierten Ressourcen enthält. Der Lebenszyklus des Dokumentes ist damit von den Arbeitsdaten im System des Anwenders entkoppelt.

Dieses Paradigma ist empfehlenswert wenn folgende Vorbedingungen ganz oder teilweise gegeben sind:
* dem Anwender soll ein gewisses Maß an Freiraum bei der Gestaltung des Dokumentes gelassen werden (Auswahl von Art und Umfang der Informationen, alternativer oder ergänzender Freitext)
* die Vorgaben bezüglich der Dokumentenstruktur sind eher grob gefasst und verändern sich im zeitlichen Verlauf wenig
* die für das Dokument benötigten strukturierten Ressourcen liegen im System des Autors (z.B. KIS/PVS) bereits vollständig und in geeigneter Form vor (z.B. nativ als FHIR-Ressourcen oder über eine API/Fassade als solche verfügbar)
* die vorhandenen Ressourcen können unverändert in das Dokument übernommen werden
* es ist davon auszugehen, dass nachgeodnete Prozesse beim Empfänger des Dokumentes, die strukturierten Daten daraus extrahieren und *unabhängig* vom Dokumentenkontext weiterverarbeiten möchten (z.B. Übernahme von Diagnose- und Medikationsdaten in die Patientenakte des Empfängers)
* ein vergleichsweise hohes Datenvolumen ist unproblematisch (z.B. nicht durch Bandbreite beim Transport, Kapazität von Speichermedien begrenzt etc.)

### Structured Data Capture
Im Gegensatz zu den strukturierten Dokumenten steht beim Questionnaire/Formular-basierten Ansatz die strukturierte Erfassung von Daten durch einen Anwender im Vordergrund.

Während Structured Documents keine Annahme darüber machen, auf welche Art und Weise die benötigten Daten ursprünglich erhoben wurden bzw. in das System des Autors gelangen, stellen Questionnaires sicher, dass Daten über Systeme und Hersteller hinweg in gleicher Qualität erhoben werden, da die Darstellung der Erfassungsmasken mittels Questionnaires standardisiert und austauschbar gemacht wird.

Die Spezifikation "Structures Data Capture (SDC)" sorgt für die nahtlose Integration von Formularen in die Systeme sowohl des Senders als auch des Empfängers von Formulardaten.

SDC spezifiziert unter anderem, wie Formularfelder mit maschinenlesbaren Anweisungen für die Quellsysteme annotiert werden können, so dass in den Systemen bereits vorhandene Informationen automatisch vorbelegt werden können. (Verhinderung redundanter Datenerfassung)
Außerdem erlaubt SDC die Annotation mit Anweisungen, wie aus den im Formular erhobenen Daten eigenständige, unabhängig vom Formuarkontext weiterverarbeitbare Ressourcen extrahiert werden können.

Übliche Anforderungen an Dokumente (Signierbarkeit, Vollständigkeit, Unveränderbarkeit, Abschlossenheit) können bei Questionnaires in gleicher Weise sichergestellt werden, wie bei strukturierten Dokumenten.

Dieses Paradigma ist empfahlenswert wenn folgende Vorbedingungen ganz oder teilweise gegeben sind:
* die Struktur des Dokumentes ist fest vorgegeben, nicht nur in Form von Kapiteln sondern bis hin zu einzelnen Elementen der strukturierten Daten. Der Anwender hat wenig bis keinen Gestaltungsfreiraum. Viele Informationen werden codiert und mit begrenzen Wertemengen (Auswahllisten) oder als ja/nein-Informationen erhoben. Freitextangaben sind in ihrem Umfang begrenzt und meist auf eine konkrete Fragestellung bezogen.
* die fachlichen Vorgaben an die Dokumentstruktur sind sehr rigide definiert und lassen sich nicht ohne weiteres (nicht ohne zahlreiche Extensions) auf FHIR-Ressourcen mappen. Die exakte Abbildung der lokalen Vorgaben hat Priorität über die internationale Kommunizierbarkeit der Informationen.
* es kann *nicht* davon ausgegangen werden, dass alle erforderlichen strukturierten Daten in den Systemen das Autors bereits vorhanden bzw. in geeigneter Form (z.B. in geeigneter Granularität und Codierung) vorhanden sind. Ein Teil der Daten muss ggf. vom Anwender zum Zeitpunkt der Dokumenterstellung eingegeben, ergänzt oder qualifiziert werden.
* die Leistungsfähigkeit und der Systeme, die das Dokument erstellen müssen und der Umfang der darin zur Verfügung stehenden Breite und Tiefe an Daten, ist je nach Produkt/Hersteller/Konfiguration/Nutzung sehr unterschiedlich.
* die Vorgaben der Struktur können sich im zeitlichen Verlauf rasch ändern und Änderungen sollten schnell und ohne großen Aufwand/Kosten in den Systemen umsetzbar sein.
* vorhandene Ressourcen aus den Quellsystemen können meist nicht unverändert in das Dokument übernommen werden, da datenschutzrechtliche Rahmenbedingungen dies verhindern (z.B. das Gebot der Datensparsamkeit). Dies trifft besonders häufig bei der einrichtungsübergreifenden Kommunikation und der Datenmeldung an Register zu.
* die Weiterverarbeitung beim Empfänger erfolgt überwiegend im Dokumentenkontext (z.B. Vergleich mit oder quantitative Analyse von Daten aus identisch strukturierten Dokumenten). Dies trifft besonders häufig auf die Datenverarbeitung in klinischen Studien oder Registern zu. Eine Weiternutzung von Daten außerhalb des Dokumentenkontextes betrifft wenn, dann nur eine Teilmenge der übermittelten Information.
* das Datenvolumen für die Übermittlung/Speicherung soll möglichst gering sein, die Datenstrukturen sollen möglichst einfach sein. (besonders relevant für Implementierungen im mobilen Umfeld und die Massendatenverarbeitung)
* es ist relevant, dass die Daten nicht nur in gleicher Struktur übermittelt sondern auch in gleicher Qualität erhoben werden.

### Weitere zu berücksichtigende Aspekte

#### Kompatibilität

Die Verwendung von Strukturierten Dokumenten anstelle von Formularen in Kontexten, wo sehr enge Vorgaben bis auf Element-Ebene insbesondere vor dem Hintergrund der Datensparsamkeit gemacht werden müssen, hat in Deutschland zu der Problematik einer Vielzahl von restriktiven und dadurch inkompatiblen Profilen geführt.

Die Stärke des (SDC-)Questionnaire-Ansatzes liegt in der "separation of concerns". Während die Quellsysteme nur noch dafür sorgen müssen, möglichst viel Informationen für die automatische Vorbefüllung von Questionnaires über eine FHIR-API verfügbar zu machen, sorgen die maschinenlesbaren Regeln in den Questionnaires für die gezielte Auswahl der für einen konkreten Dokumentenkontext benötigten Daten. Quellsyteme können zum Beispiel mit der Bereistellung *einer* umfassenden Patient-Ressource viele verschiedene restriktive (auch untereinander inkompatible!) Formulardefinitionen bedienen, ohne Änderungen an der Struktur der Ressource und damit am Programmcode vornehmen zu müssen.
 
Der Nachteil des Questionnaire-Ansatzes besteht darin, dass wenn beim Design eines Questionnaires die Strukturen der FHIR-Ressourcen, die als Quelle für die Vorbelegung bzw. als Ziel der Extraktion dienen, nicht von Anfang an berücksichtigt werden, eine proprietäre Datenstruktur entstehen kann, deren Wiederverwendbarkeit in und Vergleichbarkeit mit anderen Kontexten nicht gewährleistet ist.

Ohne adäquate Annotationen der Formularfelder für die automatische Vorbelegung und geeingete APIs in den Quellsystemen zur Bereitstellung der benötigten FHIR-Ressourcen verursachen Questionnairs im schlimmsten Fall eine komplett redundante Datenerfassung.

#### generisches Tooling

Tools, die Questionnaire-Ressourcen in ausfüllbare Benuzeroberflächen konvertieren und für die automatische Vorbefüllung sorgen, können generisch implementiert werden. Bei Änderungen vorhandener Formulardefinitionen, bzw. der Nutzung neuer Formulardefinitionen sind dann keine Änderungen am Code mehr erforderlich. Die Tools werden lediglich mit Hilfe von Questionnaire-Ressourcen konfiguriert. 
Dabei ist jedoch zu beachten, dass eine korrekte, robuste und Feature-vollständige Implementierung eines solchen sog. "Questionnaire-Renderers" durchaus aufwendig und teuer ist, insbesondere wenn dabei auch Funktionalitäten für die automatische Datenvorbelegung und die Datenextraktion berücksichtigt werden sollen. In der FHIR-Community stehen jedoch bereits mehrere OpenSource-Implementierungen zur Verfügung, die angepasst und in vorhandene Systeme integriert werden können.

#### Innovationszyklen

Neue bzw. geänderte Anforderungen für die Bereitstellung von strukturierten Daten für Register, Studien, Qualitätssicherung, Reporting, in der ePA, intersektorale Kommunikation usw. können mit Hilfe generischer Questionnaire-Renderer theoretisch ohne Änderungen an der Implementierung der Quellsysteme bedient werden.

Das worst case Szenario wäre hier lediglich, dass eine neue Formulardefinition Daten für die automatische Vorbelegung benötigt, die vom Quellsystem noch nicht über eine FHIR-API bereitgestellt werden können und daher vom Anwender zunächst manuell erfasst werden müssten. Ungeachtet dessen könnte das neue Formular innerhalb kürzester Zeit und bei minimalstem Aufwand und Kosten im Quellsystem bereitgestellt, zur Anzeige gebracht und vom Anwender ausgefüllt werden. Die Bereitstellung valider und vollständiger strukturierter Daten wäre ohne zeitlichen Verzug möglich. Notwendige Weiterentwicklungen der FHIR-API im Quellsystem, um zusätzliche Daten für die automatische Vorbelegung bereitzustellen, können über die normalen Release-Zyklen des Herstellers nachgeliefert werden.

#### Datenvolumen und Komplexität

Ein signifikanter Vorteil des formularbasierten Ansatzes ist die erhebliche Reduktion des Datenvolumens. Da die Definition und semantische Annotation der Formularfelder im Questionnaire erfolgt, die Datenerfassung- und Kommunikation jedoch in einer Questionnaire-Response, die im einfachsten Fall nur noch aus Key-Value-Paaren besteht (ID des Formularfeldes + erhobenem Wert), reduziert sich das Volumen im Vergleich zu der Aggregation duzender eigenständiger, selbsttragender, vollständig mit Metadaten und Kontext annotierter FHIR-Ressourcen zu einem strukturierten Dokument massiv. Auch die Komplexität kann erheblich reduziert werden: Während ein ausgefülltes Formular im einfachsten Fall aus einer einzigen Ressource (QuestionnaireResponse) besteht, kommt ein patientenbezogenes strukturiertes Dokument mit nicht weniger als drei untereinander verlinkten und ineinander verschachtelten Ressourcen (Bundle, Composition, Patient) aus.

#### menschenlesbare Repräsentation

Grundsätzlich sollte sich die menschenlesbare Darstellung von strukturierten Dokumenten und QuestionnaireResponses in der Komplexität kaum unterscheiden. Während in ersterem Falle die HTML-Narrative der Composition (der "Dokumentenkopf") und der einzelnen Sections (entweder HTML-formatierter Freitext oder automatisch generierte HTML-Repräsentationen der strukturierten Daten) konkateniert und ggf. mit einem im Bundle enthaltenen Stylesheet gerendert werden muss, sollten die Items einer QuestionnaireResponse als verschachtelte Liste von Fragestellung + gegebener Antwort gleichermaßen mit wenig Aufwand visualisierbar sein.

Da jedoch insbesondere die in Deutschland derzeit spezifizierten strukturierten Dokumente überwiegend *keine* Narrative enthalten, bzw. diese nicht verpflichtend vorsehen, ist die Visualisierung hier ungleich komplexer, da die verschiedenen Sections der Dokumente eine Vielzahl unterschiedlich profilierter Ressourcen enthalten können, die wiederum über Polymorphismen und Optionalitäten verfügen, die zur Erzeugung einer vollständigen Darstellung alle berücksichtigt/implementiert werden müssen.
Insbesondere einfachen Systeme, deren UseCase lediglich die Anzeige stukturierter Dokumente erfordert, wird damit die Teilhabe an der Kommunikation schwer gemacht.







