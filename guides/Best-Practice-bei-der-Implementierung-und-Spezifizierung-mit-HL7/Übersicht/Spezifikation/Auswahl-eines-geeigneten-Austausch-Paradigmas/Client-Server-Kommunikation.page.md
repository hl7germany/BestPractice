## Client-Server-Kommunikation (Interaktion auf Patientenebene)

Der RESTful Ansatz ist das grundlegende Paradigma, um das herum FHIR entstanden ist. Nur in Verbindung mit einer RESTful API können daher die Features von FHIR optimal genutzt werden. 

Die kommunizierenden Systeme stehen in einer Client-Server-Relation zueinander (Server: datenhaltendes, primäres System, Client: datenkonsumierendes bzw. datenlieferndes Subsystem) 

**Typische Kriterien:** 
* Clients verfügen oft über keine eigene Datenhaltung (ggf. nur Caching von häufig/zuletzt verwendeten Daten, Offline-Funktion) 
* Der Client initialisiert die Kommunikation (Query-getrieben) 
* Es wird eine synchrone Kommunikation gewünscht (Anwender wartet auf Antwort) 
* Der Server ist jederzeit erreichbar/verfügbar (Clients können jederzeit weitere benötigte Informationen bei Bedarf abfragen) 
* Die Systeme sollen sich unabhängig voneinander weiterentwickeln können, Updates erfolgen häufig und unregelmäßig. 
* Clients sind verschiedenartig, häufig hochspezialisiert und nutzen oft nur einen kleinen Teil der vom Server bereitgestellten Funktionen 
* Es existiert ein übergreifendes Benutzerkonzept (Anwender des Clients ist dem Server bekannt). 

#### Variante 1: PULL (Client initialisiert die Kommunikation) 

**Geeignetes Paradigma: RESTful API** 

Die RESTful API kann bei Bedarf ergänzt werden mit
* Operations 
* Subscriptions 
* Messaging-Endpoint 
* Document-Endpoint 

#### Variante 2:PUSH (Server initialisiert die Kommunikation) 

**Geeignetes Paradigma: Subscriptions** 