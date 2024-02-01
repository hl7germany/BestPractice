## {{page-title}}
Bei der Erstellung von Profilen sollten folgende grundsätzlichen Regeln beachtet werden um zu einer vollständig, verständlich und nachvollziehbar dokumentierten Spezifikation zu gelangen:

* in `StructureDefinition.description` sollte eine ausführliche Beschreibung des Profils angegeben werden.
* Hinweise, die nur für die Autoren, aber nicht für die Nutzer einer Spezifikation relevant sind, können als Kommentarzeilen im Quellcode angegeben werden.

Für alle Elemente, die mit Constraints versehen wurden, gilt:
* in `ElementDefinition.short` sollte die im jeweiligen UseCase gebräuchliche Bezeichnung für die Information (evtl. auch übereinstimmend mit deren Bezeichnung im Informationsmodell) angegeben werden.
* in `ElementDefinition.comment` sollte eine Begründung für die auf diesem Element geltenden Constraints angegeben werden.

Beispiel in FSH:
```
* birthDate
  * ^short = "Geburtsdatum"
  * ^comment = "Pflichtfeld gem. §199a SGB V"
//ToDo: Prüfen, unter welchen Bedingungen die birthtime-Extension benötigt wird.
```

Im IG Template von HL7 Deutschland werden die genannten Elemente automatisch im Dokument angezeigt und für den Anwender gut sichtbar dargestellt.