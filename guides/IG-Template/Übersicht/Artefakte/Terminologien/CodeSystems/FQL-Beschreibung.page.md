<fql output="inline">
from
	CodeSystem
where
	url = 'http://example.org/CodeSystem/MeinCodeSystem'
select
	Beschreibung: description
</fql>