<fql>
from
	CapabilityStatement
where
	url = %capability
	where rest.resource.type = %resType
		for rest.resource.searchParam  
			select Parameter: name, Typ: type, Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
</fql>