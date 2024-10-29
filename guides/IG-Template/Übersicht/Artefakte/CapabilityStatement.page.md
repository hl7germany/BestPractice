---
topic: CapabilityStatement
---

|Hinweis|Diese Box bitte entfernen!|
|-
|![Information](https://wiki.hl7.de/images/thumb/Under_construction_icon-blue.svg/100px-Under_construction_icon-blue.svg.png)|Diese Seite ist ein Template, das bei Verwendung für ein konkretes Projekt angepasst werden muss! Dieses Banner kann verwendet werden, um zu kennzeichnen, welche Seiten noch nicht bearbeitet wurden, sich gerade in Arbeit befinden oder um auf offene Punkte hinzuweisen.|


<fql output="transpose" headers="true">
from
	CapabilityStatement
where
	url = %capability
select
	CanonicalURL: url, Intention: kind, Status: status, Version: version, Autor: publisher, Datum: date
</fql>

<fql>
from
	CapabilityStatement
where
	url = %capability
select
	Beschreibung:description
</fql>

### Anforderungen an die FHIR-API
<fql output="transpose" headers="true">
from
    CapabilityStatement
where
    url = %capability
select
{
     Modus: rest.mode,
     Dokumentation: rest.documentation
}
order by type
</fql>

#### Interaktionen
<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource
select
{
     Ressourcentyp: type,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     READ: interaction.where(code = 'read').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     SEARCH: interaction.where(code = 'search-type').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     CREATE: interaction.where(code = 'create').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     UPDATE: interaction.where(code = 'update').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     DELETE: interaction.where(code = 'delete').extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     Profile: supportedProfile


}
order by type
</fql>

#### Suchparameter
<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource
select
RessourcenTyp: type,
join searchParam
{
     SuchParameter: name,
     Type: token,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     Dokumentation: documentation,
     Definition: definition
}
</fql>

#### (Reverse-)Include
<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource
select
{
     RessourcenTyp: type,
     'Include (SHALL)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Include (MAY)': searchInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY'),
     'Reverse Include (SHALL)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='SHALL'),
    'Reverse Include (MAY)': searchRevInclude.where(extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value='MAY')
}

</fql>

#### Operations 

<fql>
from
    CapabilityStatement
where
    url = %capability
for rest.resource
select
RessourcenTyp: type,
join operation
{
     Name: name,
     Kontext: type,
     Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
     Dokumentation: documentation,
     Spezifikation: definition
     
}
</fql> 

#### Dokumenten-Endpunkt
<fql>
from
	CapabilityStatement
where
	url = %capability
for document
select
	Modus: mode, 
    Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value,
    Dokumentation: documentation,
    Profil: profile

</fql>
