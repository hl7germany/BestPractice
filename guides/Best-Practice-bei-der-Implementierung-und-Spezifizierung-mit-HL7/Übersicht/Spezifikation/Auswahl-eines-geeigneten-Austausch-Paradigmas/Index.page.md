Die FHIR-Spezifikation macht keine verbindlichen Vorgaben bezüglich der Methode und des Protokolls über das FHIR-Ressourcen zwischen Systemen ausgetauscht werden sollen. Obgleich der Standard vor dem Hintergrund einer REST-basierten Kommunikation entwicklet wurde, sind auch andere Formen des Datenaustauschs, einschließlich proprietärer Protokolle erlaubt.

Damit soll gewährleistet werden, dass FHIR in allen Umgebungen (auch z.B. innerhalb bestehender nationaler Infrastrukturen) genutzt werden kann.

Die Festlegung des für einen konkreten UseCase am besten geeigneten Paradigmas unter Berücksichtigung aller Rahmenbedingungen gehört mit zu den wichtigsten Entscheidungen bei der Erstellung eines Implementierungsleitfadens.

Die folgende Beschreibung typischer Kommunikationsszenarien soll als Orientierung dienen, um das **aus technischer Sicht** am besten geeignete Paradigma zu finden.

Dazu sollten die Kriterien aller Szenarien betrachtet werden und dasjenige ausgewählt werden, dessen Kriterien am ehesten auf einen UseCase zutreffen. Diese Entscheidung mag nicht immer eindeutig ausfallen. Oft überwiegen auch andere Betrachtungen als die technische Eignung, wie zum Beispiel die Frage, auf welche exisiterende Infrastruktur zurückgegriffen werden kann.



Nicht selten mag sich herausstellen, dass die dokumentenbasierte Kommunikation über die ePA oder das Messaging via KIM zwar aus technischer Sicht suboptimal aber dennoch alternativlos sind, weil sie die einzige aktuell verfügbaren Kommunikationswege darstellen. 

## Best Practice...
{{index:current}}