## Best Practice {{page-title}}

Ein Implementierungsleitfaden soll als statisches, versioniertes Artefakt veröffentlicht werden. Er wird unter einer versionsstabilen URL bereitgestellt, sodass er dauerhaft referenzierbar und für Anwender eindeutig auffindbar ist.

Alle im Leitfaden enthaltenen technischen Artefakte (Profile, ValueSets, CodeSysteme etc.) sind in einem FHIR-Package zusammenzufassen. Dieses Package ist zu versionieren und in der offiziellen FHIR Package Registry zu publizieren, damit es von Implementierungen automatisiert gefunden und eingebunden werden kann.

Für die Versionierung wird die Verwendung von Semantic Versioning [(SemVer)](https://semver.org/lang/de/) empfohlen. 

Darüber hinaus ist es erforderlich, alle Änderungen in [Release Notes](https://keepachangelog.com/de/1.1.0/) transparent festzuhalten. Dies erleichtert die Nachvollziehbarkeit und unterstützt Anwender bei der Bewertung von Updates und Migrationen.
