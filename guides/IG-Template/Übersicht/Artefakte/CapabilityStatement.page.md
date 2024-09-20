---
canonical: http://example.org/CapabilityStatement/BeispielCapabilityStatement
---

|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|

## {{link}}

<fql output="transpose" headers="true">
from
	CapabilityStatement
where
	url = %canonical
select
	CanonicalURL: url, Intention: kind, Status: status, Version: version
</fql>

<fql>
from
	CapabilityStatement
where
	url = %canonical
select
	Beschreibung:description
</fql>
{{link}}


## Anforderungen an eine serverseitige Implementierungen

### Interaktionen
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
{
     Ressourcentyp: type,
     Profile: supportedProfile,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     READ: interaction.where(code = 'read').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     SEARCH: interaction.where(code = 'search-type').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     CREATE: interaction.where(code = 'create').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     UPDATE: interaction.where(code = 'update').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     DELETE: interaction.where(code = 'delete').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value


}
order by type
</fql>

### Suchparameter

<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
RessourcenTyp: type,
join searchParam
{
     SuchParameter: name,
     Type: token,
     Definition: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     Hinweise: documentation
}
</fql>

### (Reverse-)Include
<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
{
     RessourcenTyp: type,
     Include: searchInclude,
     ReverseInclude: searchRevInclude
}
</fql>

### Operations

<fql>
from
    CapabilityStatement
where
    url = %canonical
for rest.resource
select
RessourcenTyp: type,
join operation
{
     Name: name,
     Spezifikation: definition,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
}
</fql>
