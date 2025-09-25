## Best Practice {{page-title}}

Ein finale Version eines Implementierungsleitfadens soll als statisches, versioniertes Artefakt veröffentlicht werden. Er wird unter einer versionsstabilen URL bereitgestellt, sodass er dauerhaft referenzierbar und für Anwender eindeutig auffindbar ist.

Alle im Leitfaden enthaltenen technischen Artefakte (Profile, ValueSets, CodeSysteme etc.) sind in einem FHIR-Package zusammenzufassen. Dieses Package ist zu versionieren und in der offiziellen FHIR Package Registry zu publizieren, damit es von Implementierungen automatisiert gefunden und eingebunden werden kann.

Für die Versionierung wird die Verwendung von Semantic Versioning (SemVer) empfohlen. Damit können Änderungen klar nachvollzogen werden.

Darüber hinaus ist es erforderlich, alle Änderungen in ReleaseNotes transparent festzuhalten. Dies erleichtert die Nachvollziehbarkeit und unterstützt Anwender bei der Bewertung von Updates und Migrationen.
