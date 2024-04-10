# Introduction
This document describes how to use the Nuts-specifications in the context of home monitoring. This includes the specific agreements that, in addition to the specifications "workflow/ notified pull" and "data/ zorginzage 2024", apply to the use case of home monitoring.

This document describes:
- the specific functional processes
- the identifier of the use case;
- the governance;
- the information standards;
- presentation definition for UCL/ Service Discovery
- presentation definition for data requests
- the permitted means of authentication;
- the permitted legal bases;
- naming of actors;
- the access policy; and
- sequence diagram

# functional processes
A head practitioner from organization HPO sends a request to organization MSC to perform home monitoring services for patient P.
A home monitoring professional (commonly referred to as eNurse) works in a medical service center. The eNurse needs access to data that resides in the HPO to do her/his job.

# use case identifier
The identifier of the use case is 'homemonitoring'.

# Governance
- Information standards are developed and maintained by standardization organization Nictiz
- This specification is developed and maintained by [Zorg bij Jou](https://www.zorgbijjou.nl) in collaboration with Santeon

# Information standards
- The content and structure of the information to be exchanged complies with the Functioneel Ontwerp BgZ medisch-specialistische zorg 1.0: https://informatiestandaarden.nictiz.nl/wiki/BgZ:V1.0_BgZ_MSZ_Informatiestandaard
- The structure of the data to be exchanged and the data interfaces to be used comply with the BgZ medisch-specialistische zorg Technical Implementation Guide 1.0: https://informatiestandaarden.nictiz.nl/wiki/BgZ:V1.0_BgZ_2017_Technical_IG
- Unstructured documents containing health information are exchanged using the MedMij FHIR Implementation Guide: PDF/A 3.0.37L https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/FHIR_PDFA#List_of_profiles
- Reports of Contacts ("Naslag"): t.b.d.

# presentation definition for UCL/ Service Discovery
Parties that support the usae case "zorginzage-homemonring" can register themselves at a discovery service. This is done by presenting a verifiable presentation.
This is done by presenting a verifiable presentation uses the following attributes:

The following presenttaion definition is needed:


# presentation definition for data requests

# Permitted means of authentication of healthcare professionals
In order to share data securely between different healthcare providers, cross-organizatonal authentication of healthcare professionals is essential. For this use case the following means of healthcare professional authentication are permitted:
- EmployeeID (support is optional): as specified in [RFC019 Employee Identity Authentication Means](https://nuts-foundation.gitbook.io/drafts/rfc/rfc019-employee-identity-means)https://nuts-foundation.gitbook.io/drafts/rfc/rfc019-employee-identity-means
- IRMA/Yivi (support is optional): as specified in [RFC002 Authentication token chapter 7.1](https://nuts-foundation.gitbook.io/drafts/rfc/rfc002-authentication-token#id-7.1.-irma)https://nuts-foundation.gitbook.io/drafts/rfc/rfc002-authentication-token#id-7.1.-irma
- UZI smartcard (support is optional): as specified in [RFC002 Authentication token chapter 7.2](https://nuts-foundation.gitbook.io/drafts/rfc/rfc002-authentication-token#id-7.2-uzi)https://nuts-foundation.gitbook.io/drafts/rfc/rfc002-authentication-token#id-7.2-uzi

# Permitted legal bases and evidence
The following legal bases are supported for the use case medical specialist referral:
- 'implicit consent'
- 'explicit prior consent': not necessary because consent for data processing can be assumed when the patient has given informed consent to the head practitioner at organization HPO for the execution of home monitoring services by organiozation MSC

The following evidence is allowed for 'implicit consent':
- registration in the source system used by the head practitioner
- verbal consent given to the head practitioner

# Naming of actors

| Actor name Notified Pull                  | Actor name BgZ referral                           |
|-------------------------------------------|---------------------------------------------------|
| ...                                       | ...                                               |
| ...                                       | ...                                               |

# Data availability
- Every party that offers services for the use case homemonitoring is responsible for the availability of its own infrastructure, the system and the Nuts-node.
- Data holders ensure the availability of all components that are part of XXX in accordance with the requirements for Availability, Integrity and -Confidentiality as included in the article <<TO DO WAAR??>>.

# Access Policy
One aspect of a Nuts Application involves describing authorizations to certain resources. Authorizations are described in an access policy. It is the responsibility of the Sending System to adhere to the policy when resources are being requested.

<<Separate access policy for 
resources that support the workflow patterns (e.g. Task, ServiceRequest) and resources that represent the composition of the care network on the one hand (e.g. CarePlan, CarePlan),
and resources that represent the medical record itself (e.g. Observation, Condition, Procedure?, EpisodeOfCare?)

This Nuts Application involves three different access policies: 
- homemonitoring-placer
- homemonitoring-filler
- homemonitoring-dataholder
The homemonitoring-dataholder policy controls access to actual medical data. The homemonitoring-placer and homemonitoring-filler policies control data access necessary for workflows related to home monitoring (e.h. cross-organization onboarding, servicerequests, medicationrequests, ...).

<DO NOT READ FURTHER REPLACE NEXT PARTS WITH actual info>>

## The BgZ Receiver Policy

The BgZ Receiver policy only describes access to the Notification Task endpoint. When requesting an access token from the authorization server, no [Nuts Authorization Credentials](https://nuts-foundation.gitbook.io/rfc/rfc014-authorization-credential) are required. No user details are required
either. The `vcs` and `usi` claims in the [JWT](https://nuts-foundation.gitbook.io/rfc/rfc003-oauth2-authorization#id-4.2.2-payload) may be left empty. The `purposeOfUse` claim must contain `bgz-receiver`.

The Receiving System must check whether an HTTP POST request is performed to the Notification Task endpoint. This is the relative path that is registered under the `notification` field in the `bgz-receiver` service.

## The BgZ Sender Policy

The BgZ Sender policy describes rules for both personal and non-personal resources. For non-personal resources, the same applies as for the BgZ Receiver policy: the `vcs` and `usi` claims may be left out from
the [JWT](https://nuts-foundation.gitbook.io/rfc/rfc003-oauth2-authorization#id-4.2.2-payload).

## Non-Personal Resources (Tasks)

### Authorization Credential Task

Retrieving the Workflow Task falls under the category of non-personal resources. Since this is about accessing a single resource, a [Nuts Authorization Credential](https://nuts-foundation.gitbook.io/rfc/rfc014-authorization-credential) is required.
The credential must meet the following requirements:

| Field                                     | Description                     |
|-------------------------------------------|---------------------------------|
| `issuer`                                  | Sending Organization DID        |
| `credentialSubject.id`                    | Receiving Organization DID      |
| `credentialSubject.purposeOfUse`          | `bgz-sender`                    |
| `credentialSubject.legalBase.consentType` | `implied`                       |
| `credentialSubject.resources`             | The specific Task: `/Task/[id]` |

The Receiving System must check whether the incoming request is equal to:

```
GET [base]/Task/[id]
```

Where `[base]` represents the path registered under the `fhir` field in the `bgz-sender` service. The Sending System must check whether the used access token provides access to the requested Task resource.
Both the Sending Organization and Receiving Organization must be included when requesting the access token.

The BgZ Sender policy does not provide access to resources other than those resources listed in the credential. Two distinct Authorization Credentials must be created: one for the Task resources and one for the BgZ resources.
The `resources` field of the Authorization Credential for the Task must contain the following values:

```json
{
  "path": "/Task/[id]",
  "operations": [
    "read",
    "update"
  ],
  "userContext": false
}
```

Where `[id]` must be replaced by an actual ID. This part of the credential provides read and update access to the Task resource.

When requesting the access token, the credential must be included in the `vcs` claim and meet the above-mentioned requirements.

Part of the BgZ referral is that the Receiving Organization updates the Task status. This requires a PUT request.

### Normative Expiration Date Task Authorization

When creating an Authorization Credential, an end date must be set on the record using the `expirationDate` field. The end date must be primarily based on the patient's own preferences.
The practitioner needs to ask the patient for the preferred duration of the consent. When the patient's preferences with regard to the duration of the consent are not registered, the following norms apply:

- In case of "explicit prior consent" the end date of the authorization equals the current date plus 14 days;
- In case of "implied consent" the end date of the authorization equals the current date plus 14 days.

### Revoking the Task Authorization

The Task resource authorization does not have to be revoked; it can simply expire since the Task contains no personal data.

### Task Access Token

When requesting the access token, the Authorization Credential must be included and meet the above-mentioned requirements. No user details have to be included in the `usi` claim.
The `service` field in the credential must equal `bgz-sender`.

Access token lifetime: 300 seconds (5 minutes).

### Task Authentication Contract

For access to the Task FHIR-resource(s) (`"userContext": false`), no user details have to be included in the `usi` claim.

### Task Resource Field

The `resources` field in the Authorization Credential must contain at least one element that contains a relative path to a FHIR Task resource:

```json
{
  "path": "/Task/[id]",
  "operations": [
    "read",
    "update"
  ],
  "userContext": false
}
```

The following resource types may be included in the Authorization Credential: Task. Please see [Appendix: Workflow Task](#appendix-workflow-task) for more details.

### Task Access Control

The Sending System must only provide access to exactly those resource that are listed in the `resources` field in the Authorization Credential.
When the Sending System processes an incoming request regarding a Task, access must be provided based on the resources listed in the Authorization Credential to:

1. Task resources if any are included in the `resources` field of the Authorization Credential

Data access is not controlled by practitioner role.

### Task Search Narrowing

The Sending System must not apply search narrowing to incoming requests for Task resources.
The Receiving System must perform Task requests in the form of read requests on specific Task resource instances (conform `/Task/[id]`).

## Personal Resources (BgZ Resources)

### Authorization Credential BgZ Resources

Pulling BgZ referral resources and all related data requires a registered authorization in the form of a [Nuts Authorization Credential](https://nuts-foundation.gitbook.io/rfc/rfc014-authorization-credential).
The credential must meet the following requirements:

| Field                                     | Description                                               |
|-------------------------------------------|-----------------------------------------------------------|
| `issuer`                                  | Sending Organization DID                                  |
| `credentialSubject.id`                    | Receiving Organization DID                                |
| `credentialSubject.purposeOfUse`          | `bgz-sender`                                              |
| `credentialSubject.legalBase.consentType` | `implied`                                                 |
| `credentialSubject.subject`               | BSN as OID: `urn:oid:2.16.840.1.113883.2.4.6.3.999999990` |

The Sending System must check whether the used access token provides access to the requested Task resource. Both the Sending Organization and Receiving Organization are included when requesting the access token.

The BgZ Sender policy does not provide access to resources other than those resources listed in the credential. Two distinct Authorization Credentials will be created: one for the Task resources and one for the BgZ resources.

#### Resources
The `resources` field in the Authorization Credential must contain at least one element that contains a relative path to a BgZ FHIR resource:

```json
{
  "path": "/[type]/[/$operation][?query]",
  "operations": [
    "search"
  ],
  "userContext": true
}
```

For all FHIR *search* operations that are part of the [MedMij FHIR Implementation Guide: BgZ](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/FHIR_BGZ_2017#PHR:_request_message), a rule must be included.
`/[path]` must be replaced by the FHIR type. `/[$operation]` must be replaced by a possibly mandatory operation, e.g., `$lastn`. `[?queries]` must be replace by possibly mandatory query parameters, e.g., `code=http://snomed.info/sct|365508006`.

The following resource types may be included in the Authorization Credential:

- Patient
- Coverage
- Consent
- Condition
- Observation
- NutritionOrder
- Flag
- AllergyIntolerance
- MedicationStatement
- MedicationRequest
- MedicationDispense
- DeviceUseStatement
- Immunization
- Procedure
- Encounter
- ProcedureRequest
- ImmunizationRecommendation
- DeviceRequest
- Appointment
- DocumentReference
- Binary

Please see the [FHIR Implementation Guide BgZ](https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2020.01/FHIR_BGZ_2017#PHR:_request_message) for more details.

When requesting the access token, the credential must be included in the `vcs` claim and meet the above-mentioned requirements.

### Normative End Date BgZ Resources Authorization

When creating an Authorization Credential, an end date must be set on the record using the `expirationDate` field. The end date must be primarily based on the patient's own preferences.
The practitioner needs to ask the patient for the preferred duration of the consent. When the patient's preferences with regard to the duration of the consent are not registered, the following norms apply:

- In case of "explicit prior consent" the end date of the authorization equals the current date plus 14 days;
- In case of "implied consent" the end date of the authorization equals the current date plus 14 days.

### Revoking the BgZ Resources Authorization

When the BgZ referral is complete, it is no longer necessary for the Receiving Organization to pull resources. The Authorization Credential for the BgZ resources can then be revoked.

State machine for revoking authorization for BgZ resources:

- When the Task status gets updated to `completed`, then
    - the Sending Organization must revoke the Authorization Credential for the BgZ resources.
- When the Receiving Organization forgets to complete the process, the Sending Organization may:
    - revoke the Authorization Credential for the BgZ FHIR Resources after a reasonable period of time.

### Access Token BgZ FHIR Resources

When requesting the access token, the Authorization Credential must be included and meet the above-mentioned requirements. User details must be included in the `usi` claim.
The `service` field in the credential must equal `bgz-sender`.

Access token lifetime: 300 seconds (5 minutes).

### Authentication Contract BgZ FHIR Resources

For access to the BgZ FHIR-resource(s) (`"userContext": true`), user details have to be included in the `usi` claim.

### BgZ Resources Access Control

The Sending System must only provide access to exactly those resource that are listed in the `resources` field in the Authorization Credential.
When the Sending System processes an incoming request regarding BgZ resources, access must be provided based on the resources listed in the Authorization Credential to:

1. Patient resource for the patient whose BSN is included in the `credentialSubject.subject` field of the Authorization Credential
2. Remaining resources if any are included in the `resources` field in the Authorization Credential

Data access (in this particular Nuts Application) is not controlled by practitioner role.

### Search Narrowing

The Sending System must apply search narrowing. For incoming requests (e.g., `/Patient`) the following applies:

- The response only contains the requested resources for which the Receiving Organization is authorized based on the Authorization Credentials and the Access Policy;
- The response has the expected format for the incoming request. E.g., an incoming `/Patient` or `/Observation` request must result in a Bundle response.

The table below specifies how search narrowing must be applied. The first column describes the requests a Receiving Organization can perform.
The second column describes how the requests must be executed by the Sending System in relation to the Authorization Credentials and the Access Policy.

| Request to be sent by the Receiving System                                               | Request to be executed by the Sending System                                                                                                                                         |
|------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GET [base]/Patient                                                                       | <p>GET [base]/Patient?<b>identifier=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b></p><p>Result: \<\<Patient instance ID>></p>                        |
| GET [base]/Patient?_include=Patient:general-practitioner                                 | GET [base]/Patient?_include=Patient:general-practitioner<b>&identifier=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                 |
| GET [base]/Coverage?_include=Coverage:payor:Patient&_include=Coverage:payor:Organization | GET [base]/Coverage?_include=Coverage:payor:Patient&_include=Coverage:payor:Organization<b>&subscriber=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b> |
| GET [base]/Consent                                                                       | GET [base]/Consent<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                                          |
| GET [base]/Observation/$lastn?category=X                                                 | GET [base]/Observation/$lastn?category=X&<b>patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                    |
| GET [base]/Condition                                                                     | GET [base]/Condition<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                                        |
| GET [base]/Observation/$lastn?code=X                                                     | GET [base]/Observation/$lastn?code=X<b><b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b></b>                                                 |
| GET [base]/NutritionOrder                                                                | GET [base]/NutritionOrder<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                                   |
| GET [base]/Flag                                                                          | GET [base]/Flag<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                                             |
| GET [base]/AllergyIntolerance                                                            | GET [base]/AllergyIntolerance<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                               |
| GET [base]/MedicationStatement?category=X                                                | GET [base]/MedicationStatement?category=X<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                   |
| GET [base]/MedicationRequest?category=X                                                  | GET [base]/MedicationRequest?category=X<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                     |
| GET [base]/MedicationDispense?category=X                                                 | GET [base]/MedicationDispense?category=X<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                    |
| GET [base]/DeviceUseStatement?_include=DeviceUseStatement:device                         | GET [base]/DeviceUseStatement?_include=DeviceUseStatement:device<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                            |
| GET [base]/Immunization?status=completed                                                 | GET [base]/Immunization?status=completed<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                    |
| GET [base]/Procedure?category=X                                                          | GET [base]/Procedure?category=X<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                             |
| GET [base]/Encounter?class=X                                                             | GET [base]/Encounter?class=X<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                                |
| GET [base]/ProcedureRequest?status=active                                                | GET [base]/ProcedureRequest?status=active<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                   |
| GET [base]/ImmunizationRecommendation                                                    | GET [base]/ImmunizationRecommendation<b>?patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                                       |
| GET [base]/DeviceRequest?status=active&_include=DeviceRequest:device                     | GET [base]/DeviceRequest?status=active&_include=DeviceRequest:device<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                        |
| GET [base]/Appointment?status=booked,pending,proposed                                    | GET [base]/Appointment?status=booked,pending,proposed<b>&patient=http://fhir.nl/fhir/NamingSystem/bsn\|[BSN from Authorization Credential]</b>                                       |




Sequence Diagram

Als iemand binnen thuis-organisatie C de data wil inzien van ziekenhuis B, zullen de systemen van organisatie C, organisatie B en de Care Plan/Team Service (organisatie A) moeten interacteren met elkaar. Dit wordt in het volgende sequence beschreven. Doel hiervan is om de individuele transacties per systeem en de lokalisatie van data inzichtelijk te maken. Enkele stappen als de user-authenticatie, ophalen van de autorisatieserver-url of de access-token validatie zijn weggelaten om het schema overzichtelijk te houden.

![Alt text](https://github.com/SanteonNL/shared-care-planning/blob/main/input/images/example1-retrievingdata.png?raw=true "a title")

[TODO: beschrijving per stap].
