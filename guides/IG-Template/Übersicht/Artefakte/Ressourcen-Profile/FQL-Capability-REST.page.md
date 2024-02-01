<fql>
from
	CapabilityStatement
where
	url = %capability
	where rest.resource.type = %resType 
	for  rest.resource.interaction
 		select Interaktion: code, Verbindlichkeit: extension		('http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation').value
</fql>