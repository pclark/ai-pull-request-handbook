# User Guides

## Developer Quick Start (1-Pager)

### 🚀 Get Up and Running in 5 Minutes

#### Step 1: Copy the PR Template
```bash
# Copy the template to your repository
cp templates/pull-request-template.md .github/PULL_REQUEST_TEMPLATE.md
```

#### Step 2: Fill Core Sections with Evidence Links
Use the PR template and provide links to:
- **Tests**: GitHub Actions runs, test results
- **Security**: SAST/DAST scan results, dependency checks
- **Coverage**: Codecov or similar coverage reports
- **Observability**: Dashboard links, metrics definitions

#### Step 3: Mark Conditional Items N/A (if not relevant)
For items that don't apply to your change:
- **Mutation Testing**: N/A for UI-only changes
- **Performance Benchmarks**: N/A for configuration changes
- **Migration Plan**: N/A for frontend-only changes
- **Feature Flags**: N/A for low-risk bug fixes

#### Step 4: Run AI Gate Check
**With GitHub Copilot:**
```
In VS Code Copilot Chat: "Check my PR against .ai/core-rules.md"
```

**With Claude:**
```
In terminal or Claude interface: /check-pr
```

#### Step 5: Fix Gaps and Push Updates
- Add missing tests, security scans, or documentation
- Update PR description with evidence links
- Push changes and re-run AI gate check

#### Step 6: CI Enforces Core Rules
- GitHub Actions validates all Core sections
- Automated checks ensure compliance
- Merge blocked until all Core rules satisfied

#### Step 7: Human Reviewers Evaluate
Reviewers focus on:
- **Design quality**: Architecture and business logic
- **Risk assessment**: Production impact and tradeoffs
- **Maintainability**: Code clarity and future extensibility

#### Step 8: Merge When All Gates Satisfied
- All Core rules validated by AI and CI
- Human reviewers approve design and risk
- PR merges to production-ready state

---

## Day in the Life of a PR (Example Walkthrough)

### 🌅 Morning: Starting Your Feature

#### 9:00 AM - Feature Development Complete
You've finished coding your feature branch:
- ✅ Added new API endpoint `/v1/payments/refund`
- ✅ Wrote unit tests for the happy path
- ✅ CI pipeline has already run unit and integration tests
- ✅ Feature is functionally complete

#### 9:15 AM - Opening Your Pull Request
You open a Pull Request in GitHub, and the template auto-fills:

```markdown
### Outcome (Core)
What problem and outcome does this change deliver? Link to ticket/issue.

### Risk & Rollback (Core)
- Risk level: Low | Medium | High
- Rollback strategy: revert/flag/config flip

### AI Assistance (Core)
- Was AI (e.g., Copilot, Claude) used? Where/how?
- Any external code copied in? License cleared?
- Insecure patterns reviewed: ✅/❌
```

### 🌞 Mid-Morning: Filling Out the Template

#### 9:30 AM - Completing Core Sections
You fill in the template with your specific details:

```markdown
### Outcome (Core)
Adds a new refund API endpoint to allow customers to request refunds.
Ticket: [JIRA-1234](https://jira.company.com/ticket/1234)

### Risk & Rollback (Core)
- Risk level: Medium
- Rollback strategy: Disable via feature flag `refunds.api.enabled` or revert commit.

### AI Assistance (Core)
- Claude Code suggested test case scaffolding.
- Copilot generated initial data validation logic.
- Insecure patterns reviewed: ✅
```

### 🤖 Late Morning: Running AI Gate Check

#### 10:00 AM - GitHub Copilot Check
In VS Code Copilot Chat, you type:
```
"Check my PR against .ai/core-rules.md"
```

Copilot replies:
```
✅ Outcome provided
⚠️ No coverage % listed
⚠️ No security scan link provided
⚠️ Missing observability metrics
```

#### 10:15 AM - Claude Code Check
In the terminal or Claude interface, you run:
```
/check-pr
```

Claude replies with a detailed checklist:
```
## 🔍 PR Rules Check Report

### Core Rules Status
- ✅ **Outcome**: Clear problem description and business outcome
- ⚠️ **Tests**: Unit test link missing
- ❌ **Security**: SAST scan results not linked
- ❌ **Observability**: No metrics/traces for refund API

### Required Actions
1. Add unit test link: [GitHub Actions run URL]
2. Provide SAST scan results: [Security scan link]
3. Add observability metrics for refund API
4. Consider feature flag for safe deployment

### Ready to Merge: ❌ (3 Core rule violations)
```

### 🔧 Afternoon: Fixing Gaps

#### 1:00 PM - Adding Missing Evidence
You add the missing information to your PR:

```markdown
### Tests
- Unit tests: ✅ [link to GitHub Actions run](https://github.com/company/api/actions/runs/1111)
- Integration tests: ✅ [link to Pact test run](https://ci.company.com/job/222)
- Changed-lines coverage: 87% (bar = 80%) [Codecov link]
- Mutation testing on critical paths: score 65% [Mutmut report]

### Security
- Secrets scan: ✅ [Gitleaks run](https://github.com/company/api/security/secret-scanning)
- SAST: 0 High/Critical ✅ [CodeQL scan](https://github.com/company/api/security/code-scanning)
- SCA/License: 0 High/Critical ✅ [Dependabot report](https://github.com/company/api/security/dependabot)

### Observability
- New metrics: `refunds_api_requests_total` (Prometheus counter)
- Trace span: `RefundAPI.RefundRequest`
- Dashboards updated: ✅ [Grafana dashboard link](https://grafana.company.com/d/refunds-api)
```

#### 1:30 PM - Pushing Updates
You push your updated PR description and wait for the GitHub Action to run.

### 🤖 Late Afternoon: CI Validation

#### 3:00 PM - GitHub Action Runs
The PR Rules Check GitHub Action runs and posts a comment:

```markdown
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

### 👥 Evening: Human Review

#### 4:00 PM - Reviewer Opens Your PR
Your team lead opens your PR for review. Instead of asking basic questions like "Did you test this?", they see:

- ✅ Links to unit + integration tests
- ✅ Codecov showing 87% coverage
- ✅ CodeQL scan results with 0 high/critical issues
- ✅ Observability metrics + Grafana dashboard
- ✅ Feature flag strategy for safe rollout

#### 4:30 PM - Focused Review
The reviewer can now focus on what matters:
- 🏗️ **Is the refund API design correct?**
- 🛡️ **Is the error handling robust?**
- 📊 **Is the business logic aligned with product requirements?**
- 🔮 **Will this be maintainable in 6 months?**

#### 5:00 PM - Approval and Merge
Because AI + CI caught all the mechanical issues early, the review is fast and focused:
- ✅ Reviewer approves the design and implementation
- ✅ PR merges to main branch
- ✅ Feature flag keeps rollout safe
- ✅ You can deploy with confidence

### 🌙 End of Day: Confidence and Sleep

#### 6:00 PM - Deployment Success
- ✅ Feature flag enables the new refund API
- ✅ Monitoring dashboards show healthy metrics
- ✅ No production issues or errors
- ✅ Customer feedback is positive

#### 11:00 PM - Peaceful Sleep
You sleep well knowing you've provided evidence for:
- ✅ Quality (tests and coverage)
- ✅ Security (scans and reviews)
- ✅ Observability (metrics and dashboards)
- ✅ Risk management (rollback strategy)

---

## Key Takeaways

### For Developers
Your job is now easier:
1. **Follow the PR template** - Structured approach to PR creation
2. **Run AI Gate Checks** - Automated validation and suggestions
3. **Provide evidence links** - Concrete proof of quality measures
4. **Let CI enforce rules** - Automated compliance checking
5. **Focus on design** - Human reviewers focus on what matters

### For Reviewers
Review quality improves:
1. **Less nitpicking** - Mechanical issues caught by AI/CI
2. **More design focus** - Time spent on architecture and business logic
3. **Evidence-based reviews** - Links to tests, scans, and metrics
4. **Faster reviews** - Less time spent on checklist validation
5. **Higher confidence** - Comprehensive quality assurance

### For Teams
Overall productivity increases:
1. **Consistent quality** - Standardized PR requirements
2. **Faster feedback** - AI-assisted gap identification
3. **Reduced risk** - Comprehensive validation before merge
4. **Better documentation** - Evidence links create audit trail
5. **Improved culture** - Focus on quality and collaboration

---

## Common Scenarios

### Scenario 1: UI-Only Changes
**What to mark N/A:**
- Mutation testing (no critical business logic)
- Database migration plan (no data changes)
- Performance benchmarks (no hot paths modified)

**What to focus on:**
- Unit tests for component logic
- Integration tests for user interactions
- Accessibility testing
- Visual regression testing

### Scenario 2: Database Schema Changes
**What's required:**
- Migration plan with rollback procedures
- Database query optimization review
- Data integrity testing
- Performance impact assessment

**What to mark N/A:**
- UI component testing (if no UI changes)
- Frontend performance benchmarks

### Scenario 3: Security-Sensitive Changes
**What's required:**
- Enhanced security scanning
- Authentication/authorization testing
- Penetration testing (if applicable)
- Security review by security team

**What to focus on:**
- Threat modeling
- Attack surface analysis
- Security monitoring and alerting

### Scenario 4: Performance-Critical Changes
**What's required:**
- Performance benchmark testing
- Load testing results
- Memory usage analysis
- CPU utilization monitoring

**What to mark N/A:**
- UI accessibility testing (if no UI changes)
- Database migration (if no schema changes)

---

## Troubleshooting Common Issues

### Issue: AI Gate Check Fails
**Problem**: Claude or Copilot reports missing requirements
**Solution**: 
1. Review the specific missing items
2. Add evidence links for missing requirements
3. Mark Conditional items as N/A if not applicable
4. Re-run the AI gate check

### Issue: CI Validation Fails
**Problem**: GitHub Action reports Core rule violations
**Solution**:
1. Check the CI logs for specific failures
2. Ensure all Core sections are completed
3. Verify evidence links are accessible
4. Fix formatting issues in PR description

### Issue: Reviewer Asks for Evidence
**Problem**: Human reviewer requests proof of quality measures
**Solution**:
1. Point to evidence links in PR description
2. Provide additional context if needed
3. Update PR description with more detail
4. Consider if additional evidence is needed

### Issue: Merge Blocked
**Problem**: PR cannot be merged due to validation failures
**Solution**:
1. Check all Core rules are satisfied
2. Verify CI/CD pipeline passes
3. Ensure human reviewers have approved
4. Contact team lead if unclear requirements

---

## Next Steps

- **[Automation Setup](automation.md)** - Configure AI and CI/CD integration
- **[Templates](templates/)** - Copy-paste ready templates
- **[References](references.md)** - Evidence links and validation guides
- **[Delivery Models](delivery-models.md)** - Choose your team's delivery approach

---

**Ready to transform your PR workflow?** Start with our [Quick Start Guide](#developer-quick-start-1-pager) and follow the [Day in the Life](#day-in-the-life-of-a-pr-example-walkthrough) example! 🚀

