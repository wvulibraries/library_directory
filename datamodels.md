---
Buildings:
  properties:
  - name 
  - map link
  - image
  enums:
  - status [active, disabled]
  has_many: 
  - address(s)
  - phone(s)
  - floor(s)
  - department(s)
Departments:
  properties:
  - name 
  enums:
  - status [active, disabled]
  has_many: 
  - employee(s)
  - phone(s)
---