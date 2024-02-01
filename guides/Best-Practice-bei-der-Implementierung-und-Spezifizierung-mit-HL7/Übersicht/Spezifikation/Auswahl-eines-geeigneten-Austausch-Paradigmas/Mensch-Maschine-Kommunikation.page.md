## Mensch-Maschine-Kommunikation (Datenerfassung/-Eingabe durch Anwender) 
**Typische Kriterien:** 
* Die zu kommunizierenden Daten sind nicht oder nur teilweise bereits im sendenden System vorhanden und müssen zunächst durch den Anwender erfasst/ergänzt werden 
* Eine einheitliche Erhebung der Daten (vergleichbare UI, identische Erläuterungen für den Anwender) über mehrere verschiedene implementierende Systeme hinweg, ist von hoher Bedeutung 
* Die Daten sollen ggf. auch mit mobilen Endgeräten erhoben werden können 
* Bei der Spezifikation handelt es sich um die Ablösung bestehender, formularbasierter Prozesse, die ohne große Änderung der Abläufe bzw. Datenmodelle digitalisiert werden sollen 
* Aufgrund von datenschutzrechtlichen Rahmenbedingungen darf nur ein Ausschnitt der in den Primärsystemen ggf. bereits vorhandenen Datenobjekten übermittelt werden (z. B. Patientenstammdaten wie Name und Geburtsdatum aber ohne Adresse, Telefonnummer) 
* Die Daten werden oft nur zwischen anderen gleichartigen Erhebungen verglichen und statistisch ausgewertet. Eine Weiternutzung der Daten in anderen Kontexten ist nicht oder nur teilweise erforderlich.  
* Häufig wird aus den erfassten Informationen ein Gesamtscore ermittelt und nur dieser weiterverwendet. 

**Geeignetes Paradigma: Questionnaire / QuestionnaireResponse in Verbindung mit SDC (Structured Data Capture)**

Die Questionnaire-Extensions im [SDC-Implementierungsleitfaden](https://build.fhir.org/ig/HL7/sdc/) ermöglichen es unter anderem:
* Items zur Extraktion zu annotieren, so dass die über ein Formular erhobenen Daten auch außerhalb des Formularkontextes wiederverwendet und z.B. über die REST-ful API verfügbar gemacht werden können.
* Items zur automatischen Vorbelegung ("Prepopulation") zu annotieren um Daten, die in den Systemen bereits vorhanden sind, über die REST-ful API zu ermitteln und redundante Datenerfassung zu verhindern.
* Items mit Scores zu annotieren und die Gesamtscores von QuestionnaireResponses zu ermitteln.

<img src="https://wiki.hl7.de/images/thumb/Attention_icon.svg/100px-Attention_icon.svg.png" alt="achtung" width="50" style="margin:0px 20px" align="left"/>
<b>Um die Kompatibilität von Questionnaires zu anderen FHIR-Implementierungen zu gewährleisten, sollten die SDC-Funktionalitäten zur Prepopulation und Extraction bei allen Projekten von Anfang an mitbedacht werden!</b>
<p>

mögliche Protokolle für den Formulardaten-Transfer:
* HTTP(s) QuestionnaireResponse-Endpoint oder Transaction-Endpoint 
* KIM/TIM, wobei hier sichergestellt werden muss, dass Sender und Empfänger Kenntnis über bzw. Zugriff auf die gleichen Questionnaire-Definitionen haben, da Verlinkung hier ggf. nicht funktioniert.

Payload: 
* QuestionnaireResponse-Ressource oder Transaction-Bundle 

