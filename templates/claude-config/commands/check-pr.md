# PR Rules Check Command

Use `.ai/core-rules.md` + supporting rules to review the PR.

## Review Process

### 1. Load Rules
- Load `.ai/core-rules.md` (always applicable)
- Load supporting rules based on PR content:
  - `.ai/architecture-rules.md` (for API/architecture changes)
  - `.ai/observability-rules.md` (for features with monitoring needs)
  - `.ai/security-rules.md` (for security-sensitive changes)
  - `.ai/feature-flag-rules.md` (for feature flag usage)

### 2. Core Rules Validation
Pass/fail each Core rule with evidence links:

#### ✅ Outcome (Core)
- [ ] Problem clearly described
- [ ] Business outcome specified
- [ ] Link to originating ticket/issue provided

#### ✅ Risk & Rollback (Core)
- [ ] Risk level assessed (Low/Medium/High)
- [ ] Rollback strategy documented
- [ ] Risk mitigation plans included

#### ✅ AI Assistance (Core)
- [ ] AI tool usage disclosed
- [ ] External code sourcing documented
- [ ] License compliance verified
- [ ] Security pattern review completed

#### ✅ Tests (Core)
- [ ] Unit tests provided with link
- [ ] Integration tests provided with link
- [ ] Coverage percentage specified with link
- [ ] Test results accessible

#### ✅ Security (Core)
- [ ] Secrets scan completed with link
- [ ] SAST scan completed with link
- [ ] SCA/License scan completed with link
- [ ] No high/critical vulnerabilities

#### ✅ Observability (Core)
- [ ] New metrics/traces/logs documented
- [ ] Observability changes linked
- [ ] Dashboard updates specified

#### ✅ Provenance/SBOM (Core)
- [ ] Build artifacts signed
- [ ] SBOM generated and linked
- [ ] Supply chain security validated

#### ✅ Approvals (Core)
- [ ] Required reviewers specified
- [ ] High-risk changes have security/arch review

### 3. Conditional Rules Assessment
Mark Conditional rules as N/A with rationale if not relevant:

#### 🔍 Mutation Testing (Conditional)
- **Applies to**: Critical business logic changes
- **Required if**: Core business logic modified
- **N/A if**: UI-only changes, documentation updates

#### 🔍 AuthN/AuthZ Tests (Conditional)
- **Applies to**: Authentication/authorization changes
- **Required if**: Security boundaries modified
- **N/A if**: Non-security related changes

#### 🔍 Performance Benchmarks (Conditional)
- **Applies to**: Performance-critical code paths
- **Required if**: Hot paths modified
- **N/A if**: Configuration or documentation changes

#### 🔍 DB/Cache Review (Conditional)
- **Applies to**: Database or cache modifications
- **Required if**: Data layer changes
- **N/A if**: Frontend-only changes

#### 🔍 Migration Plan (Conditional)
- **Applies to**: Database schema changes
- **Required if**: Data structure modifications
- **N/A if**: No data changes

#### 🔍 Dashboards/Alerts (Conditional)
- **Applies to**: Features requiring monitoring
- **Required if**: New functionality added
- **N/A if**: Bug fixes without new features

#### 🔍 Feature Flags (Conditional)
- **Applies to**: New features or risky changes
- **Required if**: Gradual rollout needed
- **N/A if**: Low-risk bug fixes

#### 🔍 DAST/Smoke Tests (Conditional)
- **Applies to**: External-facing changes
- **Required if**: API or UI changes
- **N/A if**: Internal-only changes

### 4. Generate Feedback
For each missing or incomplete item:
- **Identify the gap** with specific rule reference
- **Suggest concrete improvements** with examples
- **Provide evidence link requirements**
- **Offer implementation guidance**

### 5. Summarize Readiness
Provide clear assessment:
- **Ready to merge**: All Core rules satisfied, Conditional rules appropriately handled
- **Needs work**: Specific items that must be addressed
- **Next steps**: Prioritized list of improvements needed

## Example Output Format

```markdown
## 🔍 PR Rules Check Report

### Core Rules Status
- ✅ **Outcome**: Clear problem description and business outcome
- ⚠️ **Tests**: Unit tests provided but integration test link missing
- ❌ **Security**: SAST scan results not linked
- ✅ **Observability**: Metrics properly documented

### Conditional Rules Assessment
- 🔍 **Performance**: N/A (UI-only changes)
- 🔍 **Migration Plan**: N/A (no database changes)
- ⚠️ **Feature Flags**: Consider adding for gradual rollout

### Required Actions
1. Add integration test link: [GitHub Actions run URL]
2. Provide SAST scan results: [Security scan link]
3. Consider feature flag for safe deployment

### Ready to Merge: ❌ (2 Core rule violations)
```

## Usage Instructions

1. **Copy command files** to your repository's `.claude/` directory
2. **Customize rules** in `.ai/` directory for your organization
3. **Run `/check-pr`** in Claude interface for PR reviews
4. **Iterate on rules** based on team feedback and usage

