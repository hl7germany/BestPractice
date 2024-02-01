<fql>
    from
	    StructureDefinition
    where
	    url = %canonical
    select
	    Beschreibung: description
    with
        no header
</fql>