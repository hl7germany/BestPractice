## Best Practice {{page-title}}

### ...für die Verwendung von Terminologien in Spezifikationen

Bei der Verwendung von Terminologien in FHIR stellt die Kombination aus Coding.system und Coding.code allein keine hinreichend stabile Referenz auf die semantische Bedeutung eines Codes dar. In realen Terminologiesystemen existieren typischerweise mehrere Versionen unter derselben canonical URL, wobei sich Inhalte, Hierarchien, Designations oder die Gültigkeit einzelner Konzepte zwischen den Releases verändern können. Ohne eine explizite Versionsangabe hängt die Interpretation eines Codes somit implizit vom Terminologiestand des verarbeitenden Systems ab.

In verteilten, lose gekoppelten Systemlandschaften – wie sie im Gesundheitswesen üblich sind – ist diese implizite Annahme nicht tragfähig. Unterschiedliche Systeme arbeiten häufig mit unterschiedlichen Terminologiereleases, verfügen nicht immer über Zugriff auf zentrale Terminologieserver oder müssen Terminologien lokal und zeitversetzt aktualisieren. Darüber hinaus müssen medizinische Daten über lange Zeiträume hinweg konsistent interpretierbar bleiben, auch wenn sich die zugrunde liegenden Terminologien weiterentwickeln.

Vor diesem Hintergrund wird empfohlen, die Versionsinformation (Coding.version) konsequent und verpflichtend zu verwenden und die Kardinalität auf 1..1 festzulegen. Nur durch die explizite Angabe der verwendeten Terminologieversion wird sichergestellt, dass die semantische Bedeutung eines Codes eindeutig und reproduzierbar ist – unabhängig von Zeitpunkt, Systemumgebung oder Infrastrukturzustand. Die Verwendung von Coding.version ermöglicht insbesondere:

* die eindeutige Referenzierung eines konkreten Terminologiestands,
* die reproduzierbare Validierung von Instanzen über die Zeit hinweg,
* die konsistente Interpretation historischer Datenbestände,
* die transparente Analyse von Abweichungen zwischen unterschiedlichen Systemständen,
* sowie die gezielte Durchführung von Migrationen oder Mappings zwischen Terminologieversionen.

Eine alleinige Bindung an versionierte ValueSets ist hierfür nicht ausreichend, da ValueSets einen eigenen Lebenszyklus besitzen und nicht zwingend die Version der zugrunde liegenden CodeSysteme eindeutig festlegen. Die Versionsangabe direkt im Coding stellt daher die präziseste und robusteste Form der Referenzierung dar.

Insbesondere in Szenarien ohne permanente Online-Anbindung an Terminologieserver – etwa bei lokal betriebenen Systemen oder in sicherheitskritischen Umgebungen – ist die explizite Versionsangabe essenziell, um Terminologien konsistent zu verwalten, vorzuhalten und zu validieren. Gleiches gilt für Systeme mit umfangreichen Produktlandschaften, in denen unterschiedliche Komponenten zeitversetzt auf verschiedene Terminologiestände aktualisiert werden.

Zusammenfassend ist die verpflichtende Verwendung von Coding.version keine rein konzeptionelle Empfehlung, sondern eine zentrale Voraussetzung für stabile, nachvollziehbare und langfristig interoperable Systeme. Sie stellt sicher, dass die semantische Bedeutung medizinischer Daten nicht von impliziten Annahmen über den Zustand eines Systems abhängt, sondern integraler Bestandteil der übertragenen Information ist.