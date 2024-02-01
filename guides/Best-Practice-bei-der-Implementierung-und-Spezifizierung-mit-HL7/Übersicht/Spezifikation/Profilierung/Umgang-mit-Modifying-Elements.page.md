## {{page-title}}

Elemente, die in der FHIR-Spezifikation als `modifying` gekennzeichnet sind (?!-Flag), sollten nach Möglichkeit in einem Profil genauer spezifiziert werden, um Entwicklern den Umgang mit solchen Elementen zu erleichtern. Dies kann beispielsweise erreicht werden indem die Elemente 
  * als MustSupport-Elemente gekennzeichnet werden und/oder
  * als Pflichtfelder deklariert werden und/oder
  * auf nicht-modifizierende Werte begrenzt werden oder
  * mit einer Begründung versehen werden, warum das modifying Element im konkreten UseCase keine modifizierende Wirkung hat und bei der Implementierung nicht als solches betrachtet werden muss oder
  * durch Einschränkung der maximalen Kardinalität verboten werden. 

***Begründung:** Entweder muss sichergestellt sein, dass alle beteiligten Systeme die Semantik des Elementes verstehen und korrekt implementieren (mustSupport) oder es muss sichergestellt sein, dass in diesen Elementen keine modifizierenden Informationen übermittelt werden. Wenn keine weiteren Constraints auf optionale, modifizierende Elemente angelegt werden können, so sollte in der Dokumentation explizit darauf aufmerksam gemacht werden, dass diese aufgrund ihrer modifizierenden Wirkung dennoch unbedingt beachtet werden müssen. Dies wird bei der Implementierung leider häufig übersehen. Beispiel: Patient.deceased mag weder Pflichtfeld noch mustSupport-Element sein, muss aufgrund seiner modifizierenden Eigenschaft aber dennoch beachtet werden. AllergyIntolerance.verificationStatus mag optional und nicht mustSupport sein, Implementierungen müssen dennoch richtig reagieren, wenn der Wert "entered-in-error" übermittelt wird.*