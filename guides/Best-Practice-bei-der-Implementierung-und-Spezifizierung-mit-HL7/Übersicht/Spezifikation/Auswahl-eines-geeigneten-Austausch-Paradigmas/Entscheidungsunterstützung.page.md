## Entscheidungsunterstützung (Anwenderaktion triggert Client/Service) 
**Typische Kriterien:**
* Benutzeraktion im Primärsystem triggert einen Dienst 
* Kontextdaten zur Benutzerinteraktion werden an Dienst übergeben 
* Dienst gibt Handlungsempfehlung / Warnung / Hinweis zur Integration in die UI der aufrufenden Applikation zurück 
* Beispielsweise: Verordnung eines Medikamentes triggert ein Arzneimittelwechselwirkungssystem, das ggf. eine Warnung erzeugt 

**Geeignetes Paradigma: CDS-Hooks**