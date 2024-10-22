RuleSet: MetaInstance
* version = "4.0.1"
* status = #draft
* experimental = true
* publisher = "HL7 Deutschland e.V."
* date = "2024-10-22"

RuleSet: Meta
* ^version = "4.0.1"
* ^status = #draft
* ^experimental = true
* ^publisher = "HL7 Deutschland e.V."
* ^date = "2024-10-22"

RuleSet: Expectation (expectation)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * valueCode = {expectation}