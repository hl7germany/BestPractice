---
subject: http://example.org/StructureDefinition/MeinPatientProfil
expand: 1
---

## {{page-title}}

### This works (tree tab is first in sequence and active by default)
<tabs>
  <tab title="Tree">{{tree, buttons}}</tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>

### This doesn't work (tree tab is **not** first in sequence and hence not active by default, tree only renders after toggeling buttons)
<tabs>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
  <tab title="Tree">{{tree, buttons}}</tab>
</tabs>

### This works (tree tab is fixed to snapshot view, works in any tab order)
<tabs>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
  <tab title="Tree">{{tree, snapshot}}</tab>
</tabs>

### This works (tree tab is last in sequence but forced active)
<tabs>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
  <tab title="Tree", active="true">{{tree, buttons}}</tab>
</tabs>