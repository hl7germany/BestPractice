Instance: MeinCapabilityStatement
InstanceOf: CapabilityStatement
Description: "Hier sollte eine Beschreibung stehen. für welche Akteure / welche Rollen dieses CapabilityStatement gilt"
Usage: #definition
* insert MetaInstance
* description = "Hier sollte eine Beschreibung stehen. für welche Akteure / welche Rollen dieses CapabilityStatement gilt"
* title = "CapabilityStatement Best PracticeBeispiel"
* url = "http://fhir.de/test/CapabilityStatement/MeinCapabilityStatement"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "Hier können Hinweise für Server-Implementierungen stehen."
  * resource[+]
    * type = #Patient
    * insert Expectation (#SHALL)
    * supportedProfile = Canonical(MeinPatientProfil)
    * documentation = "Hier sollte eine Erläuterung stehen, wie und wofür die konkrete Ressource verwendet wird und ggf. warum deren Implementierung verpflichtend ist."
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #read
      * documentation = "Hier können Hinweise zu der Interaktion stehen."
    * interaction[+]
      * insert Expectation (#SHALL)
      * code = #search-type
      * documentation = "Hier können Hinweise zu der Interaktion stehen."

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "identifier"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?identifier=http://fhir.krankenhaus.example|1032702`    
        `GET [base]/Patient?identifier=1032702`"    

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "family"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?family=Musterfrau`"  

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "given"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?given=Erika`" 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "birthdate"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
      * type = #date
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?birthdate=1964-12-08`" 

    * searchParam[+]
      * insert Expectation (#SHALL)
      * name = "gender"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?gender=female`" 

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "name"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?name=Erika`" 

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "address"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address=Berlin`"  

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "address-country"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-country"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address-country=DE`" 

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "address-postalcode"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-address-postalcode"
      * type = #string
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?address-postalcode=10117`" 

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "active"
      * definition = "http://hl7.org/fhir/SearchParameter/Patient-active"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?active=true`" 

    * searchParam[+]
      * insert Expectation (#MAY)
      * name = "telecom"
      * definition = "http://hl7.org/fhir/SearchParameter/individual-telecom"
      * type = #token
      * documentation = 
        "**Beispiel:**    
        `GET [base]/Patient?telecom=phone|+49152236898`" 

    * searchRevInclude[+] = "Composition:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Composition:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Composition:author"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Condition:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Condition:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Procedure:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Procedure:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Encounter:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Encounter:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:beneficiary"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:subscriber"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Coverage:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Coverage:payor"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Account:subject"
      * insert Expectation (#MAY)
    * searchRevInclude[+] = "Account:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "AllergyIntolerance:patient"
      * insert Expectation (#SHALL)
    * searchRevInclude[+] = "Observation:patient"
      * insert Expectation (#SHALL)



