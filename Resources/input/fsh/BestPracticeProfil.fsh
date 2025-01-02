Profile: BestPracticeProfil
Parent: StructureDefinition
Definition: "Dieses Profil prüft die Umsetzung der 
im Best Practice Guide von HL7 Deutschland beschriebenen Empfehlungen
bei der Erstellung von Profilen"
* url 1..1 MS
  * ^comment = "Wird im Profil-Template unter 'Metadaten' angezeigt"
* status 1..1 MS  
  * ^comment = "Wird im Profil-Template unter 'Metadaten' angezeigt"
* version 1..1 MS  
  * ^comment = "Wird im Profil-Template unter 'Metadaten' angezeigt"
* baseDefinition 1..1 MS
  * ^comment = "Wird im Profil-Template unter 'Metadaten' angezeigt"
* description 1..1 MS
  * ^comment = "Wird im Profil-Template unter 'Inhalt' im Tab 'Beschreibung' dargestellt" 
* differential  
  * element
    * mustSupport MS  
      * ^comment = "Elemente, die für die Spezifikation relevant sind, MÜSSEN als `mustSupport` gekennzeichnet werden."
    * short 1..1 MS
      * ^comment = "Für relevante Elemente SOLLTE eine Kurzbezeichnung angegeben werden, die geeignet ist,
      um in textuellen Beschreibungen auf das Element Bezug zu nehmen."
    * comment 1..1 MS
      * ^comment = "Constraints auf Elementen SOLLTEN im Kommentar-Feld begründet werden.  
      Kommentare zu Elementen, die als `mustSupport` gekennzeichnet sind, werden im Profil-Template unter 'Inhalt' im Tab ' Beschreibung' ausgegeben."     