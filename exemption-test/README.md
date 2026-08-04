# Exemption Policy Enforcement Test Fixtures

Branch: `exemption-policy-test`

Used by Harness pipeline **Exemption_Policy_Enforcement_TEST** in `SSCA_Sanity_Automation`.

## Violating dependency

Both targets pin **`nock@14.0.17`** (recent publish date). The `SBOM_Package_Age` policy set (`cooldown_days: 100`) should deny it during enforcement.

## Layout

| Path | Harness target | Purpose |
|------|----------------|---------|
| `exemption-test/target-a/` | Code Repo workspace A | Primary exemption request target |
| `exemption-test/target-b/` | Code Repo workspace B | Cross-target scope validation |
| `exemption-test/Dockerfile` | Docker artifact | Artifact SBOM + enforcement |

## Workflow

1. Run baseline pipeline stage → enforcement **fails** on `nock`
2. Request exemption from SBOM UI (Code Repositories or Artifacts)
3. Approve at chosen scope (Target / Project / Org / Account)
4. Re-run the same stage → enforcement **passes**; check `ExemptedComponents` output
