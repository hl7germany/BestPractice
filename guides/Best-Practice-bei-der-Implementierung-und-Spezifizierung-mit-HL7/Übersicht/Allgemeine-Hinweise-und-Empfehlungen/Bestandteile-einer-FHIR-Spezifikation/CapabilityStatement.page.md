## {{page-title}}

Wenn in einer Spezifikation das REST-Paradigma zum Einsatz kommt, so dient die Capability-Ressource der Konkretisierung, welche Features von Client- bzw. Server-Implementierungen gefordert werden. 

Dies umfasst u.A. 
* die Ressourcentypen und Profile, die die Systeme verarbeiten können müssen, 
* die Interaktionen (read, write, update, delete), die für die jeweiligen Ressourcentypen implementiert werden müssen, 
* die Suchparameter, die für die jeweiligen Ressourcentypen unterstützt werden müssen, und 
* die Operations, die über die REST-Interaktionen hinaus unterstützt werden müssen. 

Im Kontext einer FHIR-Spezifikation stellt das CapabilityStatement eine Liste von Anforderungen dar, die Implementierungen erfüllen müssen um als konform zu der Spezifikation zu gelten. 

Das CapabilityStatement kann jedoch auch dazu verwendet werden, die konkret implementierten Features einer Software, die als FHIR-Server agiert, zu dokumentieren. 