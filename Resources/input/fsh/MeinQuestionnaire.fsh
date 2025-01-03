

Instance: QuestionnaireDemo
InstanceOf: Questionnaire
Usage: #example
* insert MetaInstance
* extension[0]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[0]
    * url = "name"
    * valueCoding = $launchContext#patient
  * extension[+]
    * url = "type"
    * valueCode = #Patient
  * extension[+]
    * url = "description"
    * valueString = "Patientenkontext"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "weight"
    * language = #text/fhirpath
    * expression = "%resource.repeat(item).where(linkId='4.1').answer.value"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = "height"
    * language = #text/fhirpath
    * expression = "%resource.repeat(item).where(linkId='4.2').answer.value"
* status = #draft
* title = "Questionnaire Feature Demo (LHC kompatibel)"
* description = "Beispiel-Questionnaire zur Demonstration diverser SDC Funktionalitäten, z.B. Prepopulation, Extraction, Advanced Rendering"
* url = "http://gefyra.de/fhir/sdc/Questionnaire/Demo"
* item[0]
  * type = #group
  * required = true
  * linkId = "1"
  * text = "Angaben zur Person"
  * item[0]
    * type = #string
    * linkId = "1.1"
    * text = "Vorname:"
    * extension
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "%patient.name[0].given[0]"
        * description = "erster Vorname im ersten Namen des Patienten"
  * item[+]
    * type = #string
    * linkId = "1.2"
    * text = "Nachname:"
    * extension
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "%patient.name[0].family"
        * description = "Nachname im ersten Namen des Patienten"
  * item[+]
    * linkId = "1.2a"
    * type = #string
    * text = "Name"
    * required = true
    * extension
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "(%patient.name.where(use = 'official').select(given[0]+' '+family) | %patient.name[0].select(given[0]+' '+family)).first()"
        * description = "Konkatentation aus Vor- und Nachname des Patienten. Präferiert aus offiziellem Namen, alternativ erster Name"
  * item[+]
    * type = #choice
    * linkId = "1.3"
    * text = "Geschlecht:"
    * answerOption[0].valueCoding = $administrative-gender#male "männlich"
    * answerOption[+].valueCoding = $administrative-gender#female "weiblich"
    * extension
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "%questionnaire.repeat(item).where(linkId='1.3').answerOption.value.where(code=%patient.gender)"
        * description = "Geschlecht des Patienten, gemappt von Code auf Coding der Antwortoptionen"
  * item[+]
    * type = #string
    * linkId = "1.4"
    * text = "Versichertennummer:"
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/regex"
      * valueString = "/^[A-Z][0-9]{9}$/"
    * item
      * linkId = "1.4.0"
      * type = #display
      * text = "Des was vonne unne uffm Kärtle steht!"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
        * valueCodeableConcept = $questionnaire-item-control#help
* item[+]
  * type = #group
  * linkId = "2"
  * text = "Fragen zum Wohlbefinden"
  * item[0]
    * type = #choice
    * linkId = "2.1"
    * text = "Wie geht's?"
    * answerOption[0].valueCoding.display = "gut."
    * answerOption[+].valueCoding.display = "geht."
    * answerOption[+].valueCoding.display = "muss."
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      * valueCodeableConcept = $questionnaire-item-control#radio-button
  * item[+]
    * type = #choice
    * linkId = "2.2"
    * text = "Was ist denn los?"
    * answerOption[0]
      * valueCoding.display = "Nix."
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
        * valueDecimal = 3
    * answerOption[+]
      * valueCoding.display = "Frag nicht!"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
        * valueDecimal = 5
    * enableWhen
      * question = "2.1"
      * operator = #=
      * answerCoding.display = "muss."
  * item[+]
    * type = #decimal
    * linkId = "2.3"
    * text = "Schlechte-Laune-Punkte"
    * extension
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      * valueExpression
        * name = "schlechte-laune-punkte"
        * language = #text/fhirpath
        * expression = "%questionnaire.repeat(item).where(linkId = '2.2').answerOption.where(valueCoding.display=%resource.repeat(item).where(linkId = '2.2').answer.valueCoding.display).extension.where(url='http://hl7.org/fhir/StructureDefinition/ordinalValue').valueDecimal"
    * readOnly = true
* item[+]
  * type = #group
  * required = true
  * linkId = "3"
  * text = "Pflegegrad"
  * item
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink"
      * valueUri = "https://ig.fhir.de/basisprofile-de/stable/Ressourcen-BeobachtungenMessungenObservation.html#Ressourcen-Observation-Pflegegrad"
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationLinkPeriod"
      * valueDuration = 1 'a'
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
      * valueBoolean = true
    * type = #choice
    * linkId = "3.1"
    * text = "Bitte geben Sie den Pflegegrad an:"
    * code = $loinc#80391-6
    * answerValueSet = "#valueset-pflegegrad-de"
* item[+]
  * type = #group
  * required = false
  * linkId = "4"
  * text = "BMI-Berechnung"
  * item[0]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      * valueCoding = $unitsofmeasure#kg
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueDecimal = 300
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueDecimal = 20
    * linkId = "4.1"
    * text = "Körpergewicht in kg (muss zwischen 20 und 300kg liegen)"
    * type = #decimal
  * item[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      * valueCoding = $unitsofmeasure#m
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
      * valueString = "x.xx"
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueDecimal = 2.5
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueDecimal = 1
    * linkId = "4.2"
    * text = "Körpergröße in m (muss zwischen 1 und 2.50 liegen)"
    * type = #decimal
  * item[+]
    * extension[0]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      * valueExpression
        * name = "BMI"
        * language = #text/fhirpath
        * expression = "(%weight/(%height.power(2))).round(1)"
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
      * valueCoding = $unitsofmeasure#kg/m2
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
      * valueBoolean = true
    * code = $loinc#39156-5
    * linkId = "4.3"
    * text = "BMI"
    * type = #decimal
    * readOnly = true
    * item[0]
      * linkId = "4.3.1"
      * type = #string
      * readOnly = true
      * initial.valueString = "Sie haben Untergewicht."
      * text = "Einschätzung:"
      * enableWhen
        * question = "4.3"
        * operator = #<
        * answerDecimal = 18.5
    * item[+]
      * linkId = "4.3.2"
      * type = #string
      * readOnly = true
      * text = "Einschätzung:"
      * initial.valueString = "Sie haben Normalgewicht."
      * enableWhen[0]
        * question = "4.3"
        * operator = #>=
        * answerDecimal = 18.5
      * enableWhen[+]
        * question = "4.3"
        * operator = #<=
        * answerDecimal = 24.9
      * enableBehavior = #all
    * item[+]
      * linkId = "4.3.3"
      * type = #string
      * readOnly = true
      * text = "Einschätzung:"
      * initial.valueString = "Sie haben Übergewicht."
      * enableWhen
        * question = "4.3"
        * operator = #>=
        * answerDecimal = 25
* item[+]
  * linkId = "wohn-group"
  * type = #group
  * text = "Wohnsituation"
  * repeats = true
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
    * valueCodeableConcept = $questionnaire-item-control#gtable
  * item[0]
    * linkId = "wohn-ort"
    * type = #string
    * text = "Adresse"
  * item[+]
    * linkId = "wohn-von"
    * type = #date
    * text = "Wohnhaft von"
  * item[+]
    * linkId = "wohn-bis"
    * type = #date
    * text = "Wohnhaft bis"
* item[+]
  * linkId = "fav"
  * type = #group
  * text = "Favoriten"
  * item[0]
    * linkId = "item-ctl"
    * type = #choice
    * text = "Welches ist dein liebstes Item?"
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      * valueCodeableConcept = $questionnaire-item-control#autocomplete
    * answerValueSet = "http://hl7.org/fhir/ValueSet/questionnaire-item-control"
  * item[+]
    * linkId = "kaffee"
    * type = #choice
    * text = "Kaffee?"
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
      * valueCodeableConcept = $questionnaire-item-control#check-box
    * answerOption[0].valueCoding.display = "mit Milch"
    * answerOption[+].valueCoding.display = "Mit Zucker"
    * answerOption[+].valueCoding.display = "Koffeinfrei"
    * repeats = true
* contained = valueset-pflegegrad-de

Instance: valueset-pflegegrad-de
InstanceOf: $shareablevalueset
Usage: #inline
* status = #active
* name = "PflegegradDE"
* description = "Codes zur genaueren Differenzierung des Pflegegrads."
* url = "http://fhir.de/ValueSet/pflegegrad-de"
* version = "1.4.0"
* experimental = false
* date = "2022-09-23"
* publisher = "HL7 Deutschland e.V. (Technisches Komitee FHIR)"
* contact.telecom
  * system = #other
  * value = "http://hl7.de/technische-komitees/fhir/"
* copyright = "HL7 Deutschland e.V."
* expansion
  * identifier = "440c50b5-7272-4184-9ddd-95a75d8207f8"
  * timestamp = "2019-07-06"
  * total = 6
  * contains[0]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.6
    * display = "Pflegebedürftig nach Pflegegrad 1"
  * contains[+]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.7
    * display = "Pflegebedürftig nach Pflegegrad 2"
  * contains[+]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.8
    * display = "Pflegebedürftig nach Pflegegrad 3"
  * contains[+]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.9
    * display = "Pflegebedürftig nach Pflegegrad 4"
  * contains[+]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.a
    * display = "Pflegebedürftig nach Pflegegrad 5"
  * contains[+]
    * system = "http://fhir.de/CodeSystem/bfarm/ops"
    * code = #9-984.b
    * display = "Erfolgter Antrag auf Einstufung in einen Pflegegrad"
* compose.include
  * system = "http://fhir.de/CodeSystem/bfarm/ops"
  * filter
    * property = #parent
    * op = #=
    * value = "9-984"