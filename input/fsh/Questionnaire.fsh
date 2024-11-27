Instance: zbj-questionnaire-telemonitoring-heartfailure-enrollment
InstanceOf: Questionnaire
Usage: #example
Title: "9.02 Questionnaire for telemonitoring - enrollment criteria"
Description: "Questionnaire for enrollment criteria for telemonitoring"
// * meta.lastUpdated = "2024-09-02T13:40:17Z"
// * meta.source = "http://decor.nictiz.nl/fhir/4.0/sansa-"
* meta.tag = $FHIR-version#4.0.1
* language = #nl-NL
// * url = "http://decor.nictiz.nl/fhir/Questionnaire/2.16.840.1.113883.2.4.3.11.60.909.26.34-1--20240902134017"
* identifier.system = "urn:oid:2.16.840.1.113883.2.4.3.224"
* identifier.value = "urn:uuid:ca893f5c-2868-4349-bc0f-66f67d4ab3a2"
// * name = "Telemonitoring - enrollment criteria"
// * title = "Telemonitoring - enrollment criteria"
* status = #draft
* experimental = false
* date = "2024-09-02T13:40:17Z"
* effectivePeriod.start = "2024-09-02T13:40:17Z"
* useContext[+].code = $usage-context-type#task
* useContext[=].valueCodeableConcept = http://terminology.hl7.org/CodeSystem/v3-ActCode#OE "order entry task"
* useContext[+].code = $usage-context-type#focus
* useContext[=].valueCodeableConcept = $sct#719858009 "monitoren via telegeneeskunde (regime/therapie)"
* useContext[+].code = $usage-context-type#focus
* useContext[=].valueCodeableConcept = $sct#195111005 "hartdecompensatie (aandoening)"
* useContext[+].code = $usage-context-type#focus
* useContext[=].valueCodeableConcept = $sct#879780004 "monitoren van chronisch hartfalen via telegeneeskunde (regime/therapie)" 
* item[+].linkId = "2.16.840.1.113883.2.4.3.11.60.909.2.2.2208"
* item[=].text = "Patient heeft smartphone"
* item[=].type = #boolean
* item[=].required = true
* item[=].repeats = false
* item[=].readOnly = false
* item[+].linkId = "2.16.840.1.113883.2.4.3.11.60.909.2.2.2209"
* item[=].text = "Patient of mantelzorger leest e-mail op smartphone"
* item[=].type = #boolean
* item[=].required = true
* item[=].repeats = false
* item[=].readOnly = false
* item[+].linkId = "2.16.840.1.113883.2.4.3.11.60.909.2.2.2210"
* item[=].text = "Patient of mantelzorger kan apps installeren op smartphone"
* item[=].type = #boolean
* item[=].required = true
* item[=].repeats = false
* item[=].readOnly = false
* item[+].linkId = "2.16.840.1.113883.2.4.3.11.60.909.2.2.2211"
* item[=].text = "Patient of mantelzorger is Nederlandse taal machtig"
* item[=].type = #boolean
* item[=].required = true
* item[=].repeats = false
* item[=].readOnly = false
* item[+].linkId = "2.16.840.1.113883.2.4.3.11.60.909.2.2.2212"
* item[=].text = "Patient beschikt over een weegschaal of bloeddrukmeter (of gaat deze aanschaffen)"
* item[=].type = #boolean
* item[=].required = true
* item[=].repeats = false
* item[=].readOnly = false

Instance: zbj-bundle-questionnaires
InstanceOf: Bundle
Usage: #example
Title: "Zorg bij jou - Bundle - Questionnaires"
Description: "Bundle containing Questionnaire instances"
* type = #batch
* insert BundleEntry(zbj-questionnaire-telemonitoring-heartfailure-enrollment, #PUT, Questionnaire?identifier=urn:uuid:ca893f5c-2868-4349-bc0f-66f67d4ab3a2)
