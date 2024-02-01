## {{page-title}}


<img src="https://wiki.hl7.de/images/thumb/Attention_icon.svg/100px-Attention_icon.svg.png" alt="achtung" width="50" style="margin:0px 20px" align="left"/>
<b>Eine nachträgliche Änderung von name, url und package name führt zu breaking changes, die vermieden werden sollten, sobald sich eine Spezifikation in der Implementierungsphase befindet!</b>

## Metadaten definitorischer Artefakte

Definitorische FHIR-Ressourcen (z.B. StructureDefinition, OperationDefinition, CapabilityStatement, SearchParameter, ValueSet etc) verfügen über harmonisierte Metadaten. 
Da die korrekte Verwendung dieser Metadaten teilweise Auswirkungen auf das Verhalten und die Stabilität von Tools (z.B. Validatoren) haben kann, empfiehlt sich eine sorgfältige und konsequente Pflege der folgenden Elemente:

### id
Die id des Artefaktes sollte stets vorhanden sein und identisch mit `name` gesetzt werden.

***Begründung:** 
Artefakte ohne IDs lösen im Simplifier Quality Control eine Warnung, im IG Publisher einen Fehler aus.
Die maximal erlaubte Länge von 64 Zeichen muss beachtet werden.*

***Tipp:** Tools wie SUSHI verwenden `name` eines Artefaktes um daraus automatisch die `id` und `canonical` zu generieren. In diesem Fall muss `id` nicht manuell gesetzt werden.*

### url
Oft als "Canonical URL" bezeichnet: Weltweit eindeutiger, technischer Name des Artefaktes. Wird verwendet, um systemübergreifend auf ein Artefakt, unabhängig von dessen Speicherort, Bezug nehmen zu können. Canonical URLs müssen nicht zwangsläufig auflösen, es gilt jedoch als Best Practice, spätestens zum Zeitpunkt der Publikation einer Spezifikation dafür zu sorgen, dass alle CanonicalURLs zu der Spezifikation/Dokumentation des jeweiligen Artefaktes auflösen. Dass dies am Einfachsten über einen  Redirect zu der Plattform, auf der sie Spezifikation publiziert wurde (z.B. Simplifier), gelöst werden kann, sollte bei der Gestaltung der URLs von Anfang an mit bedacht werden.

Folgende Empfehlungen sollten bei der Auswahl von Canonical URLs berücksichtigt werden:
* Alle URLs einer Spezifikation sollten nach dem selben Schema erstellt werden, z.B.: 
`[org]/[project]/[version]/[type]/[name]`, mit
  * `[org]` = Domäne der herausgebenden Organisation, z.B. "http://meine-domaene.de", "http://hl7.org". Für einer einfacherer Organisation der Redirects kann es hilfreich sein, einen gemeinsamen Pfad für alle FHIR-Artefakte zu verwenden, z.B. in dem der Pfad "/fhir/" an die Domäne angehängt oder eine Subdomäne verwendet wird z.B. "http://fhir.meine-domaene.de"
  * `[project]` = Projektname der Spezifikation (kann weggelassen werden, wenn es nur eine einzige organisationsweite Spezifikation gibt)
  * `[version]` = Hauptversion der Spezifikation (sollte  gesetzt werden, wenn mehrere Versionen der Spezifikation parallel betrieben werden müssen und wenn breaking changes zwischen verschiedenen Hauptversionen zu erwarten sind, kann weggelassen werden, wenn künftige Versionen stets abwärtskopatibel bleiben), z.B. "V2" 
  * `[type]` = Name des Ressourcentyps des Artefakte, z.B. "StructureDefinition", "ValueSet" etc.
  CAVE: Bei Ressourcen vom Typ "NamingSystem" sollte hier der internationalen Praxis gefolgt werden, anstelle des Ressourcentyps das Kürzel "sid" zu verwenden, da die Bezeichnung eines NamingSystems streng genommen keine Canonical URL, sondern eine uniqueID darstellt.
  * `[name]` = siehe Kapitel "name"
* In Extensions sind keine Breaking Changes erlaubt! Ein Breaking Change in einer Extension *muss* eine Änderung der Canonical URL zur Folge haben!

#### versionierte Canonical-Referenzen

Um Referenzen auf definitorische Artfakte versionsstabil zu setzen gibt es zwei Möglichkeiten: 
1. Die Änderung der canonical mit Hilfe eines `/[version]/`-Pfades. Dies führt jedoch zu Breaking Changes in jedem Release, auch wenn die Artefakte inhaltlich kompatibel wären.
2. Die Referenzierung mit Hilfe einer pipe-separierten Kombination aus Canoncial und Version des Artefaktes.
Die Verwendung der Pipe-Notation ist jedoch beim Verweis auf Extensions nicht gestattet. Breaking Changes in Extensions müssen daher immer einer Änderung der URL zu Folge haben!
Die Verwendung der Pipe-Notation in `meta.profile`kann von manchen Validatoren nicht interpretiert werden und führt zu Fehlermeldungen.

### name
Oft als "Computer friendly name" bezeichnet: Muss innerhalb eines Projektes eindeutig sein und einen prägnanten, lesbaren Namen für das Artefakt enthalten. Empfehlenswert ist es, stets der UpperCamelCase-Schreibweise zu folgen. Wenn name und id identisch gewählt werden sollen, muss die für ids maximal erlaubte Länge von 64 Zeichen beachtet werden.

***Begründung:** 
Tools wie SUSHI verwenden den Namen eines Artefaktes um daraus automatisch die `id` und `canonical` zu generieren. Der `name` sollte daher unter Berücksichtigung der Konventionen aller dieser Elemente gewählt werden. Eine konsequente CamelCase-Schreibweise erfüllt diese Bedingung.*

#### Differenzierung Namen mittels Suffixen
Die Festlegung eines projektweit eindeutigen Namens kann bei manchen Artefakten herausfordernd sein, weil diese semantisch das gleiche ausdrücken, z.B. bei CodeSystem und ValueSet, LogicalModel und Profil, Extension und SearchParameter

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

## Packages
### package name
Der Package-Name sollte nach folgendem Schema gewählt werden:

`[top level domain].[second level domain].[projektname]`

z.B.:
de.gematik.isik

### package version
Version des Packages in SemVer-Syntax:
`[major].[minor].[patch]`







