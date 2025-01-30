{{page-title}}

MustSupport-Flags dienen dazu, Implementierern die für einen konkreten UseCase relevanten Elemente aufzuzeigen.
Die Kennzeichnung relevanter Elemente mittels MustSupport im Sinne einer Positiv-Liste ist aus Interoperabilitätsgründen gegenüber dem Verbot von Elementen mittels Kardinalitäts-Begrenzung im Sinne einer einer Negativ-Liste vorzuziehen!

Die Semantik von MustSupport ist im FHIR-Standard nicht erschöpfend definiert und kann an die Bedürfnisse einzelner Anwendungsfälle angepasst werden.
Spezifikationen, die MustSupport-Flags verwenden, sind daher angehalten, die Erwartungen an die Impementierer im Leitfaden zu präzisieren.
Mögliche Facetten der Semantik von MustSupport sind z.B.:
* das Element muss gefüllt werden, sofern die Information im sendenden System bekannt ist
* das Element muss in ein empfangendes System übernommen werden können
* das Element muss bei einem erneuten Abruf vom empfangenden System reproduziert werden können
* das Element muss dem Anwender angezeigt werden
* das Element muss vom Anwender editiert werden können

Bei der Verwendung von MustSupport-Flags in der Profilierung sind folgende Aspekte und Best Practices zu berücksichtigen:
* abgeleitete Profile können MustSupport-Flags nicht mehr entfernen, lediglich weitere Elemente kennzeichnen. Dies muss bei der Spezifikation bedacht werden, wenn es absehbar ist, dass abgeleitete Profile benötigt werden.
* MustSupport Flags sollten auf allenen Ebenen der Baumstruktur konsistent verwendet werden. Das bedeutet dass
  * ein Kind Element nur gekennzeichnet werden sollte, wenn auch das Parent-Element ein MustSupport-Flag hat.
  * ein Parent-Element nur gekennzeichnet werden sollte, wenn mindesten ein Kind-Element als MustSupport gekennzeichnet wird und konkret spezifiziert werden kann, welche Kind-Elemente MustSupport sind.  
* der Grund, weshalb ein Element als MustSupport gekennzeichnet wurde, sollte möglichst in `ElementDefinition.comment` dargelegt werden.

**Wichtiger Hinweis:**
Die korrekte Implementierung von MustSupport Flags kann nicht durch Validierung überprüft werden. 
Für Konformitätstests sind daher darüber hinaus gehende Verfahren erforderlich, abhängig von der Semantik der MustSupport-Flags.
