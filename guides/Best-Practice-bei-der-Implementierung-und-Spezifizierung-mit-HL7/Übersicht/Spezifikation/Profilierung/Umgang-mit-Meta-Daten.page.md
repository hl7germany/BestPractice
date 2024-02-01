## {{page-title}}

`Resource.meta` dient Systemen zur internen Verwaltung(Identifikation, Versionierung, Kenzeichnung) von Datensätzen. Constraints auf Resource.meta sollten mit äußerster Zurückhaltung und Vorsicht erfolgen, um nicht in die interne Logik von Systemen, die FHIR implementieren, einzugreifen.

Im Speziellen gilt:
  * `meta.profile` sollte nicht constrained werden. Es sollte ausreichen, dass eine Instanz die Regeln eines Profils erfüllt, ohne dies explizit deklarieren zu müssen. <br>
***Begründung:** Die Deklaration von meta.profile hat keine semantische Bedeutung und sollte auch niemals dazu verwendet zu werden, Semantik zu transportieren. Instanzen, die ohne eine Deklaration gegen ein Profil validieren, sollten genauso behandelt werden wie Instanzen, die mit Deklaration validieren. Ebenso sollte die Deklaration eines Profils niemals dazu führen, dass die Validierung übergangen wird. Die Konformität zu einem Profil muss trotz Deklaration stets überprüft werden, sofern die Konformität zu diesem Profil für das validierende System von Belang ist.*
  * Es sollte NIEMALS verhindert werden, dass meta.profile zusätzliche Werte enthalten kann.<br>
***Begründung:** Es muss immer davon ausgegangen werden, dass einzelne Systeme mehrere Spezifikationen gleichzeitig implementieren und deren Instanzen daher Konformität zu mehreren Profilen deklarieren müssen. In Zukunft kann es erforderlich sein, über `meta.profile` auch Auskunft über die FHIR-Version, auf der Instanz basiert, zu kommunizieren.*