Instance: zbj-healthcareservice-telemonitoring
InstanceOf: HealthcareService
Usage: #example
Title: "Zorg bij jou - HealthcareService - Telemonitoring"
Description: "Defines which services are provided by the HealthcareService for telemonitoring"
* identifier.system = "urn:oid:2.16.840.1.113883.2.4.3.224"
* identifier.value = "urn:uuid:91a9be09-eb97-4c0f-9a61-27a1985ae38b"
* active = true
* providedBy.identifier.system = $ura
* providedBy.identifier.value = "123"
* category[+] = $sct#719858009 "monitoren via telegeneeskunde (regime/therapie)"
* type[+] = $sct#715191006 "monitoren van asthma via telegeneeskunde (regime/therapie)"
* type[+] = $sct#879780004 "monitoren van chronisch hartfalen via telegeneeskunde (regime/therapie)" 
* type[+] = $sct#716358000 "monitoren van chronische obstructieve longziekte via telegeneeskunde (regime/therapie)" 
* type[+] = $sct#195111005 "hartdecompensatie (aandoening)"
* type[+] = $sct#195111005 "astma (aandoening)"
* type[+] = $sct#195111005 "copd (aandoening)"

Instance: zbj-bundle-healthcareservices
InstanceOf: Bundle
Usage: #example
Title: "Zorg bij jou - Bundle - HealthcareServices"
Description: "Bundle containing HealthcareService instances"
* type = #batch
* insert BundleEntry(zbj-healthcareservice-telemonitoring, #PUT, HealthcareService?identifier=urn:uuid:91a9be09-eb97-4c0f-9a61-27a1985ae38b)
