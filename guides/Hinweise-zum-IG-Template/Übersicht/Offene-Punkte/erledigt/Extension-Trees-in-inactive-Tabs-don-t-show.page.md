---
subject: http://example.org/StructureDefinition/MeineExtension
expand: 2
---
## {{page-title}}

### This works

<tabs>
  <tab title="Tree">{{tree, snapshot}}</tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab> 
</tabs>

### This works

<tabs>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab> 
  <tab title="Tree", active="true">{{tree, snapshot}}</tab>
</tabs>

### This doesn't work (tree doesn't render)

<tabs>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab> 
  <tab title="Tree">{{tree, snapshot}}</tab>
</tabs>

### This doesn't work (tree doesn't render)

<tabs>
  <tab title="Tree">{{tree, snapshot}}</tab>
  <tab title="XML", active="true">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab> 
</tabs>

