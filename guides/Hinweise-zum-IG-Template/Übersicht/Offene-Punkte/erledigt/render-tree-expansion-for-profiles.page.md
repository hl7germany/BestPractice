---
subject: http://example.org/StructureDefinition/MeinPatientProfil
expand: 3
---

## {{page-title}}

## Neither form changes the expand level if subject is an instance instead of a profile

### render command

#### page default expand level

{{render}}

#### expand: 1

{{render, expand:1}}

#### expand: 3

{{render, expand:3}}

### tree command

#### page default expand level

{{tree}}

#### expand: 1

{{tree, expand:1}}

#### expand: 3

{{tree, expand:3}}
