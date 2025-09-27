# Example PR Description

This is a real-world example of a completed PR description following the AI-Enhanced Pull Request Handbook template.

---

## Pull Request: Add Refund API Endpoint

**PR #1234** | **Author**: @alice | **Reviewers**: @bob, @charlie

### Outcome (Core)
Adds a new refund API endpoint to allow customers to request refunds for completed transactions. This feature enables self-service refunds and reduces customer support workload.

**Business Impact**: Expected to reduce refund-related support tickets by 40% and improve customer satisfaction scores.

**Ticket**: [JIRA-1234](https://jira.company.com/browse/PAY-1234)

### Risk & Rollback (Core)
- **Risk level**: Medium
- **Rollback strategy**: 
  - Immediate: Disable via feature flag `refunds.api.enabled` (config change)
  - Fallback: Revert commit and redeploy
  - Data: Refund records are immutable, no data rollback needed
- **Mitigation**: 
  - Feature flag for gradual rollout
  - Comprehensive error handling and logging
  - Rate limiting to prevent abuse

### AI Assistance (Core)
- **AI tools used**: 
  - Claude Code: Suggested test case scaffolding and error handling patterns
  - GitHub Copilot: Generated initial data validation logic and API documentation
- **External code**: None
- **License compliance**: N/A (no external code)
- **Insecure patterns reviewed**: ✅ (validated by security team)

### Tests
- **Unit tests (Core)**: ✅ [GitHub Actions run](https://github.com/company/payment-api/actions/runs/12345678) - 47 tests passed
- **Integration tests (Core)**: ✅ [Pact contract tests](https://ci.company.com/job/payment-api-integration/123) - All contracts validated
- **Changed-lines coverage (Core)**: 87% (bar = 80%) [Codecov report](https://codecov.io/gh/company/payment-api/commit/abc123def)
- **Mutation testing on critical paths (Conditional)**: score 72% (target ≥ 60%) [Mutmut report](https://ci.company.com/mutation/run-456) - N/A for this change (business logic is straightforward)

### Security
- **Secrets scan (Core)**: ✅ [GitHub secret scanning](https://github.com/company/payment-api/security/secret-scanning) - No secrets found
- **SAST (Core)**: 0 High/Critical ✅ [CodeQL scan](https://github.com/company/payment-api/security/code-scanning) - No vulnerabilities detected
- **SCA/License (Core)**: 0 High/Critical ✅ [Dependabot report](https://github.com/company/payment-api/security/dependabot) - All dependencies secure
- **AuthN/AuthZ tests (Conditional)**: ✅ [Auth test file](https://github.com/company/payment-api/blob/main/tests/auth/test_refund_permissions.py) - Permission validation tested

### Performance
- **Hot-path micro-bench/regression (Conditional)**: ✅ [Benchmark results](https://ci.company.com/benchmark/run-789) - No regression detected
- **DB/cache queries reviewed (Conditional)**: ✅ [Query analysis](https://github.com/company/payment-api/pull/1234#issuecomment-987654321) - Optimized with proper indexing

### Compatibility & Data
- **Backward/forward compatibility (Core)**: ✅ (New endpoint, no breaking changes to existing APIs)
- **Migration plan (Conditional)**: N/A (no database schema changes)

### Observability
- **New metrics/traces/logs (Core)**: 
  - Metrics: `refunds_api_requests_total`, `refunds_api_duration_seconds`, `refunds_api_errors_total`
  - Traces: `RefundAPI.RefundRequest` span with full request context
  - Logs: Structured logging with request ID, user ID, and refund amount
- **Dashboards/alerts updated (Conditional)**: ✅ [Grafana dashboard](https://grafana.company.com/d/refunds-api) - Real-time monitoring configured

### Feature Flags (Conditional)
- **Flag/key + default state**: `refunds.api.enabled` (default: false)
- **Kill switch described**: Disable via config to immediately stop refund processing and return 503 Service Unavailable

### Provenance/SBOM (Core)
- **Build artifact signed + SBOM attached**: ✅ [SBOM artifact](https://github.com/company/payment-api/releases/download/v1.2.3/payment-api-v1.2.3.sbom)

### DAST/Smoke (Conditional)
- **External surface tests passed**: ✅ [OWASP ZAP scan](https://security.company.com/scan/12345) - No security issues found

### Approvals (Core)
- **Two reviewers**: ✅ @bob, @charlie
- **High-risk changes reviewed by security/arch**: ✅ @security-team (required for payment processing changes)

---

## 🔍 AI Gate Check Results

**Claude Analysis:**
```
## PR Rules Check Report

### Core Rules Status
- ✅ **Outcome**: Clear problem description and business outcome
- ✅ **Risk & Rollback**: Comprehensive risk assessment with multiple rollback strategies
- ✅ **AI Assistance**: Proper disclosure of AI tool usage
- ✅ **Tests**: Complete test coverage with evidence links
- ✅ **Security**: All security scans completed with clean results
- ✅ **Observability**: Comprehensive monitoring and alerting setup
- ✅ **Approvals**: Required reviewers and security team approval

### Conditional Rules Assessment
- 🔍 **Performance**: ✅ Benchmark testing completed
- 🔍 **AuthN/AuthZ**: ✅ Permission testing implemented
- 🔍 **Migration Plan**: N/A (no database changes)
- 🔍 **Feature Flags**: ✅ Proper feature flag implementation

### Ready to Merge: ✅ (All requirements satisfied)
```

---

## 🤖 CI/CD Validation Results

**GitHub Actions Report:**
```
## 🔍 PR Rules Check Report
✅ Outcome
✅ Risk & Rollback  
✅ AI Assistance
✅ Tests
✅ Security
✅ Observability
✅ Approvals

**Status**: All Core rules satisfied! Ready for human review.
```

---

## 👥 Human Review Summary

**Reviewer Feedback:**
- **@bob**: "Excellent implementation with comprehensive error handling. The feature flag approach is perfect for safe rollout."
- **@charlie**: "Great observability setup. The metrics and dashboards will help us monitor the feature effectively."
- **@security-team**: "Security review passed. The permission model is correctly implemented."

**Final Status**: ✅ **Approved and Merged**

---

## 📊 Post-Deployment Results

**24 Hours Post-Deployment:**
- ✅ **Deployment**: Successful rollout to 10% of traffic
- ✅ **Metrics**: 150 refund requests processed, 0 errors
- ✅ **Performance**: Average response time 120ms (within SLA)
- ✅ **Monitoring**: All dashboards green, no alerts triggered

**Business Impact:**
- 📈 **Support Tickets**: 35% reduction in refund-related tickets
- 😊 **Customer Satisfaction**: +12% improvement in refund experience scores
- 💰 **Cost Savings**: $2,400/month reduction in support costs

---

## 🎯 Key Success Factors

1. **Comprehensive Testing**: Unit, integration, and security tests all passed
2. **Evidence-Based Validation**: All quality measures backed by concrete evidence
3. **Risk Management**: Multiple rollback strategies and gradual rollout
4. **Observability**: Complete monitoring and alerting setup
5. **Team Collaboration**: Clear communication and focused reviews

---

**This example demonstrates how the AI-Enhanced Pull Request Handbook enables high-quality, evidence-based code changes with comprehensive validation and smooth team collaboration.** ✅

