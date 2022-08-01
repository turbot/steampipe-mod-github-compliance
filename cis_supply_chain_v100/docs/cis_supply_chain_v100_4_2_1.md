## Description

Software certification is used to verify the safety of certain software usage and to establish trust between the supplier and the consumer. Any artifact can be certified. Limit which artifacts any given factor is authorized to certify.

## Rationale

Artifact certification is a powerful tool in establishing trust. Clients use a software certificate to verify that the artifact is safe to use according to their security policies. Because of this, certifying artifacts is considered sensitive. If an artifact is for debugging or internal use, or if it was compromised, the organization would not want certification. An attacker gaining access to both certification factor and the artifact registry might also be able to certify its own artifact and cause a major breach. To prevent these issues, limit which artifacts can be certified by which platform so there will be minimal access to certification.

## Audit

Ensure only certain artifacts can be certified by certain parties.

## Remediation

Limit which artifact can be certified by which factor.
