
The object is to create a complete list of all relevant bindings for a profile, regardless of whether they are defined in the profile itself  on in the underlying base definition

### this doesn't work (on snapshot)

@```
from 
    StructureDefinition
where 
    url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenMetadaten' 
for 
    snapshot.element
    where 
        mustSupport = true and binding.exists()
    select
        Element: binding.path, Staerke: binding.strength, ValueSet: binding.valueSet
```


### this works (on differential)
...but it doesn't show all the relevant Bindings for this profile
@```
from 
    StructureDefinition
where 
    url = 'https://gematik.de/fhir/isik/v3/Dokumentenaustausch/StructureDefinition/ISiKDokumentenMetadaten' 
for 
    differential.element
    where 
        mustSupport = true and binding.exists()
    select
        Element: binding.path, Staerke: binding.strength, ValueSet: binding.valueSet
```