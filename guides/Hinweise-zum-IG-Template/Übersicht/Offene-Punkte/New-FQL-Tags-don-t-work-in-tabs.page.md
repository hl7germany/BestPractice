---
canonical: http://example.org/StructureDefinition/MeinPatientProfil
---

### FQL inside a tab...

<tabs>
  <tab title="Beschreibung"> 
<fql output="table" headers="true">
        from
	        StructureDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>
<fql output="table" headers="true">
        from 
            StructureDefinition 
        where 
            url = %canonical
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

### ...versus FQL outside a tab
<fql output="table" headers="true">
        from
	        StructureDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>
<fql output="table" headers="true">
        from 
            StructureDefinition 
        where 
            url = %canonical
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

### Workaround with external page inclusion
<tabs>
  <tab title="Beschreibung"> 
  {{page:Startseite/Offene-Punkte/FQL-Template.page.md}}
  {{page:Startseite/Offene-Punkte/FQL-Template-MustSupport.page.md}}
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>