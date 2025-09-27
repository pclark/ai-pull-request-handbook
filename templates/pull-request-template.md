# Pull Request Template

Copy this template into your repository's `.github/PULL_REQUEST_TEMPLATE.md` or use it directly in your PR descriptions.

---

## ### Outcome (Core)
What problem and outcome does this change deliver? Link to ticket/issue.

<!-- Example:
Adds a new refund API endpoint to allow customers to request refunds.
Ticket: [JIRA-1234](https://jira/ticket/1234)
-->

## ### Risk & Rollback (Core)
- **Risk level**: [ ] Low [ ] Medium [ ] High
- **Rollback strategy**: [Describe revert/flag/config flip approach]

<!-- Example:
- Risk level: Medium
- Rollback strategy: Disable via feature flag `refunds.api.enabled` or revert commit.
-->

## ### AI Assistance (Core)
- **Was AI (e.g., Copilot, Claude) used?** [Where/how?]
- **Any external code copied in?** [License cleared?]
- **Insecure patterns reviewed**: [ ] ✅ [ ] ❌

<!-- Example:
- Claude Code suggested test case scaffolding.
- Copilot generated initial data validation logic.
- Insecure patterns reviewed: ✅
-->

## ### Tests
- **Unit tests (Core)**: [ ] ✅ [link]
- **Integration/Contract tests (Core)**: [ ] ✅ [link]
- **Changed-lines coverage (Core)**: __% (bar = __%) [link]
- **Mutation testing on critical paths (Conditional)**: score __ (target ≥ 60%) [link/waiver]

<!-- Example:
- Unit tests: ✅ [link to GitHub Actions run](https://github.com/org/repo/actions/runs/1111)
- Integration tests: ✅ [link to Pact test run](https://ci/job/222)
- Changed-lines coverage: 87% (bar = 80%) [Codecov link]
- Mutation testing on critical paths: score 65% [Mutmut report]
-->

## ### Security
- **Secrets scan (Core)**: [ ] ✅ [link]
- **SAST (Core)**: 0 High/Critical [ ] ✅ [link]
- **SCA/License (Core)**: 0 High/Critical [ ] ✅ [link]
- **AuthN/AuthZ tests (Conditional)**: [ ] ✅ [link]

<!-- Example:
- Secrets scan: ✅ [Gitleaks run]
- SAST: 0 High/Critical ✅ [CodeQL scan]
- SCA/License: 0 High/Critical ✅ [Dependabot report]
- AuthN/AuthZ tests: ✅ [Test file permalink]
-->

## ### Performance
- **Hot-path micro-bench/regression (Conditional)**: [link]
- **DB/cache queries reviewed (Conditional)**: [ ] ✅ [ ] ❌ [comment or link]

<!-- Example:
- Performance regression tests: ✅ [Benchmark results](https://ci/benchmark/333)
- DB queries reviewed: ✅ [Query plan analysis in PR comment]
-->

## ### Compatibility & Data
- **Backward/forward compatibility (Core)**: [ ] ✅
- **Migration plan (Conditional)**: [migrations/PLAN.md + job link]

<!-- Example:
- Backward/forward compatibility: ✅ (API versioning maintained)
- Migration plan: [migrations/PLAN.md](https://github.com/org/repo/blob/main/migrations/PLAN.md) + [migration job](https://ci/migration/444)
-->

## ### Observability
- **New metrics/traces/logs (Core)**: [code/dashboards links]
- **Dashboards/alerts updated (Conditional)**: [ ] ✅ [Grafana/Prom link]

<!-- Example:
- New metrics: `refunds_api_requests_total` (Prometheus counter)
- Trace span: `RefundAPI.RefundRequest`
- Dashboards updated: ✅ [Grafana dashboard link]
-->

## ### Feature Flags (Conditional)
- **Flag/key + default state**: [link]
- **Kill switch described**: [Description]

<!-- Example:
- Feature flag: `refunds.api.enabled` (default: false)
- Kill switch: Disable via config or feature flag to immediately stop refund processing
-->

## ### Provenance/SBOM (Core)
- **Build artifact signed + SBOM attached**: [link]

<!-- Example:
- Build artifact signed: ✅ [SBOM artifact](https://github.com/org/repo/releases/download/v1.2.3/artifact.sbom)
-->

## ### DAST/Smoke (Conditional)
- **External surface tests passed**: [link]

<!-- Example:
- DAST tests: ✅ [OWASP ZAP scan results](https://security/scan/555)
-->

## ### Approvals (Core)
- [ ] Two reviewers
- [ ] High-risk changes reviewed by security/arch

<!-- Example:
- Two reviewers: ✅ @alice @bob
- Security review: ✅ @security-team (required for payment processing changes)
-->

---

## 📋 Checklist for Reviewers

### Automated Checks
- [ ] All Core sections completed
- [ ] Evidence links provided and working
- [ ] CI/CD pipeline passed
- [ ] Security scans completed

### Human Review Focus
- [ ] Design and architecture reviewed
- [ ] Business alignment confirmed
- [ ] Risk assessment completed
- [ ] Maintainability evaluated

---

## 🔗 Related Resources

- [Handbook: Rules & Configuration](../../docs/rules.md)
- [Handbook: Automation Setup](../../docs/automation.md)
- [Evidence Links Reference](../../docs/references.md)

---

**Note**: This template follows the AI-Enhanced Pull Request Handbook standards. For questions or improvements, see our [Contributing Guide](../../CONTRIBUTING.md).

