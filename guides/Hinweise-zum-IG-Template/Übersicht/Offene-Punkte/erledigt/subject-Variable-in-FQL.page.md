---
subject: http://example.org/StructureDefinition/MeinPatientProfil
expand: 1
---

## {{page-title}}

* Is it even possible?
* What's the correct syntax?

### non condition (no subject filter is applied)
@```
from
	StructureDefinition
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### Plain
@```
from
	StructureDefinition
where
	url = subject
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### $
@```
from
	StructureDefinition
where
	url = $subject
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### %
@```
from
	StructureDefinition
where
	url = %subject
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### Ticked
@```
from
	StructureDefinition
where
	url = 'subject'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### Double Curls

@```
from
	StructureDefinition
where
	url = {{subject}}
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### Single Curls
@```
from
	StructureDefinition
where
	url = {subject}
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```