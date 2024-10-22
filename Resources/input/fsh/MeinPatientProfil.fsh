Profile: MeinPatientProfil
Parent: Patient
Id: MeinPatientProfil
Title: "Mein Patienten-Profil"
Description: """Beispielprofil für IG Template. Mit noch mehr Text zu Testzwecken: Hier ist ein [link](http://gefyra.de), und eine 
  # Überschrift 
  sowie 
  * eine 
  * Aufzählung """
* name 1.. MS
  * ^short = "Name"
  * ^comment = "Der Name muss angegeben werden, um die Identität des Patienten verifizieren zu können"
  * family 1.. MS
    * obeys nachname-check
    * ^short = "Nachnname"
    * ^comment = "Der Nachname des Patienten mit allen Bestandteilen (Vorsatzwort, Namenszusatz, Postfix etc.) muss stets asl ein *vollständiger* [String](http://hl7.org/fhir/datatypes.html#string) angegeben werden. **MARKDOWN-TEST!!!**"
  * given 1.. MS
    * ^short = "Vorname"
    * ^comment = "Der Vorname des Patienten muss stets angegeben werden. Sollte der Vorname in Ausnahmefällen nicht bekannt sein, kann die data-absent-reason-Extension verwendet werden"
  * prefix MS
    * ^short = "Titel"
    * ^comment = "Die Angabe eines Titels ist optional, muss jedoch übermittelt werden, sofern bekannt."

Invariant: nachname-check
Description: "Der Nachname sollte nicht länger sein als 50 Zeichen!"
* severity = #warning
* expression = "length() < 50"

Mapping: meinErstesPatientenMapping
Id: meinErstesPatientenMapping
Description: "Mapping der Patientenressource auf meine Datenbank"
Source: MeinPatientProfil
Target: "Meine Datenbank"
* name
* name.family -> "Person.Nachname"
* name.given -> "Person.Vorname" "Meine DB kann nur einen Vornamen speichern"
* name.prefix -> "Person.Titel" "In meiner DB ist nur Dr. oder Prof. erlaubt!"
* birthDate -> "Person.Geburtsdatum" "muss in das Format DD.MM.YYYY konvertiert werden"

Mapping: meinZweitesPatientenMapping
Id: meinZweitesPatientenMapping
Description: "Mapping der Patientenressource auf meine andere Datenbank"
Source: MeinPatientProfil
Target: "Meine andere Datenbank"
* name
* name.family -> "Person.Nachname"
* name.given -> "Person.Vorname" "Meine DB kann nur einen Vornamen speichern"
* name.prefix -> "Person.Titel" "In meiner DB ist nur Dr. oder Prof. erlaubt!"
* birthDate -> "Person.Geburtsdatum" "muss in das Format DD.MM.YYYY konvertiert werden"