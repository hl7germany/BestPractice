## {{page-title}}

Definitorische FHIR-Ressourcen (z.B. StructureDefinition, OperationDefinition, CapabilityStatement, SearchParameter, ValueSet etc) verfügen über harmonisierte Metadaten. 
Da die korrekte Verwendung dieser Metadaten teilweise Auswirkungen auf das Verhalten und die Stabilität von Tools (z.B. Validatoren) haben kann, empfiehlt sich eine sorgfältige und konsequente Pflege der folgenden Elemente:

### id
Die id des Artefaktes sollte stets vorhanden sein und identisch mit `name` gesetzt werden.

***Begründung:** 
Artefakte ohne IDs lösen im Simplifier Quality Control eine Warnung, im IG Publisher einen Fehler aus.
Die maximal erlaubte Länge von 64 Zeichen muss beachtet werden.*

***Tipp:** Tools wie SUSHI verwenden `name` eines Artefaktes um daraus automatisch die `id` und `canonical` zu generieren. In diesem Fall muss `id` nicht manuell gesetzt werden.*

### url
Oft als "Canonical URL" bezeichnet: Weltweit eindeutiger, technischer Name des Artefaktes. Wird verwendet, um systemübergreifend auf ein Artefakt, unabhängig von dessen Speicherort, Bezug nehmen zu können. 
Weitere Hinweise siehe 
* {{pagelink:CanonicalBedeutung}}
* {{pagelink:CanonicalBestPractice}}

### name
Oft als "Computer friendly name" bezeichnet: Muss innerhalb eines Projektes eindeutig sein und einen prägnanten, lesbaren Namen für das Artefakt enthalten. Empfehlenswert ist es, stets der UpperCamelCase-Schreibweise zu folgen. Wenn name und id identisch gewählt werden sollen, muss die für ids maximal erlaubte Länge von 64 Zeichen beachtet werden.

***Begründung:** 
Tools wie SUSHI verwenden den Namen eines Artefaktes um daraus automatisch die `id` und `canonical` zu generieren. Der `name` sollte daher unter Berücksichtigung der Konventionen aller dieser Elemente gewählt werden. Eine konsequente CamelCase-Schreibweise erfüllt diese Bedingung.*

***Tipp:** Differenzierung Namen mittels Suffixen  
Die Festlegung eines projektweit eindeutigen Namens kann bei manchen Artefakten herausfordernd sein, weil diese semantisch das gleiche ausdrücken, z.B. bei CodeSystem und ValueSet, LogicalModel und Profil, Extension und SearchParameter.*

Verhindert werden kann dies - wo sinnvoll und notwendig - beispielsweise durch die Verwendung von Suffixes, z.B.
* ValueSets: <UpperCamelCaseName>VS
* CodeSystems: <UpperCamelCaseName>CS
* Extension: <UpperCamelCaseName>EX
* SearchParameter: <UpperCamelCaseName>SP

Weiter mögliche Suffixe:
* PR: StructureDefinition (Profile) 
* EX: StructureDefinition (Extension) 
* DT: StructureDefinition (DataType)
* LM: Logical Model 
* VS: ValueSet 
* CS: CodeSystem 
* CM: ConceptMap 
* SM: StructureMap 
* NS: NamingSystem 
* SP: SearchParameter 
* CPS: CapabilityStatement 
* OD: OperationDefinition 
* IG: ImplementationGuide 
* EXA: Example


### version
Versionsnummer der Ressource in semVer-Syntax. Sollte mit der Versionsnummer der Packages übereinstimmen, in dem das Artefakt publiziert wird.

Begründung: Beim Parallelbetrieb mehrerer Versionen ist es nicht mehr/schwer möglich, das Artefakt einem Package-Kontext zuzuordnen. Eine separate semantisch korrrekte Versionierung jedes einzelnen Artefaktes erhöht darüber hinaus den Pflegeaufwand einer Spezifikation massiv.

Terminologien, die unabhängig von einer Spezifikation weiterentwickelt werden und daher in Ihren Versionen abweichen, sollten in separaten Packages publiziert und als Dependency in eine Spezifikation eingebunden werden.

### title
Oft als "Human friendly name" bezeichnet: Unterliegt im Gegensatz zu `name` keinen Beschränkungen und sollte die bestmögliche Auffindbarkeit des Artefaktes in einer Benutzeroberfläche gewährleisten. Wird in UIs (z.B in Simplifier) anstelle von `name` zur Anzeige verwendet. Der `title` sollte Projektweit eindeutig gewählt werden.



