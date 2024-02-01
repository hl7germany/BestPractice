## {{page-title}}

### Redering Profiles from Dependencies work:

{ {render:https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse}}
{{render:https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse}}

### FQLs from Dependencies don't work:
```
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```
    
@```
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```