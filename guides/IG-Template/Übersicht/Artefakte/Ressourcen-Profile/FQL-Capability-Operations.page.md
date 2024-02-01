<fql>
from
	CapabilityStatement
where
	url = %capability
	where rest.resource.type = %resType 
		for rest.resource.operation  
			select Name: name, Spezifikation: definition, Verbindlichkeit: extension('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
</fql> 