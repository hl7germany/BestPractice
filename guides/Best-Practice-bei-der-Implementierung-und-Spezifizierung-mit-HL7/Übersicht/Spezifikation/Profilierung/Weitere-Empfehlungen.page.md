## {{page-title}}

### Umgang mit UCUM-Annotations ("curly-brace-notation")
Bei der Verwendung von UCUM-Einheiten in `Quantity`-Datentypen sollten keine Annotationen verwendet werden (vgl. https://ucum.org/ucum 2.4 Style §12 "curly braces"). Der anzuzeigende Text sollte stattdessen in `Quantity.unit` geschrieben werden.

***Begründung:** Die Annotationen der UCUM-Spezifikation wurden unter der Annahme spezifiziert, dass bei der Nutzung der Codes nicht zwischen der maschinenlesbaren und der menschenlesbaren Repräsentation des Codes differenziert werden kann. In FHIR ist dies jedoch möglich (Menschenlesbare Repräsentation der Maßeinheit in `Quantity.unit`, maschinenlesbare Repräsentation in `Quantity.code`). UCUM-Annotationen sind daher im Kontext von FHIR redundant.*

#### Beispiel

UCUM-Notation: /g{wet'tis}

Statt in FHIR die codierte Einheit mitsamt der Annotation in `Quantity.code` zu schreiben, sollten Code und Anntoation separiert werden:
```
<code value="/g"/>
<unit value="per gram of wet tissue"/>
```
Analog sollte die dimensionslose Einheit "Punkte" nicht als 1{Punkte} notiert werden, sondern als
```
<code value="1"/>
<unit value="Punkte"/>
```

### Umgang mit Target-Profilen im Datentyp `Reference`
Bei der Profilierung des Datentyps `Reference` sollte - wo möglich - auf die Verwendung von Target-Profilen verzichtet werden. 

***Begründung:** Im Kontext einer Spezifikation mag es zwar sinnvoll sein, auszudrücken, dass beispielsweise eine konforme Observation nur auf einen konformen Patienten verweisen darf, jedoch verhindert diese Festlegung die Wiederverwendung des Observation-Profils in anderen Kontexten. Klinische Profile aus Spezifikationen wie z.B. US Core oder International Patient Summary konnten daher in der Vergangenheit trotz identischer fachlicher Anforderungen nicht wiederverwendet werden, weil die Constraints der dort referenzierten Patienten- oder Practitioner-Profile nicht übereinstimmten.
Das Weglassen von Target-Profilen hingegen hat meist keine negativen Konsequenzen, da davon ausgegangen werden kann, dass Systeme, die das Observation-Profil einer Spezifikation implementieren auch erfordern, dass die Patienten-Ressourcen konform zur selben Spezifikation sind. Bei Konformitäts-Tests werden üblicherweise beide Profile unabhänig voneinander getestet (Systeme müssen nachweisen, dass sowohl ihre Observation- als auch ihre Patienten-Ressourcen konform sind), eine indirekte Prüfung der Konformität von Patienten-Ressourcen über die Observation wäre unüblich.*


### Weitere Hinweise
Weitere Hinweise von HL7 International siehe: https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html#profiles 