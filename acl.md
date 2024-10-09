Below table contains all access rules that need to be implemented by all parties involved in home monitoring.

# Definitions
The table uses the following definitions:
- CarePlan.subject The patient related to the resource.
- CarePlan.addresses[Condition].code The type of condition, like COPD.
- CarePlan.activity[ServiceRequest].code The type of service, like Home monitoring.
- Resource, the resource type.

# ACL
|Condition.code|Request.code|Resource query|
|---------|-------|--------|
|*|*|Patient?id=patient.id|
|13645005 (Chronic obstructive pulmonary disease (disorder))|719858009 (Telehealth monitoring)|Condition?subject=patient&category=[all somatic conditions]|
||||
