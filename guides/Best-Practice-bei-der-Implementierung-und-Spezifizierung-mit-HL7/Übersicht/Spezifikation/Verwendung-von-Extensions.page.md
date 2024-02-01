## Best Practice {{page-title}}

* Vor der Festlegung einer eigenen Extension MUSS genau geprüft werden, ob nicht vorhandene Elemente der Kernspezifikation genutzt werden können. 

* Häufig finden sich die fehlenden Elemente in einer referenzierbaren Ressource. Ebenso sollte die Liste der in der Kernspezifikation für die jeweilige Ressource, bzw. den jeweiligen Datentyp und für Element geprüft werden, ob bereits eine geeignete Extension definiert wurde.  

* Im Zweifel sollte die internationale Community zu Rate gezogen werden. 

* Vor der Festlegung einer Extension MUSS genau geprüft werden, ob nicht bereits eine entsprechende Festlegung in den Deutschen Basisprofilen getroffen wurde. 

* Im Zweifel sollte die deutsche Community bzw. das Technische Komitee für FHIR bei HL7 Deutschland e.V. zu Rate gezogen werden. 

* Wenn eine Extension außerhalb der Spezifikation, in deren Kontext sie definiert wurde, wiederverwendbar sein soll, dann muss für codierte Werte in Betracht gezogen werden, dass andere Use Cases ggf. abweichende Terminologien verwenden.  

* Im Zweifel sollte der Datentyp CodeableConcept anstelle von code oder Coding verwendet werden. Weiterhin sollten die verschiedenen Kontexte, in denen die Extension nützlich sein könnte, von Anfang an mitbedacht und zugelassen werden, auch wenn diese in der aktuellen Spezifikation nicht genutzt werden, um die Wiederverwendbarkeit der Extension zu gewährleisten.

weitere Hinweise siehe https://build.fhir.org/ig/FHIR/ig-guidance/best-practice.html#extensions 