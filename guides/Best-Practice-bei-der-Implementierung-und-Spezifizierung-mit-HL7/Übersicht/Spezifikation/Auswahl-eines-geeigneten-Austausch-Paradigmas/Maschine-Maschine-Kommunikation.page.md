## {{page-title}}

### 
**Typische Kriterien:** 
* Die kommunizierenden Systeme stehen in einer Server-Server-Relation (beides datenhaltende Systeme) 
* Es handelt sich um einen gerichteten Versand 
* Es sind keine menschlichen Benutzer in die Kommunikation involviert (Zusammenstellung/Versand und Empfang/Weiterverarbeitung passieren vollautomatisch) 
* Die Systeme stehen nicht in permanentem Austausch 
* Die Daten müssen ggf. vom Sender signiert werden 
* Es ist ggf. kein Handshake-Protokoll möglich, weshalb Metadaten zu sendendem und empfangenden System in den Daten enthalten sein müssen (z.B. Filetransfer) 

**Geeignetes Paradigma: Messaging**

mögliche Protokolle zum Nachrichten-Transfer:

* HTTP(s) (Messaging-Endpoint) 
* Attachment an KIM gemäß [App-Transport-Frameworks](https://simplifier.net/app-transport-framework)
* TCP/IP oder Filetransfer, analaog HL7 V2 (nur wenn's gar nicht anders geht)

Payload: 
* Bundle-Ressource vom Typ "message" 
