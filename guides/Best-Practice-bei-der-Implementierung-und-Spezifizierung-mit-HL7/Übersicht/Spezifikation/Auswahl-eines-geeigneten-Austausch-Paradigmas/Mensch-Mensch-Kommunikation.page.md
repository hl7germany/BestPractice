## Mensch-Mensch-Kommunikation (von strukturierten und/oder unstrukturierten Daten)
**Typische Kriterien:** 
* Die übermittelten Daten werden im sendenden System von einem Menschen kuratiert/ausgewählt, ggf. mit unstrukturierten Informationen (Anrede, ergänzende/erläuternde Hinweise, Empfehlungen) ergänzt. 
* Die Daten müssen ggf. vom Autor signiert werden 
* Die Daten müssen vom Empfänger in der kommunizierten Form archiviert werden (Nachweispflicht). 
* Die Daten müssen beim Empfänger zunächst nur dem Anwender angezeigt werden können. Eine Übernahme von strukturierten Daten in das empfangende System ist nicht zwingend gewünscht/erforderlich. 
* Die Übernahme von Daten im empfangenden System kann partiell sein (allgemeinmedizinischen PVS übernimmt nur allgemeine medizinische Daten aus einem hochspezialisierten kardiologischen Befund) und kann ggf. vom Anwender gesteuert werden (manuelle Auswahl der Daten, die übernommen werden sollen). 

**Geeignetes Paradigma: Documents**

siehe auch {{pagelink:Übersicht/Spezifikation/Auswahl-eines-geeigneten-Austausch-Paradigmas/Dokumente-vs-Formulare.page.md}}

mögliche Protokolle zum Dokumenten-Transfer: 
* HTTP(s) (Document-Endpoint) 
* IHE-MHDS
* IHE-MHD als Fassade vor IHE-XDS 
* IHE-XDS nativ (nicht ideal, da IHE MHD im FHIR-Kontext kompatibler ist, aber oft unumgänglich, z.B. bei der Kommunikation mit der ePA des Patienten) 
* Filetransfer (wenn's gar nicht anders geht)
* Attachment an eMail (meistens keine gute Idee, wegen fehlender Verschlüsselung)
* Attachment an KIM (Hier ist Vorsicht geboten: Wenn auf Empfängerseite eine automatisierte Verarbeitung erfolgen soll, handelt es sich im eine Maschine-Maschine-Kommunikation, die den Spezifikationen des [App-Transport-Frameworks](https://simplifier.net/app-transport-framework) der Gematik folgen sollte!)

Payload: 
* Bundle-Ressource vom Typ "document" 
