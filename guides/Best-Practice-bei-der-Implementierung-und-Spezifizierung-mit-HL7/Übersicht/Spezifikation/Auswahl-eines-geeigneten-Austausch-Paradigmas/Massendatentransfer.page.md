## {{page-title}}

**Typische Kriterien:** 
* Anforderung von großen Datenmengen (z.B. auf Populationsebene) 
* asynchrone Kommunikation 
* Export von (Fall-/Patienten)Akten 
* Exporte auf Systemebene (Archivierung/Migration) 

**Geeignetes Paradigma: FHIR Bulk Data** 

mögliche Protokolle: 

* Starten des Exportes mittels Operation (HTTP(s)) 
* Bereitstellung des Exportes als Datei (ndJSON) zum Download

Payload: 
* Beliebige FHIR-Ressourcen im ndJSON-Format 