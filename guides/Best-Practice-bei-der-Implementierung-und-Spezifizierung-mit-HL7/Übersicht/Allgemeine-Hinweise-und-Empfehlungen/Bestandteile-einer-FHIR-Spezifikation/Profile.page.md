## {{page-title}}

Ein Profil beschreibt in maschinenlesbarer Form (mittels einer StructureDefinition-Ressource), welche technischen Constraints für die Nutzung eines Ressourcentyps (z.B. Patient, Observation, Condition) bzw. eines Datentyps (z.B. Address, HumanName, Quantity) in einer konkreten Spezifikation gelten. 

Solche Constraints umfassen unter anderem: 

* Beschränkung der maximalen oder minimalen Kardinalität (Festlegung von Pflichtfeldern) 
* Kennzeichnung der für die Spezifikation relevanten Elemente (MustSupport-Flags) 
* Auswahl erforderlicher Extensions 
* Definition von Regeln, die eine Ressourcen-Instanz befolgen muss (Invarianten) 

Weiterhin können Profile genutzt werden, um die Bedeutung und Verwendung einzelner Elemente textuell zu erläutern und zu kommentieren. 

Profile verweisen stets auf eine Basisdefinition (z.B. einen FHIR-Ressourcentyp) auf den die Constraints angewendet werden. Neben den FHIR Ressourcen- und Datentypen könne auch bereits existierende Profile als Basis genutzt und weiter eingeschränkt werden. Man spricht in diesem Fall von "abgeleiteten Profilen". Das Ableiten von Profilen hat den Vorteil, dass Instanzen, die gegen abgeleitete Profile valide sind, stets auch gegen das Profil, von dem abgeleitet wurde, validieren. Wer also sicherstellen möchte, dass die eigene Spezifikation vollständig kompatibel mit einer bereits existierenden Spezifikation bleibt, sollte das Erstellen abgeleiteter Profile in Betracht ziehen. 

Profile können die Constraints ihrer Basisdefinition weiter einschränken, jedoch niemals auflösen/lockern. Wo eine Basisdefinition zum Beispiel die Kardinalität 0..1 vorschreibt, kann in einem Profil zwar die minimale Kardinalität auf 1 angehoben, die maximale Kardinalität kann jedoch nicht weiter erhöht werden. Selbst das Hinzufügen einer Extension entspricht aus technischer Betrachtung heraus einem Constraint, da die Eigenschaft aller FHIR-Basisdefinitionen, an beliebiger Stelle mit beliebig vielen Extensions beliebiger Art erweiterbar zu sein, durch das Konkretisieren einer dieser beliebigen Extensions eingeschränkt wird. 

### Was ist der Unterschied zwischen einem Implementierungsleitfaden und einem Profil?
Antwort 1: Es ist das gleiche!

Im Kontext von IHE-Spezifikationen meint der Begriff „Profil“ das Dokument, das beschreibt, wie ein internationaler Standard für einen bestimmten UseCase „profiliert“ wurde, also den Implementierungsleitfaden.

Antwort 2: Es ist nicht das gleiche!

Im Kontext von FHIR versteht man unter einem „Profil“ die Summe der Contraints, die beschreiben, wie ein konkreter FHIR-Ressourcentyp (z.B: "Condition") in einem konkreten Kontext (z.B. beim Datenaustausch zwischen Systemen in einem Krankenhaus) verwendet werden soll. In diesem Leitfaden wird der Begriff gemäß der FHIR-Definition verwendet.