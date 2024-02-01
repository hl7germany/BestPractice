## {{page-title}}


Das Package stellt eine Sammlung der maschinenlesbaren Anteile einer Spezifikation dar. Publizierte Packages werden in einer [zentralen Registry](https://registry.fhir.org/) bereitgestellt, wo sie für verschiedene Tools (z.B. FHIR-Server, Validatoren) auffindbar sind und einfach heruntergeladen und installiert werden können. Dbai folgen FHIR Packages dem weit verbreiteten [Node Package Manager (NPM) Standard](https://docs.npmjs.com/about-npm). Packages können Abhängigkeiten untereinander haben, wenn in Spezifikationen maschinenlesbare Artefakte aus anderen Spezifikationen wiederverwendet werden. So haben z.B. die meisten in Deutschland publizierten Packages eine Dependency auf das Package, das die Deutschen Basisprofile enthält. 

Packages können niemals geändert oder gelöscht werden. Ein einmal publiziertes Package (das in der Regel ein Release einer Spezifikation darstellt) kann höchstens mit dem Status "deprecated" versehen und durch ein neueres Package ersetzt werden. Es verbleibt jedoch in der Registry. Dies gibt den Autoren von Spezifikationen, die Artefakte anderer Autoren verwenden, die Sicherheit, dass Änderungen an der fremden Spezifikation keine Auswirkungen auf ihre eigene Spezifikation haben. Autoren können selbst entscheiden, wann Sie die verwendeten Artefakte durch das Einbinden eines neueren Packages aktualisieren möchten. 

Details:
* https://registry.fhir.org/learn