<fql output="inline" headers="false">
        from
	        StructureDefinition
        where
	        url = %canonical
        select
	        Beschreibung: description
        with
            no header
</fql>
<fql output = "table" headers="true">

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