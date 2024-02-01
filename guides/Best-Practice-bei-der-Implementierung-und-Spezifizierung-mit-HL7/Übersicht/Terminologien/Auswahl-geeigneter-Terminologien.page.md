## Best Practice {{page-title}}

### ...für die Verwendung von *bestehenden* Terminologien in FHIR-Spezifikationen

* Externe Terminologien nutzen: Wenn möglich, sollten externe Terminologien genutzt werden, um auf bereits etablierte und standardisierte Code-Systeme zurückzugreifen. 

* Temporäre Codes markieren: Falls vorübergehende FHIR-Codes für vorläufige oder experimentelle Zwecke definiert werden, sollte deutlich gekennzeichnet werden, dass es sich um temporäre Codes handelt, um Missverständnisse zu vermeiden. 

* Berücksichtigung der Implementierenden: Bei der Auswahl von Terminologien, die fortgeschrittene Funktionen wie Subsumption, Post-Koordination oder Value-Set-Erweiterungen nutzen, sollte berücksichtigt werden, ob die Implementierenden diese Funktionen unterstützt und angemessen einsetzen kann. 

* Es ist nicht gestattet, "required" oder "extensible" Bindungen zu Terminologien zu erstellen, die in dem Implementierungsbereich nicht "frei zur Verwendung" sind. Beispielsweise ist SNOMED CT in US-IGs akzeptabel, jedoch nicht in internationalen IGs, es sei denn, SNOMED hat eine allgemeine Lizenz für die freie Verwendung dieser Codes erteilt. 

* Vorsicht bei "required bindings": Bei "required bindings" sollte darauf geachtet werden, dass immer alternative Werte (z.B. "other") vorgesehen sind, um sicherzustellen, dass eine Instanz trotzdem versendet werden kann, selbst wenn kein spezifischer Code verfügbar ist. 

* Vorsicht bei "extensible bindings": Falls ein ValueSet eines extensible Bindings kein kein passendes Konzept enthält, ist eine Kodierung mit beliebigen CodeSystemen gestattet. Dies bedeutet in der Praxis, dass ein extensible binding nicht maschinell validiert werden kann, und somit technisch einem preferred binding entspricht. 

* "Preferred bindings" für Interoperabilität: Wenn Interoperabilität für ein Element wichtig ist, sollte zumindest eine "preferred binding" definiert werden, um eine gewisse Flexibilität zu gewährleisten. 

* Abwägung der "Binding"-Strategie: Die Entscheidung, ob Bindings an eine Version der Terminologie gebunden oder unbeschränkt sein sollten, sollte sorgfältig abgewogen werden. Eine Versionsspezifität gewährleistet Stabilität, erfordert jedoch eine neue Version der IGs für Aktualisierungen, während eine unbeschränkte Bindung flexibler ist, jedoch potenziell weniger stabil. 

* Vermeidung von OIDs: Es wird empfohlen, keine OIDs (Objekt-Identifikatoren) zur Identifizierung von Codesystemen oder Identifikatoren zu verwenden, da sie schlecht lesbar sind, Fehler begünstigen und das Debuggen erschweren. Stattdessen sollten verständliche und leicht zugängliche Identifikatoren verwendet werden. 

* Einhaltung von Standard-URLs: Wenn FHIR eine standardisierte URL für ein bestimmtes Codesystem oder einen Identifikatortyp definiert hat, sollte diese verwendet werden, anstatt alternative Identifikatoren wie v3-OIDs zu verwenden. 

 

### ...für die Erstellung *neuer* Terminologien und CodeSystems sowie ValueSets in FHIR-Spezifikationen: 

* Verwendung etablierter Standards: Wenn möglich, sollten bestehende, etablierte Standards und Terminologiesysteme für die Erstellung neuer Code-Systeme und Value Sets genutzt werden. Nur wenn dies ausschließlich nicht möglich ist, sollten neue Terminologien erstellt werden. 

* Standardisierte Namensgebung: Es sollte eine konsistente und aussagekräftige Namensgebung für neue Terminologien, Code-Systeme und Value-Sets verwendet werden, um deren Zweck und Inhalt klar zu kommunizieren. Dies beinhaltet insbesondere stilistische Guidelines wie die Verwendung von "-" oder "_" in Namen und Vorgaben bezüglich der Großschreibung. 

* Klar definierte Konzepte: Es sollte sichergestellt werden, dass die Konzepte in den Terminologien und Code-Systemen klar definiert und gut dokumentiert sind. Eine eindeutige Beschreibung und Definition der Bedeutung jedes Konzepts ist entscheidend, um Missverständnisse zu vermeiden. 

* Berücksichtigung von Subsumption: Wenn ein neues Code-System oder Value-Set Subsumption unterstützen soll, sollten die Hierarchien und Beziehungen zwischen den Konzepten angemessen definiert werden. Dies ermöglicht eine präzisere semantische Beziehung zwischen den Codes und erleichtert die Suche und Analyse der Daten. 

* Aktualisierung und Versionskontrolle: Von Anfang an muss eine geeignete Aktualisierungs- und Versionskontrollstrategie für neue Terminologien und Code-Systeme erarbeitet werden. Es müssen klare Prozesse und Richtlinien für zukünftige Aktualisierungen definiert werden, um eine konsistente und nachverfolgbare Entwicklung sicherzustellen. Dies beinhaltet insbesondere die feste Vorgabe von Releasezyklen und den Umgang mit Breaking Changes. 

* Eindeutige Identifikation von Konzepten: Identifizierende Elemente sollten eindeutig und standardisiert sein. Beispielsweise sollten URIs (Uniform Resource Identifiers) oder andere gängige Standards zur Identifizierung von Code-Systemen und Value Sets verwendet werden. 

* Verwendung von Standardisierungswerkzeugen: Es sollten spezialisierte Werkzeuge und Standards zur Erstellung und Verwaltung von Terminologien, Code-Systemen und Value Sets verwendet werden. Hierzu gehören zum Beispiel Terminologieserver oder Terminologiedesignwerkzeuge, die eine effiziente Verwaltung und Wartung ermöglichen. Auch abstraktes FHIR Tooling wie SUSHI und FSH eignet sich für die Erstellung und Wartung. 

* Involvierung der Fachgemeinschaft: Bei der Erstellung neuer Terminologien und Code-Systeme sollten Fachexperten und die betroffene Fachgemeinschaft mit einbezogen werden. Ein multidisziplinärer Ansatz und Feedback aus der Praxis helfen dabei, relevante und praxistaugliche Terminologien zu entwickeln. 

* Dokumentation und Metadaten: Für neue Terminologien und Code-Systeme sollten umfassende Dokumentation und Metadaten vorhanden sein. Dazu gehören Informationen wie Autor, Erstellungsdatum, Zweck, Anwendungsgebiet und ggf. Lizenzbedingungen. 

* Berücksichtigung von Internationalisierung: Wenn die erstellten Terminologien und Code-Systeme international verwendet werden sollen, ist es wichtig, dass die Terminologien mehrsprachig unterstützt werden und international akzeptierte Standards für die Darstellung von Begriffen und Codes verwendet werden. 