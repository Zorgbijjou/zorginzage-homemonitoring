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
* useContext[=].valueCodeableConcept = $sct#84114007 "hartfalen (aandoening)"
* useContext[+].code = $usage-context-type#focus
* useContext[=].valueCodeableConcept = $sct#879780004 "monitoren van chronisch hartfalen via telegeneeskunde (regime/therapie)" 
* item[0].linkId = "5c167c2d-f518-4bc1-adb7-ea06bc789a36" //zorgpad
* item[=].text = "Zorgpad"
* item[=].type = #string
* item[=].readOnly = true
* item[=].initial.valueString = "Hartfalen"
* item[+].linkId = "245f3b7e-47d2-4b78-b751-fb04f38b17b9" //meetprotocol
* item[=].text = "Selecteer het Meetprotocol"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[0].valueString = "Instabiel hartfalen"
* item[=].answerOption[+].valueString = "Stabiel hartfalen"
* item[+].linkId = "2f505566-ac92-4347-8731-840e6bc84851" //extra-parameters
* item[=].text = ""
* item[=].type = #group
* item[=].enableWhen.question = "245f3b7e-47d2-4b78-b751-fb04f38b17b9" //meetprotocol
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerString = "Instabiel hartfalen"
* item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].linkId = "1b81f13b-923e-4fc8-b758-08b3f172b2de" //titratie
* item[=].item[=].text = "Titratie"
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].answerOption.valueString = "Titratie"
* item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].linkId = "dcba2829-32d8-4390-b1d4-32a5fefda539" //recompensatie
* item[=].item[=].text = "Recompensatie"
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].answerOption.valueString = "Recompensatie"
* item[+].linkId = "170292e5-3163-43b4-88af-affb3e4c27ab" //parameters
* item[=].text = ""
* item[=].type = #group
* item[=].enableWhen.question = "245f3b7e-47d2-4b78-b751-fb04f38b17b9" //meetprotocol
* item[=].enableWhen.operator = #exists
* item[=].enableWhen.answerBoolean = true
* item[=].item[0].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item[=].item[=].extension.valueCoding = $unitsofmeasure#kg "kg"
* item[=].item[=].linkId = "4e973bcb-bbbb-4a9f-877b-fbf45ab94361" //streefgewicht
* item[=].item[=].text = "Streefgewicht"
* item[=].item[=].required = true
* item[=].item[=].type = #decimal
* item[=].item[=].item.linkId = "2f4b0b57-f48b-488b-a846-e95daffde8ed" //streefgewicht-placeholder
* item[=].item[=].item.text = "Streefgewicht *"
* item[=].item[=].item.type = #display
* item[=].item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#prompt
* item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].linkId = "135aec2f-e410-4668-9a26-f745dc1789af" //patiënt-opgenomen
* item[=].item[=].text = ""
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].answerOption.valueString = "De patiënt is opgenomen geweest"
* item[=].item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].extension.valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item[=].linkId = "345ca4a3-1bc8-4358-8d78-783c05953261" //weegschalen-bloeddrukmeters
* item[=].item[=].text = ""
* item[=].item[=].type = #choice
* item[=].item[=].answerOption.valueString = "De patiënt beschikt over een weegschaal en bloeddrukmeter (of is bereid deze aan te schaffen)"
* item[=].item[+].linkId = "be4b671d-f91f-4fc3-a6d8-fcafa8e67161" //notitie
* item[=].item[=].text = ""
* item[=].item[=].type = #text
* item[=].item[=].repeats = false
* item[=].item[=].item.linkId = "c79989b2-63c0-4988-b0a3-e088f82d6096" //notitie-placeholder
* item[=].item[=].item.text = "Notitie (optioneel)"
* item[=].item[=].item.type = #display
* item[=].item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#prompt
* item[+].linkId = "2bc0b73f-506a-48a4-994d-fe355a5825f3" //onboarding
* item[=].text = "Begeleiding bij onboarding"
* item[=].type = #group
* item[=].enableWhen.question = "245f3b7e-47d2-4b78-b751-fb04f38b17b9" //meetprotocol
* item[=].enableWhen.operator = #exists
* item[=].enableWhen.answerBoolean = true
* item[=].item.extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item[=].item.extension.valueCodeableConcept = $questionnaire-item-control#check-box
* item[=].item.linkId = "295a22d7-d0ff-4546-b2a0-ce46beeba086" //hulp-nodig
* item[=].item.text = "De patiënt heeft hulp nodig bij het downloaden en inloggen in de app"
* item[=].item.type = #choice
* item[=].item.repeats = true
* item[=].item.answerOption.valueString = "De patiënt heeft hulp nodig"


Instance: zbj-bundle-questionnaires
InstanceOf: Bundle
Usage: #example
Title: "Zorg bij jou - Bundle - Questionnaires"
Description: "Bundle containing Questionnaire instances"
* type = #batch
* insert BundleEntry(zbj-questionnaire-telemonitoring-heartfailure-enrollment, #PUT, Questionnaire?identifier=urn:uuid:ca893f5c-2868-4349-bc0f-66f67d4ab3a2)
