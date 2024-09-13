## {{page-title}}

### Redering Profiles from Dependencies work:

{ {render:https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse}}
{{render:https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse}}

### FQLs from Dependencies don't work
Udate: fixed in Version 2024.5.3!! 

"using closure" in FQL hinzufügen

```
using closure
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```
    
<fql output="transpose">
using closure
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenSuchergebnisse'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
</fql>