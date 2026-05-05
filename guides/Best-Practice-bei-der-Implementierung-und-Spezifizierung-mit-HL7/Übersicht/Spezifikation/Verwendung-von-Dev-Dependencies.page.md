{{page}}

Bei DevDependencies handelt es sich um ein Feature aus der npm-Kernspezifikation: [Specifying dependencies and devDependencies in a package.json file | npm Docs](https://docs.npmjs.com/specifying-dependencies-and-devdependencies-in-a-package-json-file/).

DevDependencies können verwendet werden, um andere FHIR-Packages für die Erstellung eines ImplementationGuides zur Verfügung zu haben (z.B. für die Validierung) ohne die Spezifikation an das Package zu binden.
Dies wird häufig verwendet, um Verknüpfungen zu Terminologien herzustellen, bei denen nicht an eine konkrete Version gebunden werden soll.
Um Beispieldaten gegen die zum Zeitpunkt der Publikation geltende Version der Terminologie validieren zu können, wird eine DevDependency auf das entsprechende Package hinzugefügt. 
Es obliegt jedoch den Nutzern der Spezifikation, dieses Package durch die jeweils aktuelle Version dieses Packages zu ersetzen.

