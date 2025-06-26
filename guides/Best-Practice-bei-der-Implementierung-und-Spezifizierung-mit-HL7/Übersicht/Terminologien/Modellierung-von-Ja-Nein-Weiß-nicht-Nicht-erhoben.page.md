# Best Practice  {{page-title}} 

Sollen Informationen mit den Antworten Ja / Nein / Weiß nicht / Nicht erhoben in FHIR repräsentiert werden, z. B. die Information, ob bestimmte Erkrankungen oder Symptome vorliegen, sollte unterschieden werden, woher die Informationen stammen:

a) Werden sie von einem Menschen direkt eingegeben, oder
b) Fehlt die Eingabe bei der Eingabe oder wird auf dem Server nach einer Information gesucht und ein Fehlen kommuniziert werden?

Im ersten Fall, beispielsweise durch die Erhebung in Questionnaires mit anschließendem Mapping in Observations, werden die Informationen als CodeableConcept dargestellt, auch wenn es nur die Auswahlmöglichkeiten Ja und Nein gibt. Dies ermöglicht einen Vergleich von Informationen aus verschiedenen Systemen und Profilen sowie eine Erweiterung der möglichen Werte ohne Änderung des Datentyps.

Für die folgenden Konzepte befinden sich in diesen Empfehlungen Codierungen:

Level | Konzept | Definition | Beispiel Wundgeruch – Informationsquelle Gesundheitsfachperson | Beispiel Schwangerschaft – Informationsquelle Patient:in | Beispiel Schwangerschaft – Informationsquelle Gesundheitsfachperson | Beispiel Positiver Corona-Test – Informationsquelle Patient:in 
--- | --- | --- | --- | --- | --- | ---
0 | Ja | | Die Wunde des Patienten riecht. | Ja, ich bin schwanger. | Die Patientin ist schwanger. | Ja, ich wurde positiv getestet.
0 | Nein | | Die Wunde des Patienten riecht nicht. | Nein, ich bin nicht schwanger. | Nein, die Patientin ist nicht schwanger. | Nein, ich wurde nicht positiv getestet.
0 | Unbekannt | Information nicht bekannt | -- | -- | -- | --
1 | Nicht gefragt | Die entsprechende Information wurde bei dem Informationsgeber nicht erfragt. | Der Status des Wundgeruchs wurde nicht erhoben. | -- | Die Patientin wurde nicht gefragt, ob sie schwanger ist. | --
1 | Gefragt, aber unbekannt / Weiß nicht | Der Informationsgeber wurde gefragt, konnte die Information aber nicht geben. | -- | Ich weiß nicht, ob ich schwanger bin. | Die Patientin weiß nicht, ob sie schwanger ist. | --
1 | Gefragt, aber Antwort verweigert | Der Informationsgeber wurde gefragt, wollte die Information aber nicht geben. | -- | -- | Die Patientin wurde gefragt, ob sie schwanger ist, hat die Frage aber nicht beantwortet. | --
1 | Nicht beurteilbar | Die Beobachtung wurde durchgeführt, jedoch konnte sie nicht beurteilt werden. | Der Status des Wundgeruchs wurde erhoben, war aber nicht beurteilbar. | -- | -- | --
0 | Nicht anwendbar | Die entsprechende Beobachtung ist im Anwendungskontext nicht anwendbar. | -- | -- | Die Frage ist beim Patienten nicht anwendbar, da er ein biologischer Mann ist. | --
0 | Nicht durchgeführt | Ein entsprechendes Testverfahren wurde nicht durchgeführt | -- | -- | Es wurde kein Schwangerschaftstest durchgeführt. | Es wurde kein Corona-Test durchgeführt

Für diese Konzepte werden folgende Codierungen empfohlen, wobei SNOMED bevorzugt wird vor LOINC, und dies vor HL7 CodeSystemen.

**Bevorzugte Codierung**

Zu mappendes Konzept | System | Code | Display | Äquivalenzgrad
--- | --- | --- | --- | ---
Ja | SNOMED CT | 373066001 | Yes (qualifier value) | Equal
Nein | SNOMED CT | 373067005 | No (qualifier value) | Equal
Unbekannt | SNOMED CT | 261665006 | Unknown (qualifier value) | Equal
Nicht gefragt | SNOMED CT | 1631000175102 | Patient not asked (contextual qualifier) (qualifier value) | Equivalent
Gefragt, aber unbekannt | LOINC | LA20384-6 | Asked but unknown | Equal
Gefragt, aber Antwort verweigert | LOINC | LA31066-6 | Refused to answer | Equal
Nicht beurteilbar | SNOMED CT | 1156316003 | Cannot be determined | Inexact
Nicht anwendbar | SNOMED CT | 385432009 | Not applicable (qualifier value) | Equivalent
Nicht durchgeführt | SNOMED CT | 262008008 | Not performed (qualifier value) | Equivalent

**Alternative Codierung**

Zu mappendes Konzept | System | Code | Display | Äquivalenzgrad
--- | --- | --- | --- | ---
Ja | v2-0532 | Y | Yes | Equal
Nein | v2-0532 | N | No | Equal
Unbekannt | v2-0532 | UNK | Unknown | Equal
Nicht gefragt | v2-0532 | NASK | Not Asked | Equal
Gefragt, aber unbekannt | v2-0532 | ASKU | asked but unknown | Equal
Gefragt, aber Antwort verweigert | Data Absent Reason | asked-declined | Asked But Declined | Inexact
Nicht beurteilbar | SNOMED CT | 1156316003 | Cannot be determined | Inexact
Nicht anwendbar | Data Absent Reason | not-applicable | Not Applicable | Equal
Nicht durchgeführt | Data Absent Reason | not-performed | Not Performed | Equal

**CanonicalURLs**

System | Canonical URL|
--- | --- 
SNOMED CT | http://snomed.info/sct
LOINC | http://loinc.org
Data Absent Reason | http://terminology.hl7.org/CodeSystem/data-absent-reason
v2-0532 | http://terminology.hl7.org/CodeSystem/v2-0532

## Beispiele

### Beispiel I – entgegen dieser Empfehlung

In Profil A wird der Status, ob eine bestimmte Erkrankung vorliegt, mit Ja / Nein erhoben und in einer Observation als valueBoolean hinterlegt.

In Profil B wird der Status, ob eine bestimmte Erkrankung vorliegt, mit Ja / Nein / Unbekannt erhoben und in einer Observation als valueCodeableConcept hinterlegt.

Diese beiden Spezifikationen sind inkompatibel zueinander aufgrund der unterschiedlichen Datentypen. Für Implementierer, die Ressourcen zu beiden Profilen weiterverarbeiten möchten, entsteht ein Mehraufwand, da sie beide Datentypen verarbeiten können müssen.

Beispiel für Profil A:

```json
{
    "resourceType": "Observation",
    "id": "1",
    "status": "final",
    "code": {
        "coding": [
            {
                "code": "72288-4",
                "system": "http://loinc.org",
                "display": "Odor of Exudate from wound"
            }
        ]
    },
    "valueBoolean": "true",
    "effectiveDateTime": "2023-06-21",
    "focus": [
        {
            "reference": "b68841d5-c928-45c1-b083-d1629bfccf71"
        }
    ],
    "subject": {
        "reference": "c33dfe0c-3bc3-46eb-971b-4d1a2f218cf3"
    }
}
```

Beispiel für Profil B:
```json
{
    "resourceType": "Observation",
    "id": "1",
    "status": "final",
    "code": {
        "coding": [
            {
                "code": "72288-4",
                "system": "http://loinc.org",
                "display": "Odor of Exudate from wound"
            }
        ]
    },
    "valueCodeableConcept": {
        "coding": [
            {
                "code": "373066001",
                "system": "http://snomed.org/sct",
                "display": "Yes"
            }
        ]
    },
    "effectiveDateTime": "2023-06-21",
    "focus": [
        {
            "reference": "b68841d5-c928-45c1-b083-d1629bfccf71"
        }
    ],
    "subject": {
        "reference": "c33dfe0c-3bc3-46eb-971b-4d1a2f218cf3"
    }
}
```

### Beispiel II – Berücksichtigung der Empfehlung

Ändert Profil A den Datentyp zu valueCodeableConcept und nutzt einen Teil der in Profil B zulässigen Werte (nämlich die Codierungen für Ja und Nein), können Ressourcen zu beiden Profilen von Implementieren identisch behandelt werden. Zusätzlicher Implementierungsaufwand kann verhindert werden.

Beispiele für beide Profile Ressourcen:
```json
{
    "resourceType": "Observation",
    "id": "1",
    "status": "final",
    "code": {
        "coding": [
            {
                "code": "72288-4",
                "system": "http://loinc.org",
                "display": "Odor of Exudate from wound"
            }
        ]
    },
    "valueCodeableConcept": {
        "coding": [
            {
                "code": "373066001",
                "system": "http://snomed.org/sct",
                "display": "Yes"
            }
        ]
    },
    "effectiveDateTime": "2023-06-21",
    "focus": [
        {
          "reference": "b68841d5-c928-45c1-b083-d1629bfccf71"
        }
    ],
    "subject": {
        "reference": "c33dfe0c-3bc3-46eb-971b-4d1a2f218cf3"
    }
}
```

## Verwendung der dataAbsentReason-Extension
Im Fall, dass Informationen auf dem Server (oder einem System mit vergleichbarer Funktion) herausgesucht werden sollen, aber nicht gefunden werden, kann dieser Sachverhalt als dataAbsentReason (ggf. auch als Extension) hinterlegt werden.

* Beispiel A: In System A wurde die Information, dass der Status, ob eine Erkrankung vorliegt, nicht erhoben wurde, per Questionnaire / Formular erhoben. Diese Information wird in einer Observation als valueCodeableConcept hinterlegt.

* Beispiel B: In System B wurde dieselbe Information zum Vorliegen der Erkrankung nicht hinterlegt, allerdings soll eine Information dazu extrahiert werden. Da die Information nicht vorliegt, wird in der Observation nicht valueCodeableConcept, sondern dataAbsentReason mit einem entsprechenden Wert gefüllt.

## Rückmeldungen

Rückmeldungen zu diesen Inhalten bitte an das TC Terminologien übermitteln. 