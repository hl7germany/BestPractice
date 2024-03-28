## {{page-title}}
Die FHIR-Spezifikation ist kein Sicherheitsprotokoll! Sie definiert keine sicherheitsbezogenen Funktonalitäten.
Im Kontext der FHIR RESTful API werden jedoch Kommunikationswege definiert, die in Verbindung mit geeigneten Sicherheitsprotokollen genutzt werden müssen, die an anderer Stelle beschrieben werden.

Beispiele für solche Definitionen sind u.A.
* [ISiK Modul Connect](https://simplifier.net/isik-connect-v4)
* [SMART App Launch](https://www.hl7.org/fhir/smart-app-launch/index.html)
* [IHE Internet User Access](https://profiles.ihe.net/ITI/IUA/index.html)


### Verschlüsselung
Auch wenn viele Testserver eine unverschlüsselte Kommunikation anbieten, gilt: Sobald Echtdaten über die FHIR RESTful API kommuniziert werden, sollte die Verbindung verschlüsselt sein.
Siehe hierzu [Kapitel 6.1.0.3 Communications](https://hl7.org/fhir/security.html#http)

### Authentifikation
Benutzer, bzw. Clients, die die FHIR API nutzen, um auf Echtdaten zuzugreifen, müssen Authentifiziert werden.
Siehe hierzu [Kapitel 6.1.0.4 Authentication](https://hl7.org/fhir/security.html#authentication)

### Klinische Sicherheit
Die ["Clinical Safety Checklist"](http://hl7.org/fhir/safety.html) sollte für **jede** Implementierung berücksichtigt werden. 

### Weitere Aspekte
Für die Betrachtung weiterer Sicherheitsaspekte, wie u.A. Audit, Provenance, Access Control, siehe [Kapitel 6.1.0 FHIR Security](https://hl7.org/fhir/security.html)

