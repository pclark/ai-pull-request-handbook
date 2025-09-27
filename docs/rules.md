# Rules & Configuration

## Rules Files Overview

The AI-Enhanced Pull Request system uses a hierarchical rules structure to ensure consistent quality across all pull requests while allowing flexibility for different contexts and domains.

### Rule File Structure

```
.ai/
├── core-rules.md              # Universal requirements (always applied)
├── architecture-rules.md      # Supporting rules for architecture decisions
├── observability-rules.md     # Supporting rules for monitoring and metrics
├── security-rules.md          # Supporting rules for security practices
├── feature-flag-rules.md      # Supporting rules for feature flag usage
└── release-rules.md           # Additional rules for batch releases
```

### Rules Reuse: Implementation vs. PR Gate

#### **Core Rules** (Universal)
- Applied to every PR regardless of context
- Enforced by CI/CD automation
- Required for merge approval

#### **Supporting Rules** (Contextual)
- Applied when relevant to the change
- Guide developers during implementation
- Become additional gates during PR review when applicable

#### **Domain-Specific Rules** (Specialized)
- Applied for specific domains (e.g., NASA Power of 10, medical device regulations)
- Overlay on top of Core and Supporting rules
- May include additional validation requirements

### Rule Application Process

1. **During Implementation**: Rules guide developers in writing code
2. **During PR Review**: Rules become validation gates
3. **AI Integration**: AI assistants load and enforce relevant rule files
4. **CI Integration**: Automated checks validate rule compliance

---

## Core vs. Conditional Rules

### Core Rules (Always Required)

These rules apply to every pull request and must be satisfied before merge:

#### **Outcome**
- Clear description of the problem being solved
- Link to originating ticket or issue
- Expected business outcome

#### **Risk & Rollback**
- Risk assessment (Low/Medium/High)
- Documented rollback strategy
- Mitigation plans for identified risks

#### **AI Assistance Disclosure**
- Declaration of AI tool usage (Copilot, Claude, etc.)
- External code sourcing and license verification
- Security pattern review confirmation

#### **Unit + Integration Tests**
- Unit test coverage for new/changed code
- Integration test validation
- Contract test compliance (where applicable)

#### **Coverage**
- Code coverage percentage for changed lines
- Coverage threshold compliance
- Link to coverage reports

#### **Secrets Scan**
- No secrets or credentials in code
- Automated secrets scanning results
- Link to scan output

#### **SAST (Static Analysis Security Testing)**
- No high or critical security vulnerabilities
- Static analysis tool results
- Link to SAST reports

#### **SCA/License Checks**
- No high or critical dependency vulnerabilities
- License compliance verification
- Link to dependency scan results

#### **Compatibility (Backward/Forward)**
- API versioning maintained
- Database schema compatibility
- Breaking change documentation

#### **Observability (Metrics/Traces/Logs)**
- New metrics defined and implemented
- Tracing spans added for new functionality
- Logging improvements documented

#### **Provenance & SBOM**
- Build artifacts signed and verified
- Software Bill of Materials (SBOM) generated
- Supply chain security validation

#### **Approvals**
- Minimum reviewer requirements met
- Security/architecture review for high-risk changes
- Approval workflow compliance

### Conditional Rules (When Relevant)

These rules apply based on the type of change or context:

#### **Mutation Testing** (Critical Paths)
- Mutation test coverage for critical business logic
- Target score ≥ 60%
- Waiver documentation if not applicable

#### **AuthN/AuthZ Tests**
- Authentication flow testing
- Authorization permission validation
- Security boundary verification

#### **Performance Benchmarks**
- Hot-path performance regression testing
- Micro-benchmark validation
- Load testing for critical endpoints

#### **DB/Cache Review**
- Database query optimization review
- Cache invalidation strategy
- Data consistency validation

#### **Migration Plan**
- Database migration scripts
- Data transformation procedures
- Rollback migration procedures

#### **Dashboards/Alerts**
- Monitoring dashboard updates
- Alert rule configuration
- SLA/SLO impact assessment

#### **Feature Flags**
- Feature flag configuration
- Kill switch implementation
- Gradual rollout strategy

#### **DAST/Smoke Tests**
- Dynamic Application Security Testing
- Smoke test automation
- External surface validation

---

## Release Rules (Batch Delivery)

For teams using batch/release train delivery models, additional rules apply in addition to Core and Conditional rules.

### Release Manifest Requirements

- **Release Overview**: ID, date, owners, on-call contacts
- **Scope Documentation**: All PRs/topics included in release
- **Risk Assessment**: Combined risk evaluation
- **Rollback Strategy**: Release-level rollback plan

### Integrated Testing

- **Regression Suite**: Full regression testing at release level
- **Performance Testing**: Combined performance validation
- **Integration Testing**: Cross-feature integration validation
- **Smoke Testing**: Post-deployment smoke test execution

### Migration Coordination

- **Cross-Feature Dependencies**: Migration order coordination
- **Data Consistency**: Multi-feature data transformation
- **Rollback Coordination**: Coordinated rollback procedures
- **Timing Coordination**: Migration timing and dependencies

### Staged Rollout

- **Canary Deployment**: Gradual rollout with monitoring
- **Rollout Gates**: Error rate, latency, saturation thresholds
- **Auto-Abort Rules**: Automatic rollback triggers
- **Progressive Rollout**: Percentage-based deployment strategy

### Release Rollback Plan

- **Rollback Mechanism**: Technical rollback procedures
- **Responsible Teams**: Team ownership and escalation
- **Time Estimates**: Expected rollback duration
- **Communication Plan**: Stakeholder notification procedures

### Observability & Monitoring

- **Combined Dashboards**: Release-level monitoring views
- **Alert Validation**: Release-specific alert configuration
- **Post-Release Monitoring**: Extended monitoring period
- **Success Criteria**: Release success metrics

### Release Notes

- **Feature Summary**: New functionality delivered
- **Risk Documentation**: Known risks and mitigations
- **Owner Information**: Team and on-call contacts
- **Dependencies**: External system dependencies

---

## Rule Configuration Examples

### .ai/core-rules.md
```markdown
# Core Rules - AI-Enhanced Pull Request Handbook

## Universal Requirements

### Outcome (Core)
Every PR must clearly describe:
- Problem being solved
- Business outcome expected
- Link to originating ticket/issue

### Risk & Rollback (Core)
Every PR must include:
- Risk level assessment (Low/Medium/High)
- Documented rollback strategy
- Risk mitigation plans

### AI Assistance (Core)
Every PR must disclose:
- AI tool usage (Copilot, Claude, etc.)
- External code sourcing and licensing
- Security pattern review confirmation

[Additional core rules...]
```

### .ai/architecture-rules.md
```markdown
# Architecture Rules - Supporting Rules

## When Applied
- New API endpoints
- Database schema changes
- Service architecture modifications
- Integration patterns

## Requirements
- Architecture decision records (ADRs)
- Service boundary documentation
- API versioning compliance
- Performance impact assessment

[Additional architecture rules...]
```

### .ai/observability-rules.md
```markdown
# Observability Rules - Supporting Rules

## When Applied
- New features or endpoints
- Performance-critical changes
- Error handling modifications
- Business logic changes

## Requirements
- Metrics definition and implementation
- Tracing span configuration
- Log level and format consistency
- Dashboard and alert updates

[Additional observability rules...]
```

---

## Rule Validation Process

### AI-Assisted Validation

1. **Rule Loading**: AI assistants load relevant rule files
2. **Content Analysis**: AI analyzes PR content against rules
3. **Gap Identification**: AI identifies missing requirements
4. **Suggestion Generation**: AI proposes fixes and improvements
5. **Evidence Validation**: AI verifies evidence links and claims

### CI/CD Validation

1. **Automated Checks**: CI pipeline validates Core rules
2. **Evidence Verification**: Automated validation of links and claims
3. **Compliance Reporting**: CI generates compliance reports
4. **Gate Enforcement**: Merge blocked until Core rules satisfied

### Human Review Validation

1. **Rule Context**: Human reviewers understand rule context
2. **Business Alignment**: Reviewers validate business rule application
3. **Risk Assessment**: Human judgment on risk rule compliance
4. **Final Approval**: Human approval required for rule compliance

---

## Customizing Rules for Your Organization

### Adding New Core Rules

1. **Identify Universal Requirements**: What applies to every PR?
2. **Define Validation Criteria**: How will compliance be measured?
3. **Update Automation**: Modify CI/CD and AI tools
4. **Team Communication**: Educate teams on new requirements

### Adding Supporting Rules

1. **Define Application Context**: When do these rules apply?
2. **Create Rule Files**: Add new `.ai/[domain]-rules.md` files
3. **Update AI Integration**: Configure AI tools to load new rules
4. **Documentation**: Update team documentation and training

### Domain-Specific Rules

1. **Compliance Requirements**: Regulatory or industry-specific needs
2. **Specialized Validation**: Domain-specific compliance checks
3. **Integration**: Overlay on existing Core and Supporting rules
4. **Training**: Team education on specialized requirements

---

## Next Steps

- **[Set Up Rule Files](automation.md#rule-file-setup)** - Configure your organization's rule files
- **[Configure AI Integration](automation.md#claude-integration)** - Set up AI tools to enforce rules
- **[Implement CI/CD Validation](automation.md#github-actions)** - Automate rule compliance checking
- **[Train Your Team](user-guides.md)** - Educate teams on rule requirements

---

**Ready to implement rules?** Start with our [Automation Setup Guide](automation.md) 🔧

